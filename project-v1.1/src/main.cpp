
#include "../test/printing.hpp"
#include "../h/riscv.hpp"

extern void userMain();

int main()
{

    TCB *coroutines[2];

    MemoryAllocator::initMem();

    Riscv::w_stvec((uint64) &Riscv::vectorTable | 0b01);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    coroutines[0] = TCB::createThread(nullptr,nullptr);
    TCB::running = coroutines[0];

    thread_create(&coroutines[1], reinterpret_cast<void (*)(void *)>(userMain), nullptr);

    while(!coroutines[1]->isFinished()) {
        thread_dispatch();
    }

    return 0;
}

