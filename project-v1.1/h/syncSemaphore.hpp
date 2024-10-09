
#ifndef PROJECT_V1_1_SYNCSEMAPHORE_HPP
#define PROJECT_V1_1_SYNCSEMAPHORE_HPP

#include "list.hpp"
#include "tcb.hpp"
#include "memoryAllocator.hpp"

class SyncSemaphore
{
private:
    int semValue;
    List<TCB> blockedList;
    bool done;

public:
    explicit SyncSemaphore(int semValue = 1) { this->semValue = semValue; this->done = false;}

    static SyncSemaphore *createSyncSemaphore(int semValue = 1);

    int wait();

    int signal();

    int close();

    int tryWait();

};

#endif
