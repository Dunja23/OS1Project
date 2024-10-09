#include "../lib/hw.h"
#include "../h/memoryAllocator.hpp"


BlockHeader* MemoryAllocator::freeMemHead = nullptr;
BlockHeader* MemoryAllocator::usedMemHead = nullptr;

void *MemoryAllocator::mem_alloc(size_t size) {

    if (size % MEM_BLOCK_SIZE != 0)
        size = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;

    BlockHeader *blk = MemoryAllocator::freeMemHead;
    for (; blk != nullptr; blk = blk->next)
        if (blk->size >= size) break;

    if (blk == nullptr)
        return nullptr;

    if (blk->size > size) {

        BlockHeader* newBlk = (BlockHeader*)((char*)blk + size + sizeof(BlockHeader));;
        if (blk->prev) blk->prev->next = newBlk;
        else MemoryAllocator::freeMemHead = newBlk;

        if (blk->next) blk->next->prev = newBlk;
        newBlk->prev = blk->prev;
        newBlk->next = blk->next;

        newBlk->size = blk->size - size - sizeof(BlockHeader);
        blk->size = size;

    } else {

        if (blk->prev) blk->prev->next = blk->next;
        else MemoryAllocator::freeMemHead = blk->next;

        if(blk->next) blk->next->prev = blk->prev;
    }

    if(usedMemHead == nullptr) {
        usedMemHead = blk;
        blk->next = nullptr;
        blk->prev = nullptr;
    }
    else if((char*) blk < (char*)usedMemHead) {
        usedMemHead->prev = blk;
        blk->next = usedMemHead;
        blk->prev = nullptr;
        usedMemHead = blk;
    }
    else {
        BlockHeader* blkUsed = usedMemHead;
        for(; blkUsed->next && (char*)(blkUsed->next) < (char*) blk; blkUsed = blkUsed->next);

        blk->next = blkUsed->next;
        blk->prev = blkUsed;
        if(blk->next) blk->next->prev = blk;
        blkUsed->next = blk;
    }

    return (char*)blk + sizeof(BlockHeader);

}

int MemoryAllocator::mem_free(void* ptr) {

    if (usedMemHead == nullptr) return -1;
    if (ptr == nullptr || ptr < HEAP_START_ADDR || ptr > HEAP_END_ADDR) return -2;

    BlockHeader* cur = usedMemHead;
    while (cur != nullptr) {
        if ((char*)cur + sizeof(BlockHeader) == ptr) break;
        cur = cur->next;
    }
    if (cur == nullptr) return -3;

    BlockHeader* blockToFree = (BlockHeader*)((char*)ptr - sizeof(BlockHeader));

    if (blockToFree == usedMemHead) {
        usedMemHead = usedMemHead->next;
        if (usedMemHead) usedMemHead->prev = nullptr;
    } else {
        blockToFree->prev->next = blockToFree->next;
        if (blockToFree->next) blockToFree->next->prev = blockToFree->prev;
    }

    blockToFree->next = nullptr;
    blockToFree->prev = nullptr;

    if (!freeMemHead || (char*)blockToFree < (char*)freeMemHead) {
        blockToFree->next = freeMemHead;
        if (freeMemHead) freeMemHead->prev = blockToFree;
        freeMemHead = blockToFree;
    } else {
        cur = freeMemHead;
        while (cur->next != nullptr && (char*)(cur->next) < (char*)blockToFree) {
            cur = cur->next;
        }
        blockToFree->next = cur->next;
        blockToFree->prev = cur;
        cur->next = blockToFree;
        if (blockToFree->next) blockToFree->next->prev = blockToFree;
    }

    tryToJoin(blockToFree);
    if (blockToFree->prev) tryToJoin(blockToFree->prev);

    return 0;
}


void MemoryAllocator::tryToJoin(BlockHeader* cur) {

    if (!cur) return;
    if (cur->next && (char*)cur+cur->size+sizeof(BlockHeader)== (char*)(cur->next)) {
        cur->size += cur->next->size+sizeof(BlockHeader);
        cur->next = cur->next->next;
        if (cur->next) cur->next->prev = cur;
    }

}

