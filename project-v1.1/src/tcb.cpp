
#include "../h/tcb.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"

TCB *TCB::running = nullptr;
//mod
int TCB::nextId = -1;
//moze od 0 da se krene ali u testu 8 korisnicke niti krecu od id=2
// ( main id=0, userMain id =1 )

TCB *TCB::createThread(Body body, void* arg)
{
    TCB* tcb= new TCB(body, arg);
    Scheduler::put(tcb);
    return tcb;
}

TCB *TCB::initThread(Body body, void* arg)
{
    TCB* tcb = new TCB(body, arg);
    return tcb;
}

void TCB::dispatch()
{
    TCB *old = running;
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::put(old); }
    running = Scheduler::get();

    if(running->isMain()) {
        Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
    }
    else {
        Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    }

    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper()
{
    Riscv::popSppSpie();
    running->body(running->arg);
    thread_exit();
}

void TCB::synchronizeTCB()
{
    if(myPair == nullptr) return;

    called = true;
    if(myPair->isCalled())
    {
        called = false;
        myPair->setPairSync();
    }
    else
    {
        while(!pairSync) {
            dispatch();
        }

        called = false;
        pairSync = false;
    }

}
