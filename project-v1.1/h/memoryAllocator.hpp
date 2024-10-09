#ifndef PROJECT_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_V1_1_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

struct BlockHeader {
    BlockHeader* next;
    BlockHeader* prev;
    size_t size;
};

class MemoryAllocator {
public:

    static BlockHeader* freeMemHead;
    static BlockHeader* usedMemHead;

    static void initMem() {

        freeMemHead = (BlockHeader*)((char*)HEAP_START_ADDR);
        usedMemHead = nullptr;
        freeMemHead->size = ((char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(BlockHeader));
        freeMemHead->next = freeMemHead->prev = nullptr;

    }

    static void* mem_alloc(size_t size);

    static int mem_free(void* ptr);

    static void tryToJoin(BlockHeader* cur);

};

#endif
