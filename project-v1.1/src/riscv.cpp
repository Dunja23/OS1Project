
#include "../h/riscv.hpp"
#include "../h/tcb.hpp"
#include "../lib/console.h"
#include "../test/printing.hpp"

using Body = void (*)(void*);

void Riscv::popSppSpie()
{
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}

void Riscv::handleSoftwareInterrupt()
{
    uint64 scause = r_scause();
    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL)
    {
        // interrupt: no; cause code: environment call from U-mode(8) or S-mode(9)
        uint64 volatile sepc = r_sepc() + 4;
        uint64 volatile sstatus = r_sstatus();

        SyncSemaphore* semHandle;

        uint64 func;
        __asm__ volatile("mv %0, a0" : "=r" (func));

        switch (func) {

            // mem_alloc
            case 0x01:
                size_t size;
                __asm__ volatile("mv %0, a1" : "=r" (size));
                uint64 addr;
                addr = (uint64)MemoryAllocator::mem_alloc(size);
                __asm__ volatile("mv a0, %0" : : "r"(addr));
                __asm__ volatile ("sd a0, 80(fp)");
                break;

            // mem_free
            case 0x02:
                void* ptr;
                int ret;
                __asm__ volatile("mv %0, a1" : "=r" (ptr));
                ret = MemoryAllocator::mem_free(ptr);
                __asm__ volatile("mv a0, %0" : : "r"(ret));
                __asm__ volatile ("sd a0, 80(fp)");
                break;

            // thread_start
            case 0x09:
                TCB* tcb;
                __asm__ volatile("mv %0, a1" : "=r" (tcb));
                TCB::start(tcb);
                break;

            // thread_init
            case 0x10:
                TCB** handleInit;
                Body bodyInit;
                void* argInit;
                __asm__ volatile ("mv %0, a1" : "=r" (handleInit));
                __asm__ volatile ("mv %0, a2" : "=r" (bodyInit));
                __asm__ volatile ("mv %0, a6" : "=r" (argInit));
                *handleInit = TCB::initThread(bodyInit, argInit);
                if(*handleInit != nullptr) {
                    __asm__ volatile ("li a0, 0");
                    __asm__ volatile ("sd a0, 80(fp)");
                }
                else {
                    __asm__ volatile ("li a0, -1");
                    __asm__ volatile ("sd a0, 80(fp)");
                }
                break;

            // thread_create
            case 0x11:
                TCB** handle;
                Body body;
                void* arg;
                __asm__ volatile ("mv %0, a1" : "=r" (handle));
                __asm__ volatile ("mv %0, a2" : "=r" (body));
                __asm__ volatile ("mv %0, a6" : "=r" (arg));
                *handle = TCB::createThread(body, arg);
                if(*handle != nullptr) {
                    __asm__ volatile ("li a0, 0");
                    __asm__ volatile ("sd a0, 80(fp)");
                }
                else {
                    __asm__ volatile ("li a0, -1");
                    __asm__ volatile ("sd a0, 80(fp)");
                }
                break;

            // thread_exit
            case 0x12:
                TCB::running->setFinished(true);
                TCB::dispatch();
                __asm__ volatile ("li a0, 0");
                __asm__ volatile ("sd a0, 80(fp)");
                break;

            // thread_dispatch
            case 0x13:
                TCB::dispatch();
                break;

            // sem_open
            case 0x21:
                SyncSemaphore** sem;
                unsigned semValue;
                __asm__ volatile ("mv %0, a1" : "=r" (sem));
                __asm__ volatile ("mv %0, a2" : "=r" (semValue));
                *sem = SyncSemaphore::createSyncSemaphore((int)semValue);
                if(*sem != nullptr) {
                    __asm__ volatile ("li a0, 0");
                    __asm__ volatile ("sd a0, 80(fp)");
                }
                else {
                    __asm__ volatile ("li a0, -1");
                    __asm__ volatile ("sd a0, 80(fp)");
                }
                break;

            // sem_close
            case 0x22:
                int retClose;
                __asm__ volatile ("mv %0, a1" : "=r" (semHandle));
                if(semHandle!= nullptr) retClose = semHandle->close();
                else retClose = -2;
                __asm__ volatile ("mv a0, %0" : : "r"(retClose));
                __asm__ volatile ("sd a0, 80(fp)");
                break;

            // sem_wait
            case 0x23:
                int retWait;
                __asm__ volatile ("mv %0, a1" : "=r" (semHandle));
                if(semHandle!= nullptr) retWait = semHandle->wait();
                else retWait = -2;
                __asm__ volatile ("mv a0, %0" : : "r"(retWait));
                __asm__ volatile ("sd a0, 80(fp)");
                break;

            // sem_signal
            case 0x24:
                int retSignal;
                __asm__ volatile ("mv %0, a1" : "=r" (semHandle));
                if(semHandle!= nullptr) retSignal = semHandle->signal();
                else retSignal = -2;
                __asm__ volatile ("mv a0, %0" : : "r"(retSignal));
                __asm__ volatile ("sd a0, 80(fp)");
                break;

            // sem_trywait
            case 0x26:
                int retTryWait;
                __asm__ volatile ("mv %0, a1" : "=r" (semHandle));
                if(semHandle!= nullptr) retTryWait = semHandle->wait();
                else retTryWait = -2;
                __asm__ volatile ("mv a0, %0" : : "r"(retTryWait));
                __asm__ volatile ("sd a0, 80(fp)");
                break;

            //getc
            case 0x41:
                int retGet;
                retGet = __getc();
                __asm__ volatile ("mv a0, %0" : : "r"(retGet));
                __asm__ volatile ("sd a0, 80(fp)");
                break;

            //putc
            case 0x42:
                char c;
                __asm__ volatile ("mv %0, a1" : "=r" (c));
                __putc(c);
                break;

            //pair
            case 0x50:
                TCB* t1;
                TCB* t2;
                __asm__ volatile ("mv %0, a1" : "=r" (t1));
                __asm__ volatile ("mv %0, a2" : "=r" (t2));
                t1->setMyPair(t2);
                t2->setMyPair(t1);
                break;

            //synchronize
            case 0x51:
                TCB* t;
                __asm__ volatile ("mv %0, a1" : "=r" (t));
                t->synchronizeTCB();
                break;

            default:
                break;
        }

        w_sstatus(sstatus);
        w_sepc(sepc);
    }
    else
    {
        printString("Error: scause =  ");
        printInt(scause);
        printString("\n");
        //while(true) {};
    }

}

void Riscv::handleConsoleInterrupt() {
    console_handler();
}

void Riscv::handleTimerInterrupt() {
    mc_sip(SIP_SSIP);
}