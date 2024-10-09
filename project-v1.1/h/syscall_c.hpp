
#ifndef PROJECT_V1_1_SYSCALL_C_HPP
#define PROJECT_V1_1_SYSCALL_C_HPP

#include "../lib/hw.h"
#include "syncSemaphore.hpp"
#include "tcb.hpp"

void* mem_alloc(size_t size);

int mem_free(void* ptr);

typedef TCB* thread_t;

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);

void thread_start(thread_t tcb);

int thread_init(thread_t* handle, void (*start_routine)(void*), void* arg);

int thread_exit();

void thread_dispatch();

typedef SyncSemaphore* sem_t;

int sem_open(sem_t* handle, unsigned init);

int sem_close(sem_t handle);

int sem_wait(sem_t id);

int sem_signal(sem_t id);

int sem_timedwait(sem_t id, time_t timeout);

int sem_trywait(sem_t id);

int time_sleep(time_t time);

char getc();

void putc(char c);

//mod
void pair(thread_t t1, thread_t t2);

void synchronize(thread_t t);

#endif