#include "../h/syscall_c.hpp"
#include "../h/riscv.hpp"

void* mem_alloc(size_t size) {

    if(size%MEM_BLOCK_SIZE != 0)
        size = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    __asm__ volatile("mv a1, %0" : : "r"(size));
    __asm__ volatile("li a0, 0x01");
    __asm__ volatile("ecall");
    void* ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return ret;

}

int mem_free(void* ptr) {

    __asm__ volatile("mv a1, %0" : : "r"(ptr));
    __asm__ volatile("li a0, 0x02");
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int)ret;

}

void thread_start(thread_t handle) {

    __asm__ volatile("mv a1, %0" : : "r"(handle));
    __asm__ volatile("li a0, 0x09");
    __asm__ volatile("ecall");

}

int thread_init(thread_t* handle, void (*start_routine)(void*), void* arg){

    __asm__ volatile("mv a6, %0" : : "r"(arg));
    __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    __asm__ volatile("li a0, 0x10");
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int)ret;

}

int thread_create(thread_t* handle, void (*start_routine)(void*), void* arg) {

    __asm__ volatile("mv a6, %0" : : "r"(arg));
    __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    __asm__ volatile("li a0, 0x11");
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int)ret;

}

int thread_exit() {

    __asm__ volatile("li a0, 0x12");
    __asm__ volatile ("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int)ret;

}

void thread_dispatch() {

    __asm__ volatile("li a0, 0x13");
    __asm__ volatile ("ecall");

}

int sem_open(sem_t* handle, unsigned init) {

    __asm__ volatile("mv a2, %0" : : "r"(init));
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    __asm__ volatile("li a0, 0x21");
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int)ret;

}

int sem_close(sem_t id) {
    __asm__ volatile("mv a1, %0" : : "r"(id));
    __asm__ volatile("li a0, 0x22");
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int)ret;
}

int sem_wait(sem_t id) {

    __asm__ volatile("mv a1, %0" : : "r"(id));
    __asm__ volatile("li a0, 0x23");
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int)ret;

}

int sem_signal(sem_t id){

    __asm__ volatile("mv a1, %0" : : "r"(id));
    __asm__ volatile("li a0, 0x24");
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int)ret;

}

int sem_trywait(sem_t id){

    __asm__ volatile("mv a1, %0" : : "r"(id));
    __asm__ volatile("li a0, 0x26");
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int)ret;

}

char getc() {

    __asm__ volatile("li a0, 0x41");
    __asm__ volatile ("ecall");
    char ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return ret;

}

void putc(char c) {

    __asm__ volatile ("mv a1, %0" : : "r" (c));
    __asm__ volatile("li a0, 0x42");
    __asm__ volatile ("ecall");

}

int time_sleep(time_t time) {
    return 0;
}

int sem_timedwait(sem_t id, time_t timeout) {
    return 0;
}

//mod
void pair(thread_t t1, thread_t t2){
    __asm__ volatile("mv a2, %0" : : "r"(t2));
    __asm__ volatile("mv a1, %0" : : "r"(t1));
    __asm__ volatile("li a0, 0x50");
    __asm__ volatile ("ecall");

}

void synchronize(thread_t t){
    __asm__ volatile("mv a1, %0" : : "r"(t));
    __asm__ volatile("li a0, 0x51");
    __asm__ volatile ("ecall");
}
