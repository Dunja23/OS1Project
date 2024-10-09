
#include "printing.hpp"
#include "../h/syscall_cpp.hpp"

class A:public Thread {
public:
    explicit A():Thread() {
        printString("Created thread id= ");
        printInt(getThreadId());
        printString("\n");
    }
    
    void run() override {
        int id;
        id = getThreadId();
        for(int i = 0; i < 3; i++) {

            printString("ID: ");
            printInt(id);
            printString(": Approaching...\n");

            synchronize();

            printString("Synchronized thread id= ");
            printInt(id);
            printString("\n");

            dispatch();

        }

        printString("Thread id= ");
        printInt(id);
        printString(" is finished\n");

        dispatch();
    }

};

void modFunc() {

    Thread* threads[10];

    for (int i = 0; i < 10; i++) {
        threads[i] = new A();
    }

    Thread::pair(threads[2], threads[9]); // id 3 10
    Thread::pair(threads[5], threads[7]); // id 6 8

    for (auto &thread : threads) {
        thread->start();
    }

    for (auto &thread : threads) {
        while (!thread->isFinishedThread()) {
            Thread::dispatch();
        }
    }

    for (auto &thread : threads) {
        delete thread;
    }
}
