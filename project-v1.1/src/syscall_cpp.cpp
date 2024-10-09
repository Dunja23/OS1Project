
#include "../h/syscall_cpp.hpp"

void Thread::dispatch() {
    thread_dispatch();
}

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
}

Thread::~Thread() {
    delete myHandle;
}

int Thread::start() {
    thread_start(myHandle);
    return 0;
}

Thread::Thread() {
    thread_init(&myHandle, wrapper, this);
}

int Thread::sleep(time_t time) {
    return 0;
}

void Thread::synchronize() {
    ::synchronize(myHandle);
}

void Thread::pair(Thread *t1, Thread* t2) {
    ::pair(t1->myHandle, t2->myHandle);
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, (int)init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
    delete myHandle;
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

int Semaphore::tryWait() {
    return sem_trywait(myHandle);
}

int Semaphore::timedWait(time_t) {
    return 0;
}

void Console::putc(char c) {
    ::putc(c);
}

char Console::getc() {
    return ::getc();
}

