#include "../h/syncSemaphore.hpp"
#include "../h/syscall_c.hpp"

SyncSemaphore *SyncSemaphore::createSyncSemaphore(int semValue){
    return new SyncSemaphore(semValue);
}

int SyncSemaphore::wait()
{
    if(done) return -1;

    if(--semValue < 0) {
        blockedList.addLast(TCB::running);
        TCB::running->setBlocked(true);
        thread_dispatch();

        if(done) return -1;
    }
    return 0;
}

int SyncSemaphore::signal()
{
    if(done) return -1;

    if(++semValue <= 0) {
        TCB *tcb = blockedList.removeFirst();
        tcb->setBlocked(false);
        Scheduler::put(tcb);
    }
    return 0;
}

int SyncSemaphore::close()
{
    if (done) return -1;
    done = true;

    while (blockedList.peekFirst()) {
        TCB* tcb = blockedList.removeFirst();
        tcb->setBlocked(false);
        Scheduler::put(tcb);
    }
    return 0;
}


int SyncSemaphore::tryWait()
{
    if (done) return -1;

    if (semValue == 1) {
        --semValue;
        return 0;
    }
    else if (semValue > 0) {
        --semValue;
        return 1;
    }

    return -1;
}
