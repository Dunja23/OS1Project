
#ifndef PROJECT_V1_1_TCB_HPP
#define PROJECT_V1_1_TCB_HPP

#include "../lib/hw.h"
#include "scheduler.hpp"
#include "memoryAllocator.hpp"


class TCB
{
public:
    ~TCB() { delete[] stack; }

    bool isFinished() const { return finished; }

    void setFinished(bool value) { finished = value; }

    bool isBlocked() const { return this->blocked; }

    void setBlocked(bool value) { this->blocked = value; }

    bool isMain() const { return this->main; }

    //mod
    int getId() const { return id; }

    bool isCalled() const { return called; }

    void setMyPair(TCB *myPair) { this->myPair = myPair; }

    void synchronizeTCB();

    void setPairSync() { pairSync = true; }

    using Body = void (*)(void*);

    static TCB *createThread(Body body, void* arg);

    static TCB *initThread(Body body, void* arg);

    static void start(TCB* tcb) { Scheduler::put(tcb);}

    static TCB *running;


private:
    TCB(Body body, void* arg) :
            body(body),
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
                    }),
            finished(false),
            blocked(false),
            arg(arg),
            main(body == nullptr),
            //mod
            id(nextId++),
            called(false),
            pairSync(false),
            myPair(nullptr)

    {

    }

    struct Context
    {
        uint64 ra;
        uint64 sp;
    };

    Body body;
    uint64 *stack;
    Context context;
    bool finished;
    bool blocked;
    void* arg;
    bool main;

    //mod
    int id;
    static int nextId;

    bool called;
    bool pairSync;

    TCB* myPair;

    friend class Riscv;

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

    static void dispatch();

    static uint64 constexpr STACK_SIZE = 1024;
};

#endif