
#ifndef PROJECT_V1_1_SCHEDULER_HPP
#define PROJECT_V1_1_SCHEDULER_HPP

#include "list.hpp"

class TCB;

class Scheduler
{
private:
    static List<TCB> readyThreadQueue;

public:
    static TCB *get();

    static void put(TCB *ccb);

};

#endif

