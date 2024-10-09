
#ifndef PROJECT_V1_1_SYSCALL_CPP_HPP
#define PROJECT_V1_1_SYSCALL_CPP_HPP

#include "syscall_c.hpp"

void* operator new(size_t size);
void operator delete(void* p) noexcept;

class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();

    int start ();

    static void dispatch ();

    static int sleep (time_t time);

    // mod
    int getThreadId() { return myHandle->getId(); }
    static void pair(Thread* t1, Thread* t2);
    void synchronize();

    bool isFinishedThread(){ return myHandle->isFinished(); };

protected:
    Thread ();
    virtual void run() {};

private:
    thread_t myHandle;
    void (*body)(void*);
    void* arg;

    static void wrapper(void *thread) {
        if (thread != nullptr) {
            ((Thread *) thread)->run();
        }
    }
};

class Semaphore {
public:
    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();

    int wait ();
    int signal ();
    int timedWait (time_t);
    int tryWait ();

private:
    sem_t myHandle;
};

class Console {
public:
    static void putc(char c);
    static char getc();
};


#endif
