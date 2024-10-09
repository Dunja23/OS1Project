
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000b117          	auipc	sp,0xb
    80000004:	73013103          	ld	sp,1840(sp) # 8000b730 <_GLOBAL_OFFSET_TABLE_+0x28>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	2e0060ef          	jal	ra,800062fc <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv11vectorTableEv>:
.align 4
.global _ZN5Riscv11vectorTableEv
.type _ZN5Riscv11vectorTableEv, @function

_ZN5Riscv11vectorTableEv:
    j softwareInterruptHandler
    80001000:	02c0006f          	j	8000102c <softwareInterruptHandler>
    j timerInterruptHandler
    80001004:	1380006f          	j	8000113c <timerInterruptHandler>
	...
    .skip 28
    j consoleHandler
    80001024:	2280006f          	j	8000124c <consoleHandler>
    sret
    80001028:	10200073          	sret

000000008000102c <softwareInterruptHandler>:

softwareInterruptHandler:
    addi sp, sp, -256
    8000102c:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001030:	00013023          	sd	zero,0(sp)
    80001034:	00113423          	sd	ra,8(sp)
    80001038:	00213823          	sd	sp,16(sp)
    8000103c:	00313c23          	sd	gp,24(sp)
    80001040:	02413023          	sd	tp,32(sp)
    80001044:	02513423          	sd	t0,40(sp)
    80001048:	02613823          	sd	t1,48(sp)
    8000104c:	02713c23          	sd	t2,56(sp)
    80001050:	04813023          	sd	s0,64(sp)
    80001054:	04913423          	sd	s1,72(sp)
    80001058:	04a13823          	sd	a0,80(sp)
    8000105c:	04b13c23          	sd	a1,88(sp)
    80001060:	06c13023          	sd	a2,96(sp)
    80001064:	06d13423          	sd	a3,104(sp)
    80001068:	06e13823          	sd	a4,112(sp)
    8000106c:	06f13c23          	sd	a5,120(sp)
    80001070:	09013023          	sd	a6,128(sp)
    80001074:	09113423          	sd	a7,136(sp)
    80001078:	09213823          	sd	s2,144(sp)
    8000107c:	09313c23          	sd	s3,152(sp)
    80001080:	0b413023          	sd	s4,160(sp)
    80001084:	0b513423          	sd	s5,168(sp)
    80001088:	0b613823          	sd	s6,176(sp)
    8000108c:	0b713c23          	sd	s7,184(sp)
    80001090:	0d813023          	sd	s8,192(sp)
    80001094:	0d913423          	sd	s9,200(sp)
    80001098:	0da13823          	sd	s10,208(sp)
    8000109c:	0db13c23          	sd	s11,216(sp)
    800010a0:	0fc13023          	sd	t3,224(sp)
    800010a4:	0fd13423          	sd	t4,232(sp)
    800010a8:	0fe13823          	sd	t5,240(sp)
    800010ac:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv23handleSoftwareInterruptEv
    800010b0:	408010ef          	jal	ra,800024b8 <_ZN5Riscv23handleSoftwareInterruptEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010b4:	00013003          	ld	zero,0(sp)
    800010b8:	00813083          	ld	ra,8(sp)
    800010bc:	01013103          	ld	sp,16(sp)
    800010c0:	01813183          	ld	gp,24(sp)
    800010c4:	02013203          	ld	tp,32(sp)
    800010c8:	02813283          	ld	t0,40(sp)
    800010cc:	03013303          	ld	t1,48(sp)
    800010d0:	03813383          	ld	t2,56(sp)
    800010d4:	04013403          	ld	s0,64(sp)
    800010d8:	04813483          	ld	s1,72(sp)
    800010dc:	05013503          	ld	a0,80(sp)
    800010e0:	05813583          	ld	a1,88(sp)
    800010e4:	06013603          	ld	a2,96(sp)
    800010e8:	06813683          	ld	a3,104(sp)
    800010ec:	07013703          	ld	a4,112(sp)
    800010f0:	07813783          	ld	a5,120(sp)
    800010f4:	08013803          	ld	a6,128(sp)
    800010f8:	08813883          	ld	a7,136(sp)
    800010fc:	09013903          	ld	s2,144(sp)
    80001100:	09813983          	ld	s3,152(sp)
    80001104:	0a013a03          	ld	s4,160(sp)
    80001108:	0a813a83          	ld	s5,168(sp)
    8000110c:	0b013b03          	ld	s6,176(sp)
    80001110:	0b813b83          	ld	s7,184(sp)
    80001114:	0c013c03          	ld	s8,192(sp)
    80001118:	0c813c83          	ld	s9,200(sp)
    8000111c:	0d013d03          	ld	s10,208(sp)
    80001120:	0d813d83          	ld	s11,216(sp)
    80001124:	0e013e03          	ld	t3,224(sp)
    80001128:	0e813e83          	ld	t4,232(sp)
    8000112c:	0f013f03          	ld	t5,240(sp)
    80001130:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001134:	10010113          	addi	sp,sp,256

    sret
    80001138:	10200073          	sret

000000008000113c <timerInterruptHandler>:


timerInterruptHandler:
    addi sp, sp, -256
    8000113c:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001140:	00013023          	sd	zero,0(sp)
    80001144:	00113423          	sd	ra,8(sp)
    80001148:	00213823          	sd	sp,16(sp)
    8000114c:	00313c23          	sd	gp,24(sp)
    80001150:	02413023          	sd	tp,32(sp)
    80001154:	02513423          	sd	t0,40(sp)
    80001158:	02613823          	sd	t1,48(sp)
    8000115c:	02713c23          	sd	t2,56(sp)
    80001160:	04813023          	sd	s0,64(sp)
    80001164:	04913423          	sd	s1,72(sp)
    80001168:	04a13823          	sd	a0,80(sp)
    8000116c:	04b13c23          	sd	a1,88(sp)
    80001170:	06c13023          	sd	a2,96(sp)
    80001174:	06d13423          	sd	a3,104(sp)
    80001178:	06e13823          	sd	a4,112(sp)
    8000117c:	06f13c23          	sd	a5,120(sp)
    80001180:	09013023          	sd	a6,128(sp)
    80001184:	09113423          	sd	a7,136(sp)
    80001188:	09213823          	sd	s2,144(sp)
    8000118c:	09313c23          	sd	s3,152(sp)
    80001190:	0b413023          	sd	s4,160(sp)
    80001194:	0b513423          	sd	s5,168(sp)
    80001198:	0b613823          	sd	s6,176(sp)
    8000119c:	0b713c23          	sd	s7,184(sp)
    800011a0:	0d813023          	sd	s8,192(sp)
    800011a4:	0d913423          	sd	s9,200(sp)
    800011a8:	0da13823          	sd	s10,208(sp)
    800011ac:	0db13c23          	sd	s11,216(sp)
    800011b0:	0fc13023          	sd	t3,224(sp)
    800011b4:	0fd13423          	sd	t4,232(sp)
    800011b8:	0fe13823          	sd	t5,240(sp)
    800011bc:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleTimerInterruptEv
    800011c0:	5dc010ef          	jal	ra,8000279c <_ZN5Riscv20handleTimerInterruptEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011c4:	00013003          	ld	zero,0(sp)
    800011c8:	00813083          	ld	ra,8(sp)
    800011cc:	01013103          	ld	sp,16(sp)
    800011d0:	01813183          	ld	gp,24(sp)
    800011d4:	02013203          	ld	tp,32(sp)
    800011d8:	02813283          	ld	t0,40(sp)
    800011dc:	03013303          	ld	t1,48(sp)
    800011e0:	03813383          	ld	t2,56(sp)
    800011e4:	04013403          	ld	s0,64(sp)
    800011e8:	04813483          	ld	s1,72(sp)
    800011ec:	05013503          	ld	a0,80(sp)
    800011f0:	05813583          	ld	a1,88(sp)
    800011f4:	06013603          	ld	a2,96(sp)
    800011f8:	06813683          	ld	a3,104(sp)
    800011fc:	07013703          	ld	a4,112(sp)
    80001200:	07813783          	ld	a5,120(sp)
    80001204:	08013803          	ld	a6,128(sp)
    80001208:	08813883          	ld	a7,136(sp)
    8000120c:	09013903          	ld	s2,144(sp)
    80001210:	09813983          	ld	s3,152(sp)
    80001214:	0a013a03          	ld	s4,160(sp)
    80001218:	0a813a83          	ld	s5,168(sp)
    8000121c:	0b013b03          	ld	s6,176(sp)
    80001220:	0b813b83          	ld	s7,184(sp)
    80001224:	0c013c03          	ld	s8,192(sp)
    80001228:	0c813c83          	ld	s9,200(sp)
    8000122c:	0d013d03          	ld	s10,208(sp)
    80001230:	0d813d83          	ld	s11,216(sp)
    80001234:	0e013e03          	ld	t3,224(sp)
    80001238:	0e813e83          	ld	t4,232(sp)
    8000123c:	0f013f03          	ld	t5,240(sp)
    80001240:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001244:	10010113          	addi	sp,sp,256

    sret
    80001248:	10200073          	sret

000000008000124c <consoleHandler>:


consoleHandler:
    addi sp, sp, -256
    8000124c:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001250:	00013023          	sd	zero,0(sp)
    80001254:	00113423          	sd	ra,8(sp)
    80001258:	00213823          	sd	sp,16(sp)
    8000125c:	00313c23          	sd	gp,24(sp)
    80001260:	02413023          	sd	tp,32(sp)
    80001264:	02513423          	sd	t0,40(sp)
    80001268:	02613823          	sd	t1,48(sp)
    8000126c:	02713c23          	sd	t2,56(sp)
    80001270:	04813023          	sd	s0,64(sp)
    80001274:	04913423          	sd	s1,72(sp)
    80001278:	04a13823          	sd	a0,80(sp)
    8000127c:	04b13c23          	sd	a1,88(sp)
    80001280:	06c13023          	sd	a2,96(sp)
    80001284:	06d13423          	sd	a3,104(sp)
    80001288:	06e13823          	sd	a4,112(sp)
    8000128c:	06f13c23          	sd	a5,120(sp)
    80001290:	09013023          	sd	a6,128(sp)
    80001294:	09113423          	sd	a7,136(sp)
    80001298:	09213823          	sd	s2,144(sp)
    8000129c:	09313c23          	sd	s3,152(sp)
    800012a0:	0b413023          	sd	s4,160(sp)
    800012a4:	0b513423          	sd	s5,168(sp)
    800012a8:	0b613823          	sd	s6,176(sp)
    800012ac:	0b713c23          	sd	s7,184(sp)
    800012b0:	0d813023          	sd	s8,192(sp)
    800012b4:	0d913423          	sd	s9,200(sp)
    800012b8:	0da13823          	sd	s10,208(sp)
    800012bc:	0db13c23          	sd	s11,216(sp)
    800012c0:	0fc13023          	sd	t3,224(sp)
    800012c4:	0fd13423          	sd	t4,232(sp)
    800012c8:	0fe13823          	sd	t5,240(sp)
    800012cc:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv22handleConsoleInterruptEv
    800012d0:	4a4010ef          	jal	ra,80002774 <_ZN5Riscv22handleConsoleInterruptEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800012d4:	00013003          	ld	zero,0(sp)
    800012d8:	00813083          	ld	ra,8(sp)
    800012dc:	01013103          	ld	sp,16(sp)
    800012e0:	01813183          	ld	gp,24(sp)
    800012e4:	02013203          	ld	tp,32(sp)
    800012e8:	02813283          	ld	t0,40(sp)
    800012ec:	03013303          	ld	t1,48(sp)
    800012f0:	03813383          	ld	t2,56(sp)
    800012f4:	04013403          	ld	s0,64(sp)
    800012f8:	04813483          	ld	s1,72(sp)
    800012fc:	05013503          	ld	a0,80(sp)
    80001300:	05813583          	ld	a1,88(sp)
    80001304:	06013603          	ld	a2,96(sp)
    80001308:	06813683          	ld	a3,104(sp)
    8000130c:	07013703          	ld	a4,112(sp)
    80001310:	07813783          	ld	a5,120(sp)
    80001314:	08013803          	ld	a6,128(sp)
    80001318:	08813883          	ld	a7,136(sp)
    8000131c:	09013903          	ld	s2,144(sp)
    80001320:	09813983          	ld	s3,152(sp)
    80001324:	0a013a03          	ld	s4,160(sp)
    80001328:	0a813a83          	ld	s5,168(sp)
    8000132c:	0b013b03          	ld	s6,176(sp)
    80001330:	0b813b83          	ld	s7,184(sp)
    80001334:	0c013c03          	ld	s8,192(sp)
    80001338:	0c813c83          	ld	s9,200(sp)
    8000133c:	0d013d03          	ld	s10,208(sp)
    80001340:	0d813d83          	ld	s11,216(sp)
    80001344:	0e013e03          	ld	t3,224(sp)
    80001348:	0e813e83          	ld	t4,232(sp)
    8000134c:	0f013f03          	ld	t5,240(sp)
    80001350:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001354:	10010113          	addi	sp,sp,256

    80001358:	10200073          	sret
	...

0000000080001368 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001368:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    8000136c:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001370:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    80001374:	0085b103          	ld	sp,8(a1)

    80001378:	00008067          	ret

000000008000137c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000137c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001380:	00b29a63          	bne	t0,a1,80001394 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001384:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001388:	fe029ae3          	bnez	t0,8000137c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000138c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001390:	00008067          	ret

0000000080001394 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001394:	00100513          	li	a0,1
    80001398:	00008067          	ret

000000008000139c <_Z9mem_allocm>:
#include "../h/syscall_c.hpp"
#include "../h/riscv.hpp"

void* mem_alloc(size_t size) {
    8000139c:	ff010113          	addi	sp,sp,-16
    800013a0:	00813423          	sd	s0,8(sp)
    800013a4:	01010413          	addi	s0,sp,16

    if(size%MEM_BLOCK_SIZE != 0)
    800013a8:	03f57793          	andi	a5,a0,63
    800013ac:	00078663          	beqz	a5,800013b8 <_Z9mem_allocm+0x1c>
        size = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    800013b0:	03f50513          	addi	a0,a0,63
    800013b4:	fc057513          	andi	a0,a0,-64
    __asm__ volatile("mv a1, %0" : : "r"(size));
    800013b8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x01");
    800013bc:	00100513          	li	a0,1
    __asm__ volatile("ecall");
    800013c0:	00000073          	ecall
    void* ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    800013c4:	00050513          	mv	a0,a0
    return ret;

}
    800013c8:	00813403          	ld	s0,8(sp)
    800013cc:	01010113          	addi	sp,sp,16
    800013d0:	00008067          	ret

00000000800013d4 <_Z8mem_freePv>:

int mem_free(void* ptr) {
    800013d4:	ff010113          	addi	sp,sp,-16
    800013d8:	00813423          	sd	s0,8(sp)
    800013dc:	01010413          	addi	s0,sp,16

    __asm__ volatile("mv a1, %0" : : "r"(ptr));
    800013e0:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x02");
    800013e4:	00200513          	li	a0,2
    __asm__ volatile("ecall");
    800013e8:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    800013ec:	00050513          	mv	a0,a0
    return (int)ret;

}
    800013f0:	0005051b          	sext.w	a0,a0
    800013f4:	00813403          	ld	s0,8(sp)
    800013f8:	01010113          	addi	sp,sp,16
    800013fc:	00008067          	ret

0000000080001400 <_Z12thread_startP3TCB>:

void thread_start(thread_t handle) {
    80001400:	ff010113          	addi	sp,sp,-16
    80001404:	00813423          	sd	s0,8(sp)
    80001408:	01010413          	addi	s0,sp,16

    __asm__ volatile("mv a1, %0" : : "r"(handle));
    8000140c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x09");
    80001410:	00900513          	li	a0,9
    __asm__ volatile("ecall");
    80001414:	00000073          	ecall

}
    80001418:	00813403          	ld	s0,8(sp)
    8000141c:	01010113          	addi	sp,sp,16
    80001420:	00008067          	ret

0000000080001424 <_Z11thread_initPP3TCBPFvPvES2_>:

int thread_init(thread_t* handle, void (*start_routine)(void*), void* arg){
    80001424:	ff010113          	addi	sp,sp,-16
    80001428:	00813423          	sd	s0,8(sp)
    8000142c:	01010413          	addi	s0,sp,16

    __asm__ volatile("mv a6, %0" : : "r"(arg));
    80001430:	00060813          	mv	a6,a2
    __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    80001434:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    80001438:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x10");
    8000143c:	01000513          	li	a0,16
    __asm__ volatile("ecall");
    80001440:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    80001444:	00050513          	mv	a0,a0
    return (int)ret;

}
    80001448:	0005051b          	sext.w	a0,a0
    8000144c:	00813403          	ld	s0,8(sp)
    80001450:	01010113          	addi	sp,sp,16
    80001454:	00008067          	ret

0000000080001458 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void (*start_routine)(void*), void* arg) {
    80001458:	ff010113          	addi	sp,sp,-16
    8000145c:	00813423          	sd	s0,8(sp)
    80001460:	01010413          	addi	s0,sp,16

    __asm__ volatile("mv a6, %0" : : "r"(arg));
    80001464:	00060813          	mv	a6,a2
    __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    80001468:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    8000146c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x11");
    80001470:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    80001474:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    80001478:	00050513          	mv	a0,a0
    return (int)ret;

}
    8000147c:	0005051b          	sext.w	a0,a0
    80001480:	00813403          	ld	s0,8(sp)
    80001484:	01010113          	addi	sp,sp,16
    80001488:	00008067          	ret

000000008000148c <_Z11thread_exitv>:

int thread_exit() {
    8000148c:	ff010113          	addi	sp,sp,-16
    80001490:	00813423          	sd	s0,8(sp)
    80001494:	01010413          	addi	s0,sp,16

    __asm__ volatile("li a0, 0x12");
    80001498:	01200513          	li	a0,18
    __asm__ volatile ("ecall");
    8000149c:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    800014a0:	00050513          	mv	a0,a0
    return (int)ret;

}
    800014a4:	0005051b          	sext.w	a0,a0
    800014a8:	00813403          	ld	s0,8(sp)
    800014ac:	01010113          	addi	sp,sp,16
    800014b0:	00008067          	ret

00000000800014b4 <_Z15thread_dispatchv>:

void thread_dispatch() {
    800014b4:	ff010113          	addi	sp,sp,-16
    800014b8:	00813423          	sd	s0,8(sp)
    800014bc:	01010413          	addi	s0,sp,16

    __asm__ volatile("li a0, 0x13");
    800014c0:	01300513          	li	a0,19
    __asm__ volatile ("ecall");
    800014c4:	00000073          	ecall

}
    800014c8:	00813403          	ld	s0,8(sp)
    800014cc:	01010113          	addi	sp,sp,16
    800014d0:	00008067          	ret

00000000800014d4 <_Z8sem_openPP13SyncSemaphorej>:

int sem_open(sem_t* handle, unsigned init) {
    800014d4:	ff010113          	addi	sp,sp,-16
    800014d8:	00813423          	sd	s0,8(sp)
    800014dc:	01010413          	addi	s0,sp,16

    __asm__ volatile("mv a2, %0" : : "r"(init));
    800014e0:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    800014e4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x21");
    800014e8:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    800014ec:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    800014f0:	00050513          	mv	a0,a0
    return (int)ret;

}
    800014f4:	0005051b          	sext.w	a0,a0
    800014f8:	00813403          	ld	s0,8(sp)
    800014fc:	01010113          	addi	sp,sp,16
    80001500:	00008067          	ret

0000000080001504 <_Z9sem_closeP13SyncSemaphore>:

int sem_close(sem_t id) {
    80001504:	ff010113          	addi	sp,sp,-16
    80001508:	00813423          	sd	s0,8(sp)
    8000150c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(id));
    80001510:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x22");
    80001514:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    80001518:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    8000151c:	00050513          	mv	a0,a0
    return (int)ret;
}
    80001520:	0005051b          	sext.w	a0,a0
    80001524:	00813403          	ld	s0,8(sp)
    80001528:	01010113          	addi	sp,sp,16
    8000152c:	00008067          	ret

0000000080001530 <_Z8sem_waitP13SyncSemaphore>:

int sem_wait(sem_t id) {
    80001530:	ff010113          	addi	sp,sp,-16
    80001534:	00813423          	sd	s0,8(sp)
    80001538:	01010413          	addi	s0,sp,16

    __asm__ volatile("mv a1, %0" : : "r"(id));
    8000153c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x23");
    80001540:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001544:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    80001548:	00050513          	mv	a0,a0
    return (int)ret;

}
    8000154c:	0005051b          	sext.w	a0,a0
    80001550:	00813403          	ld	s0,8(sp)
    80001554:	01010113          	addi	sp,sp,16
    80001558:	00008067          	ret

000000008000155c <_Z10sem_signalP13SyncSemaphore>:

int sem_signal(sem_t id){
    8000155c:	ff010113          	addi	sp,sp,-16
    80001560:	00813423          	sd	s0,8(sp)
    80001564:	01010413          	addi	s0,sp,16

    __asm__ volatile("mv a1, %0" : : "r"(id));
    80001568:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x24");
    8000156c:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001570:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    80001574:	00050513          	mv	a0,a0
    return (int)ret;

}
    80001578:	0005051b          	sext.w	a0,a0
    8000157c:	00813403          	ld	s0,8(sp)
    80001580:	01010113          	addi	sp,sp,16
    80001584:	00008067          	ret

0000000080001588 <_Z11sem_trywaitP13SyncSemaphore>:

int sem_trywait(sem_t id){
    80001588:	ff010113          	addi	sp,sp,-16
    8000158c:	00813423          	sd	s0,8(sp)
    80001590:	01010413          	addi	s0,sp,16

    __asm__ volatile("mv a1, %0" : : "r"(id));
    80001594:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x26");
    80001598:	02600513          	li	a0,38
    __asm__ volatile("ecall");
    8000159c:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    800015a0:	00050513          	mv	a0,a0
    return (int)ret;

}
    800015a4:	0005051b          	sext.w	a0,a0
    800015a8:	00813403          	ld	s0,8(sp)
    800015ac:	01010113          	addi	sp,sp,16
    800015b0:	00008067          	ret

00000000800015b4 <_Z4getcv>:

char getc() {
    800015b4:	ff010113          	addi	sp,sp,-16
    800015b8:	00813423          	sd	s0,8(sp)
    800015bc:	01010413          	addi	s0,sp,16

    __asm__ volatile("li a0, 0x41");
    800015c0:	04100513          	li	a0,65
    __asm__ volatile ("ecall");
    800015c4:	00000073          	ecall
    char ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    800015c8:	00050513          	mv	a0,a0
    return ret;

}
    800015cc:	0ff57513          	andi	a0,a0,255
    800015d0:	00813403          	ld	s0,8(sp)
    800015d4:	01010113          	addi	sp,sp,16
    800015d8:	00008067          	ret

00000000800015dc <_Z4putcc>:

void putc(char c) {
    800015dc:	ff010113          	addi	sp,sp,-16
    800015e0:	00813423          	sd	s0,8(sp)
    800015e4:	01010413          	addi	s0,sp,16

    __asm__ volatile ("mv a1, %0" : : "r" (c));
    800015e8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x42");
    800015ec:	04200513          	li	a0,66
    __asm__ volatile ("ecall");
    800015f0:	00000073          	ecall

}
    800015f4:	00813403          	ld	s0,8(sp)
    800015f8:	01010113          	addi	sp,sp,16
    800015fc:	00008067          	ret

0000000080001600 <_Z10time_sleepm>:

int time_sleep(time_t time) {
    80001600:	ff010113          	addi	sp,sp,-16
    80001604:	00813423          	sd	s0,8(sp)
    80001608:	01010413          	addi	s0,sp,16
    return 0;
}
    8000160c:	00000513          	li	a0,0
    80001610:	00813403          	ld	s0,8(sp)
    80001614:	01010113          	addi	sp,sp,16
    80001618:	00008067          	ret

000000008000161c <_Z13sem_timedwaitP13SyncSemaphorem>:

int sem_timedwait(sem_t id, time_t timeout) {
    8000161c:	ff010113          	addi	sp,sp,-16
    80001620:	00813423          	sd	s0,8(sp)
    80001624:	01010413          	addi	s0,sp,16
    return 0;
}
    80001628:	00000513          	li	a0,0
    8000162c:	00813403          	ld	s0,8(sp)
    80001630:	01010113          	addi	sp,sp,16
    80001634:	00008067          	ret

0000000080001638 <_Z4pairP3TCBS0_>:

//mod
void pair(thread_t t1, thread_t t2){
    80001638:	ff010113          	addi	sp,sp,-16
    8000163c:	00813423          	sd	s0,8(sp)
    80001640:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0" : : "r"(t2));
    80001644:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %0" : : "r"(t1));
    80001648:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x50");
    8000164c:	05000513          	li	a0,80
    __asm__ volatile ("ecall");
    80001650:	00000073          	ecall

}
    80001654:	00813403          	ld	s0,8(sp)
    80001658:	01010113          	addi	sp,sp,16
    8000165c:	00008067          	ret

0000000080001660 <_Z11synchronizeP3TCB>:

void synchronize(thread_t t){
    80001660:	ff010113          	addi	sp,sp,-16
    80001664:	00813423          	sd	s0,8(sp)
    80001668:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r"(t));
    8000166c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x51");
    80001670:	05100513          	li	a0,81
    __asm__ volatile ("ecall");
    80001674:	00000073          	ecall
}
    80001678:	00813403          	ld	s0,8(sp)
    8000167c:	01010113          	addi	sp,sp,16
    80001680:	00008067          	ret

0000000080001684 <_Znwm>:
#include "../h/syscall_cpp.hpp"

using size_t = decltype(sizeof(0));

void *operator new(size_t n)
{
    80001684:	ff010113          	addi	sp,sp,-16
    80001688:	00113423          	sd	ra,8(sp)
    8000168c:	00813023          	sd	s0,0(sp)
    80001690:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(n);
    80001694:	00000097          	auipc	ra,0x0
    80001698:	488080e7          	jalr	1160(ra) # 80001b1c <_ZN15MemoryAllocator9mem_allocEm>
}
    8000169c:	00813083          	ld	ra,8(sp)
    800016a0:	00013403          	ld	s0,0(sp)
    800016a4:	01010113          	addi	sp,sp,16
    800016a8:	00008067          	ret

00000000800016ac <_Znam>:

void *operator new[](size_t n)
{
    800016ac:	ff010113          	addi	sp,sp,-16
    800016b0:	00113423          	sd	ra,8(sp)
    800016b4:	00813023          	sd	s0,0(sp)
    800016b8:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(n);
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	460080e7          	jalr	1120(ra) # 80001b1c <_ZN15MemoryAllocator9mem_allocEm>
}
    800016c4:	00813083          	ld	ra,8(sp)
    800016c8:	00013403          	ld	s0,0(sp)
    800016cc:	01010113          	addi	sp,sp,16
    800016d0:	00008067          	ret

00000000800016d4 <_ZdlPv>:

void operator delete(void *p) noexcept
{
    800016d4:	ff010113          	addi	sp,sp,-16
    800016d8:	00113423          	sd	ra,8(sp)
    800016dc:	00813023          	sd	s0,0(sp)
    800016e0:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(p);
    800016e4:	00000097          	auipc	ra,0x0
    800016e8:	5cc080e7          	jalr	1484(ra) # 80001cb0 <_ZN15MemoryAllocator8mem_freeEPv>
}
    800016ec:	00813083          	ld	ra,8(sp)
    800016f0:	00013403          	ld	s0,0(sp)
    800016f4:	01010113          	addi	sp,sp,16
    800016f8:	00008067          	ret

00000000800016fc <_ZdaPv>:

void operator delete[](void *p) noexcept
{
    800016fc:	ff010113          	addi	sp,sp,-16
    80001700:	00113423          	sd	ra,8(sp)
    80001704:	00813023          	sd	s0,0(sp)
    80001708:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(p);
    8000170c:	00000097          	auipc	ra,0x0
    80001710:	5a4080e7          	jalr	1444(ra) # 80001cb0 <_ZN15MemoryAllocator8mem_freeEPv>
    80001714:	00813083          	ld	ra,8(sp)
    80001718:	00013403          	ld	s0,0(sp)
    8000171c:	01010113          	addi	sp,sp,16
    80001720:	00008067          	ret

0000000080001724 <main>:
#include "../h/riscv.hpp"

extern void userMain();

int main()
{
    80001724:	fe010113          	addi	sp,sp,-32
    80001728:	00113c23          	sd	ra,24(sp)
    8000172c:	00813823          	sd	s0,16(sp)
    80001730:	02010413          	addi	s0,sp,32
    static BlockHeader* freeMemHead;
    static BlockHeader* usedMemHead;

    static void initMem() {

        freeMemHead = (BlockHeader*)((char*)HEAP_START_ADDR);
    80001734:	0000a797          	auipc	a5,0xa
    80001738:	fe47b783          	ld	a5,-28(a5) # 8000b718 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000173c:	0007b783          	ld	a5,0(a5)
    80001740:	0000a717          	auipc	a4,0xa
    80001744:	fe873703          	ld	a4,-24(a4) # 8000b728 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001748:	00f73023          	sd	a5,0(a4)
        usedMemHead = nullptr;
    8000174c:	0000a717          	auipc	a4,0xa
    80001750:	fec73703          	ld	a4,-20(a4) # 8000b738 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001754:	00073023          	sd	zero,0(a4)
        freeMemHead->size = ((char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR - sizeof(BlockHeader));
    80001758:	0000a717          	auipc	a4,0xa
    8000175c:	ff073703          	ld	a4,-16(a4) # 8000b748 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001760:	00073703          	ld	a4,0(a4)
    80001764:	40f70733          	sub	a4,a4,a5
    80001768:	fe870713          	addi	a4,a4,-24
    8000176c:	00e7b823          	sd	a4,16(a5)
        freeMemHead->next = freeMemHead->prev = nullptr;
    80001770:	0007b423          	sd	zero,8(a5)
    80001774:	0007b023          	sd	zero,0(a5)

    TCB *coroutines[2];

    MemoryAllocator::initMem();

    Riscv::w_stvec((uint64) &Riscv::vectorTable | 0b01);
    80001778:	0000a797          	auipc	a5,0xa
    8000177c:	fa87b783          	ld	a5,-88(a5) # 8000b720 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001780:	0017e793          	ori	a5,a5,1
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001784:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001788:	00200793          	li	a5,2
    8000178c:	1007a073          	csrs	sstatus,a5
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    coroutines[0] = TCB::createThread(nullptr,nullptr);
    80001790:	00000593          	li	a1,0
    80001794:	00000513          	li	a0,0
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	0a0080e7          	jalr	160(ra) # 80001838 <_ZN3TCB12createThreadEPFvPvES0_>
    800017a0:	fea43023          	sd	a0,-32(s0)
    TCB::running = coroutines[0];
    800017a4:	0000a797          	auipc	a5,0xa
    800017a8:	f9c7b783          	ld	a5,-100(a5) # 8000b740 <_GLOBAL_OFFSET_TABLE_+0x38>
    800017ac:	00a7b023          	sd	a0,0(a5)

    thread_create(&coroutines[1], reinterpret_cast<void (*)(void *)>(userMain), nullptr);
    800017b0:	00000613          	li	a2,0
    800017b4:	0000a597          	auipc	a1,0xa
    800017b8:	f5c5b583          	ld	a1,-164(a1) # 8000b710 <_GLOBAL_OFFSET_TABLE_+0x8>
    800017bc:	fe840513          	addi	a0,s0,-24
    800017c0:	00000097          	auipc	ra,0x0
    800017c4:	c98080e7          	jalr	-872(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>

    while(!coroutines[1]->isFinished()) {
    800017c8:	fe843783          	ld	a5,-24(s0)
class TCB
{
public:
    ~TCB() { delete[] stack; }

    bool isFinished() const { return finished; }
    800017cc:	0207c783          	lbu	a5,32(a5)
    800017d0:	00079863          	bnez	a5,800017e0 <main+0xbc>
        thread_dispatch();
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	ce0080e7          	jalr	-800(ra) # 800014b4 <_Z15thread_dispatchv>
    800017dc:	fedff06f          	j	800017c8 <main+0xa4>
    }

    return 0;
}
    800017e0:	00000513          	li	a0,0
    800017e4:	01813083          	ld	ra,24(sp)
    800017e8:	01013403          	ld	s0,16(sp)
    800017ec:	02010113          	addi	sp,sp,32
    800017f0:	00008067          	ret

00000000800017f4 <_ZN3TCB13threadWrapperEv>:

    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper()
{
    800017f4:	ff010113          	addi	sp,sp,-16
    800017f8:	00113423          	sd	ra,8(sp)
    800017fc:	00813023          	sd	s0,0(sp)
    80001800:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    80001804:	00001097          	auipc	ra,0x1
    80001808:	c94080e7          	jalr	-876(ra) # 80002498 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    8000180c:	0000a797          	auipc	a5,0xa
    80001810:	f947b783          	ld	a5,-108(a5) # 8000b7a0 <_ZN3TCB7runningE>
    80001814:	0007b703          	ld	a4,0(a5)
    80001818:	0287b503          	ld	a0,40(a5)
    8000181c:	000700e7          	jalr	a4
    thread_exit();
    80001820:	00000097          	auipc	ra,0x0
    80001824:	c6c080e7          	jalr	-916(ra) # 8000148c <_Z11thread_exitv>
}
    80001828:	00813083          	ld	ra,8(sp)
    8000182c:	00013403          	ld	s0,0(sp)
    80001830:	01010113          	addi	sp,sp,16
    80001834:	00008067          	ret

0000000080001838 <_ZN3TCB12createThreadEPFvPvES0_>:
{
    80001838:	fd010113          	addi	sp,sp,-48
    8000183c:	02113423          	sd	ra,40(sp)
    80001840:	02813023          	sd	s0,32(sp)
    80001844:	00913c23          	sd	s1,24(sp)
    80001848:	01213823          	sd	s2,16(sp)
    8000184c:	01313423          	sd	s3,8(sp)
    80001850:	03010413          	addi	s0,sp,48
    80001854:	00050913          	mv	s2,a0
    80001858:	00058993          	mv	s3,a1
    TCB* tcb= new TCB(body, arg);
    8000185c:	04800513          	li	a0,72
    80001860:	00000097          	auipc	ra,0x0
    80001864:	e24080e7          	jalr	-476(ra) # 80001684 <_Znwm>
    80001868:	00050493          	mv	s1,a0
            main(body == nullptr),
            //mod
            id(nextId++),
            called(false),
            pairSync(false),
            myPair(nullptr)
    8000186c:	01253023          	sd	s2,0(a0)
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001870:	00090a63          	beqz	s2,80001884 <_ZN3TCB12createThreadEPFvPvES0_+0x4c>
    80001874:	00002537          	lui	a0,0x2
    80001878:	00000097          	auipc	ra,0x0
    8000187c:	e34080e7          	jalr	-460(ra) # 800016ac <_Znam>
    80001880:	0080006f          	j	80001888 <_ZN3TCB12createThreadEPFvPvES0_+0x50>
    80001884:	00000513          	li	a0,0
            myPair(nullptr)
    80001888:	00a4b423          	sd	a0,8(s1)
    8000188c:	00000797          	auipc	a5,0x0
    80001890:	f6878793          	addi	a5,a5,-152 # 800017f4 <_ZN3TCB13threadWrapperEv>
    80001894:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001898:	06050a63          	beqz	a0,8000190c <_ZN3TCB12createThreadEPFvPvES0_+0xd4>
    8000189c:	000027b7          	lui	a5,0x2
    800018a0:	00f50533          	add	a0,a0,a5
            myPair(nullptr)
    800018a4:	00a4bc23          	sd	a0,24(s1)
    800018a8:	02048023          	sb	zero,32(s1)
    800018ac:	020480a3          	sb	zero,33(s1)
    800018b0:	0334b423          	sd	s3,40(s1)
            main(body == nullptr),
    800018b4:	00193913          	seqz	s2,s2
            myPair(nullptr)
    800018b8:	03248823          	sb	s2,48(s1)
            id(nextId++),
    800018bc:	0000a717          	auipc	a4,0xa
    800018c0:	c2c70713          	addi	a4,a4,-980 # 8000b4e8 <_ZN3TCB6nextIdE>
    800018c4:	00072783          	lw	a5,0(a4)
    800018c8:	0017869b          	addiw	a3,a5,1
    800018cc:	00d72023          	sw	a3,0(a4)
            myPair(nullptr)
    800018d0:	02f4aa23          	sw	a5,52(s1)
    800018d4:	02048c23          	sb	zero,56(s1)
    800018d8:	02048ca3          	sb	zero,57(s1)
    800018dc:	0404b023          	sd	zero,64(s1)
    Scheduler::put(tcb);
    800018e0:	00048513          	mv	a0,s1
    800018e4:	00001097          	auipc	ra,0x1
    800018e8:	f80080e7          	jalr	-128(ra) # 80002864 <_ZN9Scheduler3putEP3TCB>
}
    800018ec:	00048513          	mv	a0,s1
    800018f0:	02813083          	ld	ra,40(sp)
    800018f4:	02013403          	ld	s0,32(sp)
    800018f8:	01813483          	ld	s1,24(sp)
    800018fc:	01013903          	ld	s2,16(sp)
    80001900:	00813983          	ld	s3,8(sp)
    80001904:	03010113          	addi	sp,sp,48
    80001908:	00008067          	ret
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    8000190c:	00000513          	li	a0,0
    80001910:	f95ff06f          	j	800018a4 <_ZN3TCB12createThreadEPFvPvES0_+0x6c>
    80001914:	00050913          	mv	s2,a0
    TCB* tcb= new TCB(body, arg);
    80001918:	00048513          	mv	a0,s1
    8000191c:	00000097          	auipc	ra,0x0
    80001920:	db8080e7          	jalr	-584(ra) # 800016d4 <_ZdlPv>
    80001924:	00090513          	mv	a0,s2
    80001928:	0000b097          	auipc	ra,0xb
    8000192c:	fc0080e7          	jalr	-64(ra) # 8000c8e8 <_Unwind_Resume>

0000000080001930 <_ZN3TCB10initThreadEPFvPvES0_>:
{
    80001930:	fd010113          	addi	sp,sp,-48
    80001934:	02113423          	sd	ra,40(sp)
    80001938:	02813023          	sd	s0,32(sp)
    8000193c:	00913c23          	sd	s1,24(sp)
    80001940:	01213823          	sd	s2,16(sp)
    80001944:	01313423          	sd	s3,8(sp)
    80001948:	03010413          	addi	s0,sp,48
    8000194c:	00050913          	mv	s2,a0
    80001950:	00058993          	mv	s3,a1
    TCB* tcb = new TCB(body, arg);
    80001954:	04800513          	li	a0,72
    80001958:	00000097          	auipc	ra,0x0
    8000195c:	d2c080e7          	jalr	-724(ra) # 80001684 <_Znwm>
    80001960:	00050493          	mv	s1,a0
            myPair(nullptr)
    80001964:	01253023          	sd	s2,0(a0) # 2000 <_entry-0x7fffe000>
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001968:	00090a63          	beqz	s2,8000197c <_ZN3TCB10initThreadEPFvPvES0_+0x4c>
    8000196c:	00002537          	lui	a0,0x2
    80001970:	00000097          	auipc	ra,0x0
    80001974:	d3c080e7          	jalr	-708(ra) # 800016ac <_Znam>
    80001978:	0080006f          	j	80001980 <_ZN3TCB10initThreadEPFvPvES0_+0x50>
    8000197c:	00000513          	li	a0,0
            myPair(nullptr)
    80001980:	00a4b423          	sd	a0,8(s1)
    80001984:	00000797          	auipc	a5,0x0
    80001988:	e7078793          	addi	a5,a5,-400 # 800017f4 <_ZN3TCB13threadWrapperEv>
    8000198c:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001990:	06050463          	beqz	a0,800019f8 <_ZN3TCB10initThreadEPFvPvES0_+0xc8>
    80001994:	000027b7          	lui	a5,0x2
    80001998:	00f50533          	add	a0,a0,a5
            myPair(nullptr)
    8000199c:	00a4bc23          	sd	a0,24(s1)
    800019a0:	02048023          	sb	zero,32(s1)
    800019a4:	020480a3          	sb	zero,33(s1)
    800019a8:	0334b423          	sd	s3,40(s1)
            main(body == nullptr),
    800019ac:	00193913          	seqz	s2,s2
            myPair(nullptr)
    800019b0:	03248823          	sb	s2,48(s1)
            id(nextId++),
    800019b4:	0000a717          	auipc	a4,0xa
    800019b8:	b3470713          	addi	a4,a4,-1228 # 8000b4e8 <_ZN3TCB6nextIdE>
    800019bc:	00072783          	lw	a5,0(a4)
    800019c0:	0017869b          	addiw	a3,a5,1
    800019c4:	00d72023          	sw	a3,0(a4)
            myPair(nullptr)
    800019c8:	02f4aa23          	sw	a5,52(s1)
    800019cc:	02048c23          	sb	zero,56(s1)
    800019d0:	02048ca3          	sb	zero,57(s1)
    800019d4:	0404b023          	sd	zero,64(s1)
}
    800019d8:	00048513          	mv	a0,s1
    800019dc:	02813083          	ld	ra,40(sp)
    800019e0:	02013403          	ld	s0,32(sp)
    800019e4:	01813483          	ld	s1,24(sp)
    800019e8:	01013903          	ld	s2,16(sp)
    800019ec:	00813983          	ld	s3,8(sp)
    800019f0:	03010113          	addi	sp,sp,48
    800019f4:	00008067          	ret
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    800019f8:	00000513          	li	a0,0
    800019fc:	fa1ff06f          	j	8000199c <_ZN3TCB10initThreadEPFvPvES0_+0x6c>
    80001a00:	00050913          	mv	s2,a0
    TCB* tcb = new TCB(body, arg);
    80001a04:	00048513          	mv	a0,s1
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	ccc080e7          	jalr	-820(ra) # 800016d4 <_ZdlPv>
    80001a10:	00090513          	mv	a0,s2
    80001a14:	0000b097          	auipc	ra,0xb
    80001a18:	ed4080e7          	jalr	-300(ra) # 8000c8e8 <_Unwind_Resume>

0000000080001a1c <_ZN3TCB8dispatchEv>:
{
    80001a1c:	fe010113          	addi	sp,sp,-32
    80001a20:	00113c23          	sd	ra,24(sp)
    80001a24:	00813823          	sd	s0,16(sp)
    80001a28:	00913423          	sd	s1,8(sp)
    80001a2c:	02010413          	addi	s0,sp,32
    TCB *old = running;
    80001a30:	0000a497          	auipc	s1,0xa
    80001a34:	d704b483          	ld	s1,-656(s1) # 8000b7a0 <_ZN3TCB7runningE>
    bool isFinished() const { return finished; }
    80001a38:	0204c783          	lbu	a5,32(s1)
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::put(old); }
    80001a3c:	00079663          	bnez	a5,80001a48 <_ZN3TCB8dispatchEv+0x2c>
    bool isBlocked() const { return this->blocked; }
    80001a40:	0214c783          	lbu	a5,33(s1)
    80001a44:	04078463          	beqz	a5,80001a8c <_ZN3TCB8dispatchEv+0x70>
    running = Scheduler::get();
    80001a48:	00001097          	auipc	ra,0x1
    80001a4c:	db4080e7          	jalr	-588(ra) # 800027fc <_ZN9Scheduler3getEv>
    80001a50:	0000a797          	auipc	a5,0xa
    80001a54:	d4a7b823          	sd	a0,-688(a5) # 8000b7a0 <_ZN3TCB7runningE>
    bool isMain() const { return this->main; }
    80001a58:	03054783          	lbu	a5,48(a0) # 2030 <_entry-0x7fffdfd0>
    if(running->isMain()) {
    80001a5c:	04078063          	beqz	a5,80001a9c <_ZN3TCB8dispatchEv+0x80>
    80001a60:	10000793          	li	a5,256
    80001a64:	1007a073          	csrs	sstatus,a5
    TCB::contextSwitch(&old->context, &running->context);
    80001a68:	01050593          	addi	a1,a0,16
    80001a6c:	01048513          	addi	a0,s1,16
    80001a70:	00000097          	auipc	ra,0x0
    80001a74:	8f8080e7          	jalr	-1800(ra) # 80001368 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80001a78:	01813083          	ld	ra,24(sp)
    80001a7c:	01013403          	ld	s0,16(sp)
    80001a80:	00813483          	ld	s1,8(sp)
    80001a84:	02010113          	addi	sp,sp,32
    80001a88:	00008067          	ret
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::put(old); }
    80001a8c:	00048513          	mv	a0,s1
    80001a90:	00001097          	auipc	ra,0x1
    80001a94:	dd4080e7          	jalr	-556(ra) # 80002864 <_ZN9Scheduler3putEP3TCB>
    80001a98:	fb1ff06f          	j	80001a48 <_ZN3TCB8dispatchEv+0x2c>
}

inline void Riscv::mc_sstatus(uint64 mask)
{
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001a9c:	10000793          	li	a5,256
    80001aa0:	1007b073          	csrc	sstatus,a5
}
    80001aa4:	fc5ff06f          	j	80001a68 <_ZN3TCB8dispatchEv+0x4c>

0000000080001aa8 <_ZN3TCB14synchronizeTCBEv>:

void TCB::synchronizeTCB()
{
    if(myPair == nullptr) return;
    80001aa8:	04053783          	ld	a5,64(a0)
    80001aac:	06078663          	beqz	a5,80001b18 <_ZN3TCB14synchronizeTCBEv+0x70>
{
    80001ab0:	fe010113          	addi	sp,sp,-32
    80001ab4:	00113c23          	sd	ra,24(sp)
    80001ab8:	00813823          	sd	s0,16(sp)
    80001abc:	00913423          	sd	s1,8(sp)
    80001ac0:	02010413          	addi	s0,sp,32
    80001ac4:	00050493          	mv	s1,a0

    called = true;
    80001ac8:	00100713          	li	a4,1
    80001acc:	02e50c23          	sb	a4,56(a0)
    bool isCalled() const { return called; }
    80001ad0:	0387c703          	lbu	a4,56(a5)
    if(myPair->isCalled())
    80001ad4:	00070a63          	beqz	a4,80001ae8 <_ZN3TCB14synchronizeTCBEv+0x40>
    {
        called = false;
    80001ad8:	02050c23          	sb	zero,56(a0)
    void setPairSync() { pairSync = true; }
    80001adc:	00100713          	li	a4,1
    80001ae0:	02e78ca3          	sb	a4,57(a5)
    80001ae4:	0200006f          	j	80001b04 <_ZN3TCB14synchronizeTCBEv+0x5c>
        myPair->setPairSync();
    }
    else
    {
        while(!pairSync) {
    80001ae8:	0394c783          	lbu	a5,57(s1)
    80001aec:	00079863          	bnez	a5,80001afc <_ZN3TCB14synchronizeTCBEv+0x54>
            dispatch();
    80001af0:	00000097          	auipc	ra,0x0
    80001af4:	f2c080e7          	jalr	-212(ra) # 80001a1c <_ZN3TCB8dispatchEv>
        while(!pairSync) {
    80001af8:	ff1ff06f          	j	80001ae8 <_ZN3TCB14synchronizeTCBEv+0x40>
        }

        called = false;
    80001afc:	02048c23          	sb	zero,56(s1)
        pairSync = false;
    80001b00:	02048ca3          	sb	zero,57(s1)
    }

}
    80001b04:	01813083          	ld	ra,24(sp)
    80001b08:	01013403          	ld	s0,16(sp)
    80001b0c:	00813483          	ld	s1,8(sp)
    80001b10:	02010113          	addi	sp,sp,32
    80001b14:	00008067          	ret
    80001b18:	00008067          	ret

0000000080001b1c <_ZN15MemoryAllocator9mem_allocEm>:


BlockHeader* MemoryAllocator::freeMemHead = nullptr;
BlockHeader* MemoryAllocator::usedMemHead = nullptr;

void *MemoryAllocator::mem_alloc(size_t size) {
    80001b1c:	ff010113          	addi	sp,sp,-16
    80001b20:	00813423          	sd	s0,8(sp)
    80001b24:	01010413          	addi	s0,sp,16
    80001b28:	00050713          	mv	a4,a0

    if (size % MEM_BLOCK_SIZE != 0)
    80001b2c:	03f57793          	andi	a5,a0,63
    80001b30:	00078663          	beqz	a5,80001b3c <_ZN15MemoryAllocator9mem_allocEm+0x20>
        size = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80001b34:	03f50713          	addi	a4,a0,63
    80001b38:	fc077713          	andi	a4,a4,-64

    BlockHeader *blk = MemoryAllocator::freeMemHead;
    80001b3c:	0000a517          	auipc	a0,0xa
    80001b40:	c6c53503          	ld	a0,-916(a0) # 8000b7a8 <_ZN15MemoryAllocator11freeMemHeadE>
    for (; blk != nullptr; blk = blk->next)
    80001b44:	00050a63          	beqz	a0,80001b58 <_ZN15MemoryAllocator9mem_allocEm+0x3c>
        if (blk->size >= size) break;
    80001b48:	01053783          	ld	a5,16(a0)
    80001b4c:	00e7f663          	bgeu	a5,a4,80001b58 <_ZN15MemoryAllocator9mem_allocEm+0x3c>
    for (; blk != nullptr; blk = blk->next)
    80001b50:	00053503          	ld	a0,0(a0)
    80001b54:	ff1ff06f          	j	80001b44 <_ZN15MemoryAllocator9mem_allocEm+0x28>

    if (blk == nullptr)
    80001b58:	06050c63          	beqz	a0,80001bd0 <_ZN15MemoryAllocator9mem_allocEm+0xb4>
        return nullptr;

    if (blk->size > size) {
    80001b5c:	01053783          	ld	a5,16(a0)
    80001b60:	08f77463          	bgeu	a4,a5,80001be8 <_ZN15MemoryAllocator9mem_allocEm+0xcc>

        BlockHeader* newBlk = (BlockHeader*)((char*)blk + size + sizeof(BlockHeader));;
    80001b64:	01870793          	addi	a5,a4,24
    80001b68:	00f507b3          	add	a5,a0,a5
        if (blk->prev) blk->prev->next = newBlk;
    80001b6c:	00853683          	ld	a3,8(a0)
    80001b70:	06068663          	beqz	a3,80001bdc <_ZN15MemoryAllocator9mem_allocEm+0xc0>
    80001b74:	00f6b023          	sd	a5,0(a3)
        else MemoryAllocator::freeMemHead = newBlk;

        if (blk->next) blk->next->prev = newBlk;
    80001b78:	00053683          	ld	a3,0(a0)
    80001b7c:	00068463          	beqz	a3,80001b84 <_ZN15MemoryAllocator9mem_allocEm+0x68>
    80001b80:	00f6b423          	sd	a5,8(a3)
        newBlk->prev = blk->prev;
    80001b84:	00853683          	ld	a3,8(a0)
    80001b88:	00d7b423          	sd	a3,8(a5)
        newBlk->next = blk->next;
    80001b8c:	00053683          	ld	a3,0(a0)
    80001b90:	00d7b023          	sd	a3,0(a5)

        newBlk->size = blk->size - size - sizeof(BlockHeader);
    80001b94:	01053683          	ld	a3,16(a0)
    80001b98:	40e686b3          	sub	a3,a3,a4
    80001b9c:	fe868693          	addi	a3,a3,-24
    80001ba0:	00d7b823          	sd	a3,16(a5)
        blk->size = size;
    80001ba4:	00e53823          	sd	a4,16(a0)
        else MemoryAllocator::freeMemHead = blk->next;

        if(blk->next) blk->next->prev = blk->prev;
    }

    if(usedMemHead == nullptr) {
    80001ba8:	0000a797          	auipc	a5,0xa
    80001bac:	c087b783          	ld	a5,-1016(a5) # 8000b7b0 <_ZN15MemoryAllocator11usedMemHeadE>
    80001bb0:	06078663          	beqz	a5,80001c1c <_ZN15MemoryAllocator9mem_allocEm+0x100>
        usedMemHead = blk;
        blk->next = nullptr;
        blk->prev = nullptr;
    }
    else if((char*) blk < (char*)usedMemHead) {
    80001bb4:	06f57e63          	bgeu	a0,a5,80001c30 <_ZN15MemoryAllocator9mem_allocEm+0x114>
        usedMemHead->prev = blk;
    80001bb8:	00a7b423          	sd	a0,8(a5)
        blk->next = usedMemHead;
    80001bbc:	00f53023          	sd	a5,0(a0)
        blk->prev = nullptr;
    80001bc0:	00053423          	sd	zero,8(a0)
        usedMemHead = blk;
    80001bc4:	0000a797          	auipc	a5,0xa
    80001bc8:	bea7b623          	sd	a0,-1044(a5) # 8000b7b0 <_ZN15MemoryAllocator11usedMemHeadE>
        blk->prev = blkUsed;
        if(blk->next) blk->next->prev = blk;
        blkUsed->next = blk;
    }

    return (char*)blk + sizeof(BlockHeader);
    80001bcc:	01850513          	addi	a0,a0,24

}
    80001bd0:	00813403          	ld	s0,8(sp)
    80001bd4:	01010113          	addi	sp,sp,16
    80001bd8:	00008067          	ret
        else MemoryAllocator::freeMemHead = newBlk;
    80001bdc:	0000a697          	auipc	a3,0xa
    80001be0:	bcf6b623          	sd	a5,-1076(a3) # 8000b7a8 <_ZN15MemoryAllocator11freeMemHeadE>
    80001be4:	f95ff06f          	j	80001b78 <_ZN15MemoryAllocator9mem_allocEm+0x5c>
        if (blk->prev) blk->prev->next = blk->next;
    80001be8:	00853783          	ld	a5,8(a0)
    80001bec:	02078063          	beqz	a5,80001c0c <_ZN15MemoryAllocator9mem_allocEm+0xf0>
    80001bf0:	00053703          	ld	a4,0(a0)
    80001bf4:	00e7b023          	sd	a4,0(a5)
        if(blk->next) blk->next->prev = blk->prev;
    80001bf8:	00053783          	ld	a5,0(a0)
    80001bfc:	fa0786e3          	beqz	a5,80001ba8 <_ZN15MemoryAllocator9mem_allocEm+0x8c>
    80001c00:	00853703          	ld	a4,8(a0)
    80001c04:	00e7b423          	sd	a4,8(a5)
    80001c08:	fa1ff06f          	j	80001ba8 <_ZN15MemoryAllocator9mem_allocEm+0x8c>
        else MemoryAllocator::freeMemHead = blk->next;
    80001c0c:	00053783          	ld	a5,0(a0)
    80001c10:	0000a717          	auipc	a4,0xa
    80001c14:	b8f73c23          	sd	a5,-1128(a4) # 8000b7a8 <_ZN15MemoryAllocator11freeMemHeadE>
    80001c18:	fe1ff06f          	j	80001bf8 <_ZN15MemoryAllocator9mem_allocEm+0xdc>
        usedMemHead = blk;
    80001c1c:	0000a797          	auipc	a5,0xa
    80001c20:	b8a7ba23          	sd	a0,-1132(a5) # 8000b7b0 <_ZN15MemoryAllocator11usedMemHeadE>
        blk->next = nullptr;
    80001c24:	00053023          	sd	zero,0(a0)
        blk->prev = nullptr;
    80001c28:	00053423          	sd	zero,8(a0)
    80001c2c:	fa1ff06f          	j	80001bcc <_ZN15MemoryAllocator9mem_allocEm+0xb0>
        for(; blkUsed->next && (char*)(blkUsed->next) < (char*) blk; blkUsed = blkUsed->next);
    80001c30:	00078713          	mv	a4,a5
    80001c34:	0007b783          	ld	a5,0(a5)
    80001c38:	00078463          	beqz	a5,80001c40 <_ZN15MemoryAllocator9mem_allocEm+0x124>
    80001c3c:	fea7eae3          	bltu	a5,a0,80001c30 <_ZN15MemoryAllocator9mem_allocEm+0x114>
        blk->next = blkUsed->next;
    80001c40:	00f53023          	sd	a5,0(a0)
        blk->prev = blkUsed;
    80001c44:	00e53423          	sd	a4,8(a0)
        if(blk->next) blk->next->prev = blk;
    80001c48:	00078463          	beqz	a5,80001c50 <_ZN15MemoryAllocator9mem_allocEm+0x134>
    80001c4c:	00a7b423          	sd	a0,8(a5)
        blkUsed->next = blk;
    80001c50:	00a73023          	sd	a0,0(a4)
    80001c54:	f79ff06f          	j	80001bcc <_ZN15MemoryAllocator9mem_allocEm+0xb0>

0000000080001c58 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader>:

    return 0;
}


void MemoryAllocator::tryToJoin(BlockHeader* cur) {
    80001c58:	ff010113          	addi	sp,sp,-16
    80001c5c:	00813423          	sd	s0,8(sp)
    80001c60:	01010413          	addi	s0,sp,16

    if (!cur) return;
    80001c64:	00050e63          	beqz	a0,80001c80 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x28>
    if (cur->next && (char*)cur+cur->size+sizeof(BlockHeader)== (char*)(cur->next)) {
    80001c68:	00053783          	ld	a5,0(a0)
    80001c6c:	00078a63          	beqz	a5,80001c80 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x28>
    80001c70:	01053683          	ld	a3,16(a0)
    80001c74:	01868713          	addi	a4,a3,24
    80001c78:	00e50733          	add	a4,a0,a4
    80001c7c:	00e78863          	beq	a5,a4,80001c8c <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x34>
        cur->size += cur->next->size+sizeof(BlockHeader);
        cur->next = cur->next->next;
        if (cur->next) cur->next->prev = cur;
    }

}
    80001c80:	00813403          	ld	s0,8(sp)
    80001c84:	01010113          	addi	sp,sp,16
    80001c88:	00008067          	ret
        cur->size += cur->next->size+sizeof(BlockHeader);
    80001c8c:	0107b703          	ld	a4,16(a5)
    80001c90:	00e686b3          	add	a3,a3,a4
    80001c94:	01868693          	addi	a3,a3,24
    80001c98:	00d53823          	sd	a3,16(a0)
        cur->next = cur->next->next;
    80001c9c:	0007b783          	ld	a5,0(a5)
    80001ca0:	00f53023          	sd	a5,0(a0)
        if (cur->next) cur->next->prev = cur;
    80001ca4:	fc078ee3          	beqz	a5,80001c80 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x28>
    80001ca8:	00a7b423          	sd	a0,8(a5)
    80001cac:	fd5ff06f          	j	80001c80 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader+0x28>

0000000080001cb0 <_ZN15MemoryAllocator8mem_freeEPv>:
    if (usedMemHead == nullptr) return -1;
    80001cb0:	0000a697          	auipc	a3,0xa
    80001cb4:	b006b683          	ld	a3,-1280(a3) # 8000b7b0 <_ZN15MemoryAllocator11usedMemHeadE>
    80001cb8:	10068e63          	beqz	a3,80001dd4 <_ZN15MemoryAllocator8mem_freeEPv+0x124>
int MemoryAllocator::mem_free(void* ptr) {
    80001cbc:	fe010113          	addi	sp,sp,-32
    80001cc0:	00113c23          	sd	ra,24(sp)
    80001cc4:	00813823          	sd	s0,16(sp)
    80001cc8:	00913423          	sd	s1,8(sp)
    80001ccc:	02010413          	addi	s0,sp,32
    80001cd0:	00050493          	mv	s1,a0
    if (ptr == nullptr || ptr < HEAP_START_ADDR || ptr > HEAP_END_ADDR) return -2;
    80001cd4:	10050463          	beqz	a0,80001ddc <_ZN15MemoryAllocator8mem_freeEPv+0x12c>
    80001cd8:	0000a797          	auipc	a5,0xa
    80001cdc:	a407b783          	ld	a5,-1472(a5) # 8000b718 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001ce0:	0007b783          	ld	a5,0(a5)
    80001ce4:	10f56063          	bltu	a0,a5,80001de4 <_ZN15MemoryAllocator8mem_freeEPv+0x134>
    80001ce8:	0000a797          	auipc	a5,0xa
    80001cec:	a607b783          	ld	a5,-1440(a5) # 8000b748 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001cf0:	0007b783          	ld	a5,0(a5)
    80001cf4:	0ea7ec63          	bltu	a5,a0,80001dec <_ZN15MemoryAllocator8mem_freeEPv+0x13c>
    BlockHeader* cur = usedMemHead;
    80001cf8:	00068793          	mv	a5,a3
    while (cur != nullptr) {
    80001cfc:	00078a63          	beqz	a5,80001d10 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        if ((char*)cur + sizeof(BlockHeader) == ptr) break;
    80001d00:	01878713          	addi	a4,a5,24
    80001d04:	00970663          	beq	a4,s1,80001d10 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        cur = cur->next;
    80001d08:	0007b783          	ld	a5,0(a5)
    while (cur != nullptr) {
    80001d0c:	ff1ff06f          	j	80001cfc <_ZN15MemoryAllocator8mem_freeEPv+0x4c>
    if (cur == nullptr) return -3;
    80001d10:	0e078263          	beqz	a5,80001df4 <_ZN15MemoryAllocator8mem_freeEPv+0x144>
    BlockHeader* blockToFree = (BlockHeader*)((char*)ptr - sizeof(BlockHeader));
    80001d14:	fe848513          	addi	a0,s1,-24
    if (blockToFree == usedMemHead) {
    80001d18:	06a68c63          	beq	a3,a0,80001d90 <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
        blockToFree->prev->next = blockToFree->next;
    80001d1c:	ff04b703          	ld	a4,-16(s1)
    80001d20:	fe84b783          	ld	a5,-24(s1)
    80001d24:	00f73023          	sd	a5,0(a4)
        if (blockToFree->next) blockToFree->next->prev = blockToFree->prev;
    80001d28:	00078663          	beqz	a5,80001d34 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    80001d2c:	ff04b703          	ld	a4,-16(s1)
    80001d30:	00e7b423          	sd	a4,8(a5)
    blockToFree->next = nullptr;
    80001d34:	fe04b423          	sd	zero,-24(s1)
    blockToFree->prev = nullptr;
    80001d38:	fe04b823          	sd	zero,-16(s1)
    if (!freeMemHead || (char*)blockToFree < (char*)freeMemHead) {
    80001d3c:	0000a797          	auipc	a5,0xa
    80001d40:	a6c7b783          	ld	a5,-1428(a5) # 8000b7a8 <_ZN15MemoryAllocator11freeMemHeadE>
    80001d44:	00078463          	beqz	a5,80001d4c <_ZN15MemoryAllocator8mem_freeEPv+0x9c>
    80001d48:	06f57063          	bgeu	a0,a5,80001da8 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
        blockToFree->next = freeMemHead;
    80001d4c:	fef4b423          	sd	a5,-24(s1)
        if (freeMemHead) freeMemHead->prev = blockToFree;
    80001d50:	00078463          	beqz	a5,80001d58 <_ZN15MemoryAllocator8mem_freeEPv+0xa8>
    80001d54:	00a7b423          	sd	a0,8(a5)
        freeMemHead = blockToFree;
    80001d58:	0000a797          	auipc	a5,0xa
    80001d5c:	a4a7b823          	sd	a0,-1456(a5) # 8000b7a8 <_ZN15MemoryAllocator11freeMemHeadE>
    tryToJoin(blockToFree);
    80001d60:	00000097          	auipc	ra,0x0
    80001d64:	ef8080e7          	jalr	-264(ra) # 80001c58 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader>
    if (blockToFree->prev) tryToJoin(blockToFree->prev);
    80001d68:	ff04b503          	ld	a0,-16(s1)
    80001d6c:	08050863          	beqz	a0,80001dfc <_ZN15MemoryAllocator8mem_freeEPv+0x14c>
    80001d70:	00000097          	auipc	ra,0x0
    80001d74:	ee8080e7          	jalr	-280(ra) # 80001c58 <_ZN15MemoryAllocator9tryToJoinEP11BlockHeader>
    return 0;
    80001d78:	00000513          	li	a0,0
}
    80001d7c:	01813083          	ld	ra,24(sp)
    80001d80:	01013403          	ld	s0,16(sp)
    80001d84:	00813483          	ld	s1,8(sp)
    80001d88:	02010113          	addi	sp,sp,32
    80001d8c:	00008067          	ret
        usedMemHead = usedMemHead->next;
    80001d90:	0006b783          	ld	a5,0(a3)
    80001d94:	0000a717          	auipc	a4,0xa
    80001d98:	a0f73e23          	sd	a5,-1508(a4) # 8000b7b0 <_ZN15MemoryAllocator11usedMemHeadE>
        if (usedMemHead) usedMemHead->prev = nullptr;
    80001d9c:	f8078ce3          	beqz	a5,80001d34 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    80001da0:	0007b423          	sd	zero,8(a5)
    80001da4:	f91ff06f          	j	80001d34 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
        while (cur->next != nullptr && (char*)(cur->next) < (char*)blockToFree) {
    80001da8:	00078713          	mv	a4,a5
    80001dac:	0007b783          	ld	a5,0(a5)
    80001db0:	00078463          	beqz	a5,80001db8 <_ZN15MemoryAllocator8mem_freeEPv+0x108>
    80001db4:	fea7eae3          	bltu	a5,a0,80001da8 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
        blockToFree->next = cur->next;
    80001db8:	fef4b423          	sd	a5,-24(s1)
        blockToFree->prev = cur;
    80001dbc:	fee4b823          	sd	a4,-16(s1)
        cur->next = blockToFree;
    80001dc0:	00a73023          	sd	a0,0(a4)
        if (blockToFree->next) blockToFree->next->prev = blockToFree;
    80001dc4:	fe84b783          	ld	a5,-24(s1)
    80001dc8:	f8078ce3          	beqz	a5,80001d60 <_ZN15MemoryAllocator8mem_freeEPv+0xb0>
    80001dcc:	00a7b423          	sd	a0,8(a5)
    80001dd0:	f91ff06f          	j	80001d60 <_ZN15MemoryAllocator8mem_freeEPv+0xb0>
    if (usedMemHead == nullptr) return -1;
    80001dd4:	fff00513          	li	a0,-1
}
    80001dd8:	00008067          	ret
    if (ptr == nullptr || ptr < HEAP_START_ADDR || ptr > HEAP_END_ADDR) return -2;
    80001ddc:	ffe00513          	li	a0,-2
    80001de0:	f9dff06f          	j	80001d7c <_ZN15MemoryAllocator8mem_freeEPv+0xcc>
    80001de4:	ffe00513          	li	a0,-2
    80001de8:	f95ff06f          	j	80001d7c <_ZN15MemoryAllocator8mem_freeEPv+0xcc>
    80001dec:	ffe00513          	li	a0,-2
    80001df0:	f8dff06f          	j	80001d7c <_ZN15MemoryAllocator8mem_freeEPv+0xcc>
    if (cur == nullptr) return -3;
    80001df4:	ffd00513          	li	a0,-3
    80001df8:	f85ff06f          	j	80001d7c <_ZN15MemoryAllocator8mem_freeEPv+0xcc>
    return 0;
    80001dfc:	00000513          	li	a0,0
    80001e00:	f7dff06f          	j	80001d7c <_ZN15MemoryAllocator8mem_freeEPv+0xcc>

0000000080001e04 <_ZN6ThreadD1Ev>:

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
}

Thread::~Thread() {
    80001e04:	fe010113          	addi	sp,sp,-32
    80001e08:	00113c23          	sd	ra,24(sp)
    80001e0c:	00813823          	sd	s0,16(sp)
    80001e10:	00913423          	sd	s1,8(sp)
    80001e14:	02010413          	addi	s0,sp,32
    80001e18:	00009797          	auipc	a5,0x9
    80001e1c:	6e878793          	addi	a5,a5,1768 # 8000b500 <_ZTV6Thread+0x10>
    80001e20:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    80001e24:	00853483          	ld	s1,8(a0)
    80001e28:	02048063          	beqz	s1,80001e48 <_ZN6ThreadD1Ev+0x44>
    ~TCB() { delete[] stack; }
    80001e2c:	0084b503          	ld	a0,8(s1)
    80001e30:	00050663          	beqz	a0,80001e3c <_ZN6ThreadD1Ev+0x38>
    80001e34:	00000097          	auipc	ra,0x0
    80001e38:	8c8080e7          	jalr	-1848(ra) # 800016fc <_ZdaPv>
    80001e3c:	00048513          	mv	a0,s1
    80001e40:	00000097          	auipc	ra,0x0
    80001e44:	894080e7          	jalr	-1900(ra) # 800016d4 <_ZdlPv>
}
    80001e48:	01813083          	ld	ra,24(sp)
    80001e4c:	01013403          	ld	s0,16(sp)
    80001e50:	00813483          	ld	s1,8(sp)
    80001e54:	02010113          	addi	sp,sp,32
    80001e58:	00008067          	ret

0000000080001e5c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001e5c:	fe010113          	addi	sp,sp,-32
    80001e60:	00113c23          	sd	ra,24(sp)
    80001e64:	00813823          	sd	s0,16(sp)
    80001e68:	00913423          	sd	s1,8(sp)
    80001e6c:	02010413          	addi	s0,sp,32
    80001e70:	00050493          	mv	s1,a0
}
    80001e74:	00000097          	auipc	ra,0x0
    80001e78:	f90080e7          	jalr	-112(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80001e7c:	00048513          	mv	a0,s1
    80001e80:	00000097          	auipc	ra,0x0
    80001e84:	854080e7          	jalr	-1964(ra) # 800016d4 <_ZdlPv>
    80001e88:	01813083          	ld	ra,24(sp)
    80001e8c:	01013403          	ld	s0,16(sp)
    80001e90:	00813483          	ld	s1,8(sp)
    80001e94:	02010113          	addi	sp,sp,32
    80001e98:	00008067          	ret

0000000080001e9c <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, (int)init);
}

Semaphore::~Semaphore() {
    80001e9c:	fe010113          	addi	sp,sp,-32
    80001ea0:	00113c23          	sd	ra,24(sp)
    80001ea4:	00813823          	sd	s0,16(sp)
    80001ea8:	00913423          	sd	s1,8(sp)
    80001eac:	02010413          	addi	s0,sp,32
    80001eb0:	00050493          	mv	s1,a0
    80001eb4:	00009797          	auipc	a5,0x9
    80001eb8:	67478793          	addi	a5,a5,1652 # 8000b528 <_ZTV9Semaphore+0x10>
    80001ebc:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001ec0:	00853503          	ld	a0,8(a0)
    80001ec4:	fffff097          	auipc	ra,0xfffff
    80001ec8:	640080e7          	jalr	1600(ra) # 80001504 <_Z9sem_closeP13SyncSemaphore>
    delete myHandle;
    80001ecc:	0084b503          	ld	a0,8(s1)
    80001ed0:	00050663          	beqz	a0,80001edc <_ZN9SemaphoreD1Ev+0x40>
    80001ed4:	00000097          	auipc	ra,0x0
    80001ed8:	800080e7          	jalr	-2048(ra) # 800016d4 <_ZdlPv>
}
    80001edc:	01813083          	ld	ra,24(sp)
    80001ee0:	01013403          	ld	s0,16(sp)
    80001ee4:	00813483          	ld	s1,8(sp)
    80001ee8:	02010113          	addi	sp,sp,32
    80001eec:	00008067          	ret

0000000080001ef0 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001ef0:	fe010113          	addi	sp,sp,-32
    80001ef4:	00113c23          	sd	ra,24(sp)
    80001ef8:	00813823          	sd	s0,16(sp)
    80001efc:	00913423          	sd	s1,8(sp)
    80001f00:	02010413          	addi	s0,sp,32
    80001f04:	00050493          	mv	s1,a0
}
    80001f08:	00000097          	auipc	ra,0x0
    80001f0c:	f94080e7          	jalr	-108(ra) # 80001e9c <_ZN9SemaphoreD1Ev>
    80001f10:	00048513          	mv	a0,s1
    80001f14:	fffff097          	auipc	ra,0xfffff
    80001f18:	7c0080e7          	jalr	1984(ra) # 800016d4 <_ZdlPv>
    80001f1c:	01813083          	ld	ra,24(sp)
    80001f20:	01013403          	ld	s0,16(sp)
    80001f24:	00813483          	ld	s1,8(sp)
    80001f28:	02010113          	addi	sp,sp,32
    80001f2c:	00008067          	ret

0000000080001f30 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001f30:	ff010113          	addi	sp,sp,-16
    80001f34:	00113423          	sd	ra,8(sp)
    80001f38:	00813023          	sd	s0,0(sp)
    80001f3c:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001f40:	fffff097          	auipc	ra,0xfffff
    80001f44:	574080e7          	jalr	1396(ra) # 800014b4 <_Z15thread_dispatchv>
}
    80001f48:	00813083          	ld	ra,8(sp)
    80001f4c:	00013403          	ld	s0,0(sp)
    80001f50:	01010113          	addi	sp,sp,16
    80001f54:	00008067          	ret

0000000080001f58 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001f58:	ff010113          	addi	sp,sp,-16
    80001f5c:	00113423          	sd	ra,8(sp)
    80001f60:	00813023          	sd	s0,0(sp)
    80001f64:	01010413          	addi	s0,sp,16
    80001f68:	00009797          	auipc	a5,0x9
    80001f6c:	59878793          	addi	a5,a5,1432 # 8000b500 <_ZTV6Thread+0x10>
    80001f70:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    80001f74:	00850513          	addi	a0,a0,8
    80001f78:	fffff097          	auipc	ra,0xfffff
    80001f7c:	4e0080e7          	jalr	1248(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001f80:	00813083          	ld	ra,8(sp)
    80001f84:	00013403          	ld	s0,0(sp)
    80001f88:	01010113          	addi	sp,sp,16
    80001f8c:	00008067          	ret

0000000080001f90 <_ZN6Thread5startEv>:
int Thread::start() {
    80001f90:	ff010113          	addi	sp,sp,-16
    80001f94:	00113423          	sd	ra,8(sp)
    80001f98:	00813023          	sd	s0,0(sp)
    80001f9c:	01010413          	addi	s0,sp,16
    thread_start(myHandle);
    80001fa0:	00853503          	ld	a0,8(a0)
    80001fa4:	fffff097          	auipc	ra,0xfffff
    80001fa8:	45c080e7          	jalr	1116(ra) # 80001400 <_Z12thread_startP3TCB>
}
    80001fac:	00000513          	li	a0,0
    80001fb0:	00813083          	ld	ra,8(sp)
    80001fb4:	00013403          	ld	s0,0(sp)
    80001fb8:	01010113          	addi	sp,sp,16
    80001fbc:	00008067          	ret

0000000080001fc0 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80001fc0:	ff010113          	addi	sp,sp,-16
    80001fc4:	00113423          	sd	ra,8(sp)
    80001fc8:	00813023          	sd	s0,0(sp)
    80001fcc:	01010413          	addi	s0,sp,16
    80001fd0:	00009797          	auipc	a5,0x9
    80001fd4:	53078793          	addi	a5,a5,1328 # 8000b500 <_ZTV6Thread+0x10>
    80001fd8:	00f53023          	sd	a5,0(a0)
    thread_init(&myHandle, wrapper, this);
    80001fdc:	00050613          	mv	a2,a0
    80001fe0:	00000597          	auipc	a1,0x0
    80001fe4:	1dc58593          	addi	a1,a1,476 # 800021bc <_ZN6Thread7wrapperEPv>
    80001fe8:	00850513          	addi	a0,a0,8
    80001fec:	fffff097          	auipc	ra,0xfffff
    80001ff0:	438080e7          	jalr	1080(ra) # 80001424 <_Z11thread_initPP3TCBPFvPvES2_>
}
    80001ff4:	00813083          	ld	ra,8(sp)
    80001ff8:	00013403          	ld	s0,0(sp)
    80001ffc:	01010113          	addi	sp,sp,16
    80002000:	00008067          	ret

0000000080002004 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    80002004:	ff010113          	addi	sp,sp,-16
    80002008:	00813423          	sd	s0,8(sp)
    8000200c:	01010413          	addi	s0,sp,16
}
    80002010:	00000513          	li	a0,0
    80002014:	00813403          	ld	s0,8(sp)
    80002018:	01010113          	addi	sp,sp,16
    8000201c:	00008067          	ret

0000000080002020 <_ZN6Thread11synchronizeEv>:
void Thread::synchronize() {
    80002020:	ff010113          	addi	sp,sp,-16
    80002024:	00113423          	sd	ra,8(sp)
    80002028:	00813023          	sd	s0,0(sp)
    8000202c:	01010413          	addi	s0,sp,16
    ::synchronize(myHandle);
    80002030:	00853503          	ld	a0,8(a0)
    80002034:	fffff097          	auipc	ra,0xfffff
    80002038:	62c080e7          	jalr	1580(ra) # 80001660 <_Z11synchronizeP3TCB>
}
    8000203c:	00813083          	ld	ra,8(sp)
    80002040:	00013403          	ld	s0,0(sp)
    80002044:	01010113          	addi	sp,sp,16
    80002048:	00008067          	ret

000000008000204c <_ZN6Thread4pairEPS_S0_>:
void Thread::pair(Thread *t1, Thread* t2) {
    8000204c:	ff010113          	addi	sp,sp,-16
    80002050:	00113423          	sd	ra,8(sp)
    80002054:	00813023          	sd	s0,0(sp)
    80002058:	01010413          	addi	s0,sp,16
    ::pair(t1->myHandle, t2->myHandle);
    8000205c:	0085b583          	ld	a1,8(a1)
    80002060:	00853503          	ld	a0,8(a0)
    80002064:	fffff097          	auipc	ra,0xfffff
    80002068:	5d4080e7          	jalr	1492(ra) # 80001638 <_Z4pairP3TCBS0_>
}
    8000206c:	00813083          	ld	ra,8(sp)
    80002070:	00013403          	ld	s0,0(sp)
    80002074:	01010113          	addi	sp,sp,16
    80002078:	00008067          	ret

000000008000207c <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    8000207c:	ff010113          	addi	sp,sp,-16
    80002080:	00113423          	sd	ra,8(sp)
    80002084:	00813023          	sd	s0,0(sp)
    80002088:	01010413          	addi	s0,sp,16
    8000208c:	00009797          	auipc	a5,0x9
    80002090:	49c78793          	addi	a5,a5,1180 # 8000b528 <_ZTV9Semaphore+0x10>
    80002094:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, (int)init);
    80002098:	00850513          	addi	a0,a0,8
    8000209c:	fffff097          	auipc	ra,0xfffff
    800020a0:	438080e7          	jalr	1080(ra) # 800014d4 <_Z8sem_openPP13SyncSemaphorej>
}
    800020a4:	00813083          	ld	ra,8(sp)
    800020a8:	00013403          	ld	s0,0(sp)
    800020ac:	01010113          	addi	sp,sp,16
    800020b0:	00008067          	ret

00000000800020b4 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800020b4:	ff010113          	addi	sp,sp,-16
    800020b8:	00113423          	sd	ra,8(sp)
    800020bc:	00813023          	sd	s0,0(sp)
    800020c0:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800020c4:	00853503          	ld	a0,8(a0)
    800020c8:	fffff097          	auipc	ra,0xfffff
    800020cc:	468080e7          	jalr	1128(ra) # 80001530 <_Z8sem_waitP13SyncSemaphore>
}
    800020d0:	00813083          	ld	ra,8(sp)
    800020d4:	00013403          	ld	s0,0(sp)
    800020d8:	01010113          	addi	sp,sp,16
    800020dc:	00008067          	ret

00000000800020e0 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800020e0:	ff010113          	addi	sp,sp,-16
    800020e4:	00113423          	sd	ra,8(sp)
    800020e8:	00813023          	sd	s0,0(sp)
    800020ec:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800020f0:	00853503          	ld	a0,8(a0)
    800020f4:	fffff097          	auipc	ra,0xfffff
    800020f8:	468080e7          	jalr	1128(ra) # 8000155c <_Z10sem_signalP13SyncSemaphore>
}
    800020fc:	00813083          	ld	ra,8(sp)
    80002100:	00013403          	ld	s0,0(sp)
    80002104:	01010113          	addi	sp,sp,16
    80002108:	00008067          	ret

000000008000210c <_ZN9Semaphore7tryWaitEv>:

int Semaphore::tryWait() {
    8000210c:	ff010113          	addi	sp,sp,-16
    80002110:	00113423          	sd	ra,8(sp)
    80002114:	00813023          	sd	s0,0(sp)
    80002118:	01010413          	addi	s0,sp,16
    return sem_trywait(myHandle);
    8000211c:	00853503          	ld	a0,8(a0)
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	468080e7          	jalr	1128(ra) # 80001588 <_Z11sem_trywaitP13SyncSemaphore>
}
    80002128:	00813083          	ld	ra,8(sp)
    8000212c:	00013403          	ld	s0,0(sp)
    80002130:	01010113          	addi	sp,sp,16
    80002134:	00008067          	ret

0000000080002138 <_ZN9Semaphore9timedWaitEm>:

int Semaphore::timedWait(time_t) {
    80002138:	ff010113          	addi	sp,sp,-16
    8000213c:	00813423          	sd	s0,8(sp)
    80002140:	01010413          	addi	s0,sp,16
    return 0;
}
    80002144:	00000513          	li	a0,0
    80002148:	00813403          	ld	s0,8(sp)
    8000214c:	01010113          	addi	sp,sp,16
    80002150:	00008067          	ret

0000000080002154 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002154:	ff010113          	addi	sp,sp,-16
    80002158:	00113423          	sd	ra,8(sp)
    8000215c:	00813023          	sd	s0,0(sp)
    80002160:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002164:	fffff097          	auipc	ra,0xfffff
    80002168:	478080e7          	jalr	1144(ra) # 800015dc <_Z4putcc>
}
    8000216c:	00813083          	ld	ra,8(sp)
    80002170:	00013403          	ld	s0,0(sp)
    80002174:	01010113          	addi	sp,sp,16
    80002178:	00008067          	ret

000000008000217c <_ZN7Console4getcEv>:

char Console::getc() {
    8000217c:	ff010113          	addi	sp,sp,-16
    80002180:	00113423          	sd	ra,8(sp)
    80002184:	00813023          	sd	s0,0(sp)
    80002188:	01010413          	addi	s0,sp,16
    return ::getc();
    8000218c:	fffff097          	auipc	ra,0xfffff
    80002190:	428080e7          	jalr	1064(ra) # 800015b4 <_Z4getcv>
}
    80002194:	00813083          	ld	ra,8(sp)
    80002198:	00013403          	ld	s0,0(sp)
    8000219c:	01010113          	addi	sp,sp,16
    800021a0:	00008067          	ret

00000000800021a4 <_ZN6Thread3runEv>:

    bool isFinishedThread(){ return myHandle->isFinished(); };

protected:
    Thread ();
    virtual void run() {};
    800021a4:	ff010113          	addi	sp,sp,-16
    800021a8:	00813423          	sd	s0,8(sp)
    800021ac:	01010413          	addi	s0,sp,16
    800021b0:	00813403          	ld	s0,8(sp)
    800021b4:	01010113          	addi	sp,sp,16
    800021b8:	00008067          	ret

00000000800021bc <_ZN6Thread7wrapperEPv>:
    thread_t myHandle;
    void (*body)(void*);
    void* arg;

    static void wrapper(void *thread) {
        if (thread != nullptr) {
    800021bc:	02050863          	beqz	a0,800021ec <_ZN6Thread7wrapperEPv+0x30>
    static void wrapper(void *thread) {
    800021c0:	ff010113          	addi	sp,sp,-16
    800021c4:	00113423          	sd	ra,8(sp)
    800021c8:	00813023          	sd	s0,0(sp)
    800021cc:	01010413          	addi	s0,sp,16
            ((Thread *) thread)->run();
    800021d0:	00053783          	ld	a5,0(a0)
    800021d4:	0107b783          	ld	a5,16(a5)
    800021d8:	000780e7          	jalr	a5
        }
    }
    800021dc:	00813083          	ld	ra,8(sp)
    800021e0:	00013403          	ld	s0,0(sp)
    800021e4:	01010113          	addi	sp,sp,16
    800021e8:	00008067          	ret
    800021ec:	00008067          	ret

00000000800021f0 <_ZN13SyncSemaphore19createSyncSemaphoreEi>:
#include "../h/syncSemaphore.hpp"
#include "../h/syscall_c.hpp"

SyncSemaphore *SyncSemaphore::createSyncSemaphore(int semValue){
    800021f0:	fe010113          	addi	sp,sp,-32
    800021f4:	00113c23          	sd	ra,24(sp)
    800021f8:	00813823          	sd	s0,16(sp)
    800021fc:	00913423          	sd	s1,8(sp)
    80002200:	02010413          	addi	s0,sp,32
    80002204:	00050493          	mv	s1,a0
    return new SyncSemaphore(semValue);
    80002208:	02000513          	li	a0,32
    8000220c:	fffff097          	auipc	ra,0xfffff
    80002210:	478080e7          	jalr	1144(ra) # 80001684 <_Znwm>
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80002214:	00053423          	sd	zero,8(a0)
    80002218:	00053823          	sd	zero,16(a0)
    int semValue;
    List<TCB> blockedList;
    bool done;

public:
    explicit SyncSemaphore(int semValue = 1) { this->semValue = semValue; this->done = false;}
    8000221c:	00952023          	sw	s1,0(a0)
    80002220:	00050c23          	sb	zero,24(a0)
}
    80002224:	01813083          	ld	ra,24(sp)
    80002228:	01013403          	ld	s0,16(sp)
    8000222c:	00813483          	ld	s1,8(sp)
    80002230:	02010113          	addi	sp,sp,32
    80002234:	00008067          	ret

0000000080002238 <_ZN13SyncSemaphore4waitEv>:

int SyncSemaphore::wait()
{
    if(done) return -1;
    80002238:	01854783          	lbu	a5,24(a0)
    8000223c:	0a079c63          	bnez	a5,800022f4 <_ZN13SyncSemaphore4waitEv+0xbc>
{
    80002240:	fe010113          	addi	sp,sp,-32
    80002244:	00113c23          	sd	ra,24(sp)
    80002248:	00813823          	sd	s0,16(sp)
    8000224c:	00913423          	sd	s1,8(sp)
    80002250:	01213023          	sd	s2,0(sp)
    80002254:	02010413          	addi	s0,sp,32
    80002258:	00050493          	mv	s1,a0

    if(--semValue < 0) {
    8000225c:	00052783          	lw	a5,0(a0)
    80002260:	fff7879b          	addiw	a5,a5,-1
    80002264:	00f52023          	sw	a5,0(a0)
    80002268:	02079713          	slli	a4,a5,0x20
    8000226c:	02074063          	bltz	a4,8000228c <_ZN13SyncSemaphore4waitEv+0x54>
        TCB::running->setBlocked(true);
        thread_dispatch();

        if(done) return -1;
    }
    return 0;
    80002270:	00000513          	li	a0,0
}
    80002274:	01813083          	ld	ra,24(sp)
    80002278:	01013403          	ld	s0,16(sp)
    8000227c:	00813483          	ld	s1,8(sp)
    80002280:	00013903          	ld	s2,0(sp)
    80002284:	02010113          	addi	sp,sp,32
    80002288:	00008067          	ret
        blockedList.addLast(TCB::running);
    8000228c:	00009797          	auipc	a5,0x9
    80002290:	4b47b783          	ld	a5,1204(a5) # 8000b740 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002294:	0007b903          	ld	s2,0(a5)
        if (!tail) { tail = head; }
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
    80002298:	01000513          	li	a0,16
    8000229c:	fffff097          	auipc	ra,0xfffff
    800022a0:	3e8080e7          	jalr	1000(ra) # 80001684 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800022a4:	01253023          	sd	s2,0(a0)
    800022a8:	00053423          	sd	zero,8(a0)
        if (tail)
    800022ac:	0104b783          	ld	a5,16(s1)
    800022b0:	02078c63          	beqz	a5,800022e8 <_ZN13SyncSemaphore4waitEv+0xb0>
        {
            tail->next = elem;
    800022b4:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800022b8:	00a4b823          	sd	a0,16(s1)
        TCB::running->setBlocked(true);
    800022bc:	00009797          	auipc	a5,0x9
    800022c0:	4847b783          	ld	a5,1156(a5) # 8000b740 <_GLOBAL_OFFSET_TABLE_+0x38>
    800022c4:	0007b783          	ld	a5,0(a5)
    void setBlocked(bool value) { this->blocked = value; }
    800022c8:	00100713          	li	a4,1
    800022cc:	02e780a3          	sb	a4,33(a5)
        thread_dispatch();
    800022d0:	fffff097          	auipc	ra,0xfffff
    800022d4:	1e4080e7          	jalr	484(ra) # 800014b4 <_Z15thread_dispatchv>
        if(done) return -1;
    800022d8:	0184c783          	lbu	a5,24(s1)
    800022dc:	02079063          	bnez	a5,800022fc <_ZN13SyncSemaphore4waitEv+0xc4>
    return 0;
    800022e0:	00000513          	li	a0,0
    800022e4:	f91ff06f          	j	80002274 <_ZN13SyncSemaphore4waitEv+0x3c>
        } else
        {
            head = tail = elem;
    800022e8:	00a4b823          	sd	a0,16(s1)
    800022ec:	00a4b423          	sd	a0,8(s1)
    800022f0:	fcdff06f          	j	800022bc <_ZN13SyncSemaphore4waitEv+0x84>
    if(done) return -1;
    800022f4:	fff00513          	li	a0,-1
}
    800022f8:	00008067          	ret
        if(done) return -1;
    800022fc:	fff00513          	li	a0,-1
    80002300:	f75ff06f          	j	80002274 <_ZN13SyncSemaphore4waitEv+0x3c>

0000000080002304 <_ZN13SyncSemaphore6signalEv>:

int SyncSemaphore::signal()
{
    if(done) return -1;
    80002304:	01854703          	lbu	a4,24(a0)
    80002308:	08071863          	bnez	a4,80002398 <_ZN13SyncSemaphore6signalEv+0x94>
    8000230c:	00050793          	mv	a5,a0

    if(++semValue <= 0) {
    80002310:	00052703          	lw	a4,0(a0)
    80002314:	0017071b          	addiw	a4,a4,1
    80002318:	0007069b          	sext.w	a3,a4
    8000231c:	00e52023          	sw	a4,0(a0)
    80002320:	00d05663          	blez	a3,8000232c <_ZN13SyncSemaphore6signalEv+0x28>
        TCB *tcb = blockedList.removeFirst();
        tcb->setBlocked(false);
        Scheduler::put(tcb);
    }
    return 0;
    80002324:	00000513          	li	a0,0
}
    80002328:	00008067          	ret
{
    8000232c:	fe010113          	addi	sp,sp,-32
    80002330:	00113c23          	sd	ra,24(sp)
    80002334:	00813823          	sd	s0,16(sp)
    80002338:	00913423          	sd	s1,8(sp)
    8000233c:	02010413          	addi	s0,sp,32
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    80002340:	00853503          	ld	a0,8(a0)
    80002344:	04050663          	beqz	a0,80002390 <_ZN13SyncSemaphore6signalEv+0x8c>

        Elem *elem = head;
        head = head->next;
    80002348:	00853703          	ld	a4,8(a0)
    8000234c:	00e7b423          	sd	a4,8(a5)
        if (!head) { tail = 0; }
    80002350:	02070c63          	beqz	a4,80002388 <_ZN13SyncSemaphore6signalEv+0x84>

        T *ret = elem->data;
    80002354:	00053483          	ld	s1,0(a0)
        delete elem;
    80002358:	fffff097          	auipc	ra,0xfffff
    8000235c:	37c080e7          	jalr	892(ra) # 800016d4 <_ZdlPv>
    80002360:	020480a3          	sb	zero,33(s1)
        Scheduler::put(tcb);
    80002364:	00048513          	mv	a0,s1
    80002368:	00000097          	auipc	ra,0x0
    8000236c:	4fc080e7          	jalr	1276(ra) # 80002864 <_ZN9Scheduler3putEP3TCB>
    return 0;
    80002370:	00000513          	li	a0,0
}
    80002374:	01813083          	ld	ra,24(sp)
    80002378:	01013403          	ld	s0,16(sp)
    8000237c:	00813483          	ld	s1,8(sp)
    80002380:	02010113          	addi	sp,sp,32
    80002384:	00008067          	ret
        if (!head) { tail = 0; }
    80002388:	0007b823          	sd	zero,16(a5)
    8000238c:	fc9ff06f          	j	80002354 <_ZN13SyncSemaphore6signalEv+0x50>
        if (!head) { return 0; }
    80002390:	00050493          	mv	s1,a0
    80002394:	fcdff06f          	j	80002360 <_ZN13SyncSemaphore6signalEv+0x5c>
    if(done) return -1;
    80002398:	fff00513          	li	a0,-1
    8000239c:	00008067          	ret

00000000800023a0 <_ZN13SyncSemaphore5closeEv>:

int SyncSemaphore::close()
{
    if (done) return -1;
    800023a0:	01854783          	lbu	a5,24(a0)
    800023a4:	06079663          	bnez	a5,80002410 <_ZN13SyncSemaphore5closeEv+0x70>
{
    800023a8:	fe010113          	addi	sp,sp,-32
    800023ac:	00113c23          	sd	ra,24(sp)
    800023b0:	00813823          	sd	s0,16(sp)
    800023b4:	00913423          	sd	s1,8(sp)
    800023b8:	01213023          	sd	s2,0(sp)
    800023bc:	02010413          	addi	s0,sp,32
    800023c0:	00050493          	mv	s1,a0
    done = true;
    800023c4:	00100793          	li	a5,1
    800023c8:	00f50c23          	sb	a5,24(a0)
    800023cc:	0240006f          	j	800023f0 <_ZN13SyncSemaphore5closeEv+0x50>
        if (!head) { tail = 0; }
    800023d0:	0004b823          	sd	zero,16(s1)
        T *ret = elem->data;
    800023d4:	00053903          	ld	s2,0(a0)
        delete elem;
    800023d8:	fffff097          	auipc	ra,0xfffff
    800023dc:	2fc080e7          	jalr	764(ra) # 800016d4 <_ZdlPv>
    800023e0:	020900a3          	sb	zero,33(s2)

    while (blockedList.peekFirst()) {
        TCB* tcb = blockedList.removeFirst();
        tcb->setBlocked(false);
        Scheduler::put(tcb);
    800023e4:	00090513          	mv	a0,s2
    800023e8:	00000097          	auipc	ra,0x0
    800023ec:	47c080e7          	jalr	1148(ra) # 80002864 <_ZN9Scheduler3putEP3TCB>
        return ret;
    }

    T *peekFirst()
    {
        if (!head) { return 0; }
    800023f0:	0084b503          	ld	a0,8(s1)
    800023f4:	02050263          	beqz	a0,80002418 <_ZN13SyncSemaphore5closeEv+0x78>
        return head->data;
    800023f8:	00053783          	ld	a5,0(a0)
    while (blockedList.peekFirst()) {
    800023fc:	02078c63          	beqz	a5,80002434 <_ZN13SyncSemaphore5closeEv+0x94>
        head = head->next;
    80002400:	00853783          	ld	a5,8(a0)
    80002404:	00f4b423          	sd	a5,8(s1)
        if (!head) { tail = 0; }
    80002408:	fc0796e3          	bnez	a5,800023d4 <_ZN13SyncSemaphore5closeEv+0x34>
    8000240c:	fc5ff06f          	j	800023d0 <_ZN13SyncSemaphore5closeEv+0x30>
    if (done) return -1;
    80002410:	fff00513          	li	a0,-1
    }
    return 0;
}
    80002414:	00008067          	ret
    return 0;
    80002418:	00000513          	li	a0,0
}
    8000241c:	01813083          	ld	ra,24(sp)
    80002420:	01013403          	ld	s0,16(sp)
    80002424:	00813483          	ld	s1,8(sp)
    80002428:	00013903          	ld	s2,0(sp)
    8000242c:	02010113          	addi	sp,sp,32
    80002430:	00008067          	ret
    return 0;
    80002434:	00000513          	li	a0,0
    80002438:	fe5ff06f          	j	8000241c <_ZN13SyncSemaphore5closeEv+0x7c>

000000008000243c <_ZN13SyncSemaphore7tryWaitEv>:


int SyncSemaphore::tryWait()
{
    8000243c:	ff010113          	addi	sp,sp,-16
    80002440:	00813423          	sd	s0,8(sp)
    80002444:	01010413          	addi	s0,sp,16
    if (done) return -1;
    80002448:	01854783          	lbu	a5,24(a0)
    8000244c:	02079e63          	bnez	a5,80002488 <_ZN13SyncSemaphore7tryWaitEv+0x4c>

    if (semValue == 1) {
    80002450:	00052783          	lw	a5,0(a0)
    80002454:	00100713          	li	a4,1
    80002458:	00e78863          	beq	a5,a4,80002468 <_ZN13SyncSemaphore7tryWaitEv+0x2c>
        --semValue;
        return 0;
    }
    else if (semValue > 0) {
    8000245c:	00f04e63          	bgtz	a5,80002478 <_ZN13SyncSemaphore7tryWaitEv+0x3c>
        --semValue;
        return 1;
    }

    return -1;
    80002460:	fff00513          	li	a0,-1
    80002464:	0280006f          	j	8000248c <_ZN13SyncSemaphore7tryWaitEv+0x50>
        --semValue;
    80002468:	fff7879b          	addiw	a5,a5,-1
    8000246c:	00f52023          	sw	a5,0(a0)
        return 0;
    80002470:	00000513          	li	a0,0
    80002474:	0180006f          	j	8000248c <_ZN13SyncSemaphore7tryWaitEv+0x50>
        --semValue;
    80002478:	fff7879b          	addiw	a5,a5,-1
    8000247c:	00f52023          	sw	a5,0(a0)
        return 1;
    80002480:	00100513          	li	a0,1
    80002484:	0080006f          	j	8000248c <_ZN13SyncSemaphore7tryWaitEv+0x50>
    if (done) return -1;
    80002488:	fff00513          	li	a0,-1
}
    8000248c:	00813403          	ld	s0,8(sp)
    80002490:	01010113          	addi	sp,sp,16
    80002494:	00008067          	ret

0000000080002498 <_ZN5Riscv10popSppSpieEv>:
#include "../test/printing.hpp"

using Body = void (*)(void*);

void Riscv::popSppSpie()
{
    80002498:	ff010113          	addi	sp,sp,-16
    8000249c:	00813423          	sd	s0,8(sp)
    800024a0:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    800024a4:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    800024a8:	10200073          	sret
}
    800024ac:	00813403          	ld	s0,8(sp)
    800024b0:	01010113          	addi	sp,sp,16
    800024b4:	00008067          	ret

00000000800024b8 <_ZN5Riscv23handleSoftwareInterruptEv>:

void Riscv::handleSoftwareInterrupt()
{
    800024b8:	fb010113          	addi	sp,sp,-80
    800024bc:	04113423          	sd	ra,72(sp)
    800024c0:	04813023          	sd	s0,64(sp)
    800024c4:	02913c23          	sd	s1,56(sp)
    800024c8:	05010413          	addi	s0,sp,80
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800024cc:	142027f3          	csrr	a5,scause
    800024d0:	fcf43423          	sd	a5,-56(s0)
    return scause;
    800024d4:	fc843483          	ld	s1,-56(s0)
    uint64 scause = r_scause();
    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL)
    800024d8:	ff848713          	addi	a4,s1,-8
    800024dc:	00100793          	li	a5,1
    800024e0:	24e7ee63          	bltu	a5,a4,8000273c <_ZN5Riscv23handleSoftwareInterruptEv+0x284>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800024e4:	141027f3          	csrr	a5,sepc
    800024e8:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    800024ec:	fd843783          	ld	a5,-40(s0)
    {
        // interrupt: no; cause code: environment call from U-mode(8) or S-mode(9)
        uint64 volatile sepc = r_sepc() + 4;
    800024f0:	00478793          	addi	a5,a5,4
    800024f4:	faf43c23          	sd	a5,-72(s0)

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800024f8:	100027f3          	csrr	a5,sstatus
    800024fc:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80002500:	fd043783          	ld	a5,-48(s0)
        uint64 volatile sstatus = r_sstatus();
    80002504:	fcf43023          	sd	a5,-64(s0)

        SyncSemaphore* semHandle;

        uint64 func;
        __asm__ volatile("mv %0, a0" : "=r" (func));
    80002508:	00050793          	mv	a5,a0

        switch (func) {
    8000250c:	05100713          	li	a4,81
    80002510:	02f76a63          	bltu	a4,a5,80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
    80002514:	00279793          	slli	a5,a5,0x2
    80002518:	00007717          	auipc	a4,0x7
    8000251c:	b1c70713          	addi	a4,a4,-1252 # 80009034 <CONSOLE_STATUS+0x24>
    80002520:	00e787b3          	add	a5,a5,a4
    80002524:	0007a783          	lw	a5,0(a5)
    80002528:	00e787b3          	add	a5,a5,a4
    8000252c:	00078067          	jr	a5

            // mem_alloc
            case 0x01:
                size_t size;
                __asm__ volatile("mv %0, a1" : "=r" (size));
    80002530:	00058513          	mv	a0,a1
                uint64 addr;
                addr = (uint64)MemoryAllocator::mem_alloc(size);
    80002534:	fffff097          	auipc	ra,0xfffff
    80002538:	5e8080e7          	jalr	1512(ra) # 80001b1c <_ZN15MemoryAllocator9mem_allocEm>
                __asm__ volatile("mv a0, %0" : : "r"(addr));
    8000253c:	00050513          	mv	a0,a0
                __asm__ volatile ("sd a0, 80(fp)");
    80002540:	04a43823          	sd	a0,80(s0)

            default:
                break;
        }

        w_sstatus(sstatus);
    80002544:	fc043783          	ld	a5,-64(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002548:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    8000254c:	fb843783          	ld	a5,-72(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002550:	14179073          	csrw	sepc,a5
        printInt(scause);
        printString("\n");
        //while(true) {};
    }

}
    80002554:	04813083          	ld	ra,72(sp)
    80002558:	04013403          	ld	s0,64(sp)
    8000255c:	03813483          	ld	s1,56(sp)
    80002560:	05010113          	addi	sp,sp,80
    80002564:	00008067          	ret
                __asm__ volatile("mv %0, a1" : "=r" (ptr));
    80002568:	00058513          	mv	a0,a1
                ret = MemoryAllocator::mem_free(ptr);
    8000256c:	fffff097          	auipc	ra,0xfffff
    80002570:	744080e7          	jalr	1860(ra) # 80001cb0 <_ZN15MemoryAllocator8mem_freeEPv>
                __asm__ volatile("mv a0, %0" : : "r"(ret));
    80002574:	00050513          	mv	a0,a0
                __asm__ volatile ("sd a0, 80(fp)");
    80002578:	04a43823          	sd	a0,80(s0)
                break;
    8000257c:	fc9ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                __asm__ volatile("mv %0, a1" : "=r" (tcb));
    80002580:	00058513          	mv	a0,a1
    static TCB *running;
    80002584:	00000097          	auipc	ra,0x0
    80002588:	2e0080e7          	jalr	736(ra) # 80002864 <_ZN9Scheduler3putEP3TCB>
    8000258c:	fb9ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                __asm__ volatile ("mv %0, a1" : "=r" (handleInit));
    80002590:	00058493          	mv	s1,a1
                __asm__ volatile ("mv %0, a2" : "=r" (bodyInit));
    80002594:	00060513          	mv	a0,a2
                __asm__ volatile ("mv %0, a6" : "=r" (argInit));
    80002598:	00080593          	mv	a1,a6
                *handleInit = TCB::initThread(bodyInit, argInit);
    8000259c:	fffff097          	auipc	ra,0xfffff
    800025a0:	394080e7          	jalr	916(ra) # 80001930 <_ZN3TCB10initThreadEPFvPvES0_>
    800025a4:	00a4b023          	sd	a0,0(s1)
                if(*handleInit != nullptr) {
    800025a8:	00050863          	beqz	a0,800025b8 <_ZN5Riscv23handleSoftwareInterruptEv+0x100>
                    __asm__ volatile ("li a0, 0");
    800025ac:	00000513          	li	a0,0
                    __asm__ volatile ("sd a0, 80(fp)");
    800025b0:	04a43823          	sd	a0,80(s0)
    800025b4:	f91ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                    __asm__ volatile ("li a0, -1");
    800025b8:	fff00513          	li	a0,-1
                    __asm__ volatile ("sd a0, 80(fp)");
    800025bc:	04a43823          	sd	a0,80(s0)
    800025c0:	f85ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                __asm__ volatile ("mv %0, a1" : "=r" (handle));
    800025c4:	00058493          	mv	s1,a1
                __asm__ volatile ("mv %0, a2" : "=r" (body));
    800025c8:	00060513          	mv	a0,a2
                __asm__ volatile ("mv %0, a6" : "=r" (arg));
    800025cc:	00080593          	mv	a1,a6
                *handle = TCB::createThread(body, arg);
    800025d0:	fffff097          	auipc	ra,0xfffff
    800025d4:	268080e7          	jalr	616(ra) # 80001838 <_ZN3TCB12createThreadEPFvPvES0_>
    800025d8:	00a4b023          	sd	a0,0(s1)
                if(*handle != nullptr) {
    800025dc:	00050863          	beqz	a0,800025ec <_ZN5Riscv23handleSoftwareInterruptEv+0x134>
                    __asm__ volatile ("li a0, 0");
    800025e0:	00000513          	li	a0,0
                    __asm__ volatile ("sd a0, 80(fp)");
    800025e4:	04a43823          	sd	a0,80(s0)
    800025e8:	f5dff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                    __asm__ volatile ("li a0, -1");
    800025ec:	fff00513          	li	a0,-1
                    __asm__ volatile ("sd a0, 80(fp)");
    800025f0:	04a43823          	sd	a0,80(s0)
    800025f4:	f51ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                TCB::running->setFinished(true);
    800025f8:	00009797          	auipc	a5,0x9
    800025fc:	1487b783          	ld	a5,328(a5) # 8000b740 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002600:	0007b783          	ld	a5,0(a5)
    void setFinished(bool value) { finished = value; }
    80002604:	00100713          	li	a4,1
    80002608:	02e78023          	sb	a4,32(a5)
                TCB::dispatch();
    8000260c:	fffff097          	auipc	ra,0xfffff
    80002610:	410080e7          	jalr	1040(ra) # 80001a1c <_ZN3TCB8dispatchEv>
                __asm__ volatile ("li a0, 0");
    80002614:	00000513          	li	a0,0
                __asm__ volatile ("sd a0, 80(fp)");
    80002618:	04a43823          	sd	a0,80(s0)
                break;
    8000261c:	f29ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                TCB::dispatch();
    80002620:	fffff097          	auipc	ra,0xfffff
    80002624:	3fc080e7          	jalr	1020(ra) # 80001a1c <_ZN3TCB8dispatchEv>
                break;
    80002628:	f1dff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                __asm__ volatile ("mv %0, a1" : "=r" (sem));
    8000262c:	00058493          	mv	s1,a1
                __asm__ volatile ("mv %0, a2" : "=r" (semValue));
    80002630:	00060513          	mv	a0,a2
                *sem = SyncSemaphore::createSyncSemaphore((int)semValue);
    80002634:	0005051b          	sext.w	a0,a0
    80002638:	00000097          	auipc	ra,0x0
    8000263c:	bb8080e7          	jalr	-1096(ra) # 800021f0 <_ZN13SyncSemaphore19createSyncSemaphoreEi>
    80002640:	00a4b023          	sd	a0,0(s1)
                if(*sem != nullptr) {
    80002644:	00050863          	beqz	a0,80002654 <_ZN5Riscv23handleSoftwareInterruptEv+0x19c>
                    __asm__ volatile ("li a0, 0");
    80002648:	00000513          	li	a0,0
                    __asm__ volatile ("sd a0, 80(fp)");
    8000264c:	04a43823          	sd	a0,80(s0)
    80002650:	ef5ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                    __asm__ volatile ("li a0, -1");
    80002654:	fff00513          	li	a0,-1
                    __asm__ volatile ("sd a0, 80(fp)");
    80002658:	04a43823          	sd	a0,80(s0)
    8000265c:	ee9ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                __asm__ volatile ("mv %0, a1" : "=r" (semHandle));
    80002660:	00058513          	mv	a0,a1
                if(semHandle!= nullptr) retClose = semHandle->close();
    80002664:	00050c63          	beqz	a0,8000267c <_ZN5Riscv23handleSoftwareInterruptEv+0x1c4>
    80002668:	00000097          	auipc	ra,0x0
    8000266c:	d38080e7          	jalr	-712(ra) # 800023a0 <_ZN13SyncSemaphore5closeEv>
                __asm__ volatile ("mv a0, %0" : : "r"(retClose));
    80002670:	00050513          	mv	a0,a0
                __asm__ volatile ("sd a0, 80(fp)");
    80002674:	04a43823          	sd	a0,80(s0)
                break;
    80002678:	ecdff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                else retClose = -2;
    8000267c:	ffe00513          	li	a0,-2
    80002680:	ff1ff06f          	j	80002670 <_ZN5Riscv23handleSoftwareInterruptEv+0x1b8>
                __asm__ volatile ("mv %0, a1" : "=r" (semHandle));
    80002684:	00058513          	mv	a0,a1
                if(semHandle!= nullptr) retWait = semHandle->wait();
    80002688:	00050c63          	beqz	a0,800026a0 <_ZN5Riscv23handleSoftwareInterruptEv+0x1e8>
    8000268c:	00000097          	auipc	ra,0x0
    80002690:	bac080e7          	jalr	-1108(ra) # 80002238 <_ZN13SyncSemaphore4waitEv>
                __asm__ volatile ("mv a0, %0" : : "r"(retWait));
    80002694:	00050513          	mv	a0,a0
                __asm__ volatile ("sd a0, 80(fp)");
    80002698:	04a43823          	sd	a0,80(s0)
                break;
    8000269c:	ea9ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                else retWait = -2;
    800026a0:	ffe00513          	li	a0,-2
    800026a4:	ff1ff06f          	j	80002694 <_ZN5Riscv23handleSoftwareInterruptEv+0x1dc>
                __asm__ volatile ("mv %0, a1" : "=r" (semHandle));
    800026a8:	00058513          	mv	a0,a1
                if(semHandle!= nullptr) retSignal = semHandle->signal();
    800026ac:	00050c63          	beqz	a0,800026c4 <_ZN5Riscv23handleSoftwareInterruptEv+0x20c>
    800026b0:	00000097          	auipc	ra,0x0
    800026b4:	c54080e7          	jalr	-940(ra) # 80002304 <_ZN13SyncSemaphore6signalEv>
                __asm__ volatile ("mv a0, %0" : : "r"(retSignal));
    800026b8:	00050513          	mv	a0,a0
                __asm__ volatile ("sd a0, 80(fp)");
    800026bc:	04a43823          	sd	a0,80(s0)
                break;
    800026c0:	e85ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                else retSignal = -2;
    800026c4:	ffe00513          	li	a0,-2
    800026c8:	ff1ff06f          	j	800026b8 <_ZN5Riscv23handleSoftwareInterruptEv+0x200>
                __asm__ volatile ("mv %0, a1" : "=r" (semHandle));
    800026cc:	00058513          	mv	a0,a1
                if(semHandle!= nullptr) retTryWait = semHandle->wait();
    800026d0:	00050c63          	beqz	a0,800026e8 <_ZN5Riscv23handleSoftwareInterruptEv+0x230>
    800026d4:	00000097          	auipc	ra,0x0
    800026d8:	b64080e7          	jalr	-1180(ra) # 80002238 <_ZN13SyncSemaphore4waitEv>
                __asm__ volatile ("mv a0, %0" : : "r"(retTryWait));
    800026dc:	00050513          	mv	a0,a0
                __asm__ volatile ("sd a0, 80(fp)");
    800026e0:	04a43823          	sd	a0,80(s0)
                break;
    800026e4:	e61ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                else retTryWait = -2;
    800026e8:	ffe00513          	li	a0,-2
    800026ec:	ff1ff06f          	j	800026dc <_ZN5Riscv23handleSoftwareInterruptEv+0x224>
                retGet = __getc();
    800026f0:	00006097          	auipc	ra,0x6
    800026f4:	d08080e7          	jalr	-760(ra) # 800083f8 <__getc>
                __asm__ volatile ("mv a0, %0" : : "r"(retGet));
    800026f8:	00050513          	mv	a0,a0
                __asm__ volatile ("sd a0, 80(fp)");
    800026fc:	04a43823          	sd	a0,80(s0)
                break;
    80002700:	e45ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                __asm__ volatile ("mv %0, a1" : "=r" (c));
    80002704:	00058513          	mv	a0,a1
                __putc(c);
    80002708:	0ff57513          	andi	a0,a0,255
    8000270c:	00006097          	auipc	ra,0x6
    80002710:	cb0080e7          	jalr	-848(ra) # 800083bc <__putc>
                break;
    80002714:	e31ff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                __asm__ volatile ("mv %0, a1" : "=r" (t1));
    80002718:	00058713          	mv	a4,a1
                __asm__ volatile ("mv %0, a2" : "=r" (t2));
    8000271c:	00060793          	mv	a5,a2
    void synchronizeTCB();
    80002720:	04f73023          	sd	a5,64(a4)
    80002724:	04e7b023          	sd	a4,64(a5)
    80002728:	e1dff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
                __asm__ volatile ("mv %0, a1" : "=r" (t));
    8000272c:	00058513          	mv	a0,a1
                t->synchronizeTCB();
    80002730:	fffff097          	auipc	ra,0xfffff
    80002734:	378080e7          	jalr	888(ra) # 80001aa8 <_ZN3TCB14synchronizeTCBEv>
                break;
    80002738:	e0dff06f          	j	80002544 <_ZN5Riscv23handleSoftwareInterruptEv+0x8c>
        printString("Error: scause =  ");
    8000273c:	00007517          	auipc	a0,0x7
    80002740:	8e450513          	addi	a0,a0,-1820 # 80009020 <CONSOLE_STATUS+0x10>
    80002744:	00003097          	auipc	ra,0x3
    80002748:	958080e7          	jalr	-1704(ra) # 8000509c <_Z11printStringPKc>
        printInt(scause);
    8000274c:	00000613          	li	a2,0
    80002750:	00a00593          	li	a1,10
    80002754:	0004851b          	sext.w	a0,s1
    80002758:	00003097          	auipc	ra,0x3
    8000275c:	af4080e7          	jalr	-1292(ra) # 8000524c <_Z8printIntiii>
        printString("\n");
    80002760:	00007517          	auipc	a0,0x7
    80002764:	e1050513          	addi	a0,a0,-496 # 80009570 <CONSOLE_STATUS+0x560>
    80002768:	00003097          	auipc	ra,0x3
    8000276c:	934080e7          	jalr	-1740(ra) # 8000509c <_Z11printStringPKc>
}
    80002770:	de5ff06f          	j	80002554 <_ZN5Riscv23handleSoftwareInterruptEv+0x9c>

0000000080002774 <_ZN5Riscv22handleConsoleInterruptEv>:

void Riscv::handleConsoleInterrupt() {
    80002774:	ff010113          	addi	sp,sp,-16
    80002778:	00113423          	sd	ra,8(sp)
    8000277c:	00813023          	sd	s0,0(sp)
    80002780:	01010413          	addi	s0,sp,16
    console_handler();
    80002784:	00006097          	auipc	ra,0x6
    80002788:	cac080e7          	jalr	-852(ra) # 80008430 <console_handler>
}
    8000278c:	00813083          	ld	ra,8(sp)
    80002790:	00013403          	ld	s0,0(sp)
    80002794:	01010113          	addi	sp,sp,16
    80002798:	00008067          	ret

000000008000279c <_ZN5Riscv20handleTimerInterruptEv>:

void Riscv::handleTimerInterrupt() {
    8000279c:	ff010113          	addi	sp,sp,-16
    800027a0:	00813423          	sd	s0,8(sp)
    800027a4:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800027a8:	00200793          	li	a5,2
    800027ac:	1447b073          	csrc	sip,a5
    mc_sip(SIP_SSIP);
    800027b0:	00813403          	ld	s0,8(sp)
    800027b4:	01010113          	addi	sp,sp,16
    800027b8:	00008067          	ret

00000000800027bc <_Z41__static_initialization_and_destruction_0ii>:
}

void Scheduler::put(TCB *ccb)
{
    readyThreadQueue.addLast(ccb);
    800027bc:	ff010113          	addi	sp,sp,-16
    800027c0:	00813423          	sd	s0,8(sp)
    800027c4:	01010413          	addi	s0,sp,16
    800027c8:	00100793          	li	a5,1
    800027cc:	00f50863          	beq	a0,a5,800027dc <_Z41__static_initialization_and_destruction_0ii+0x20>
    800027d0:	00813403          	ld	s0,8(sp)
    800027d4:	01010113          	addi	sp,sp,16
    800027d8:	00008067          	ret
    800027dc:	000107b7          	lui	a5,0x10
    800027e0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800027e4:	fef596e3          	bne	a1,a5,800027d0 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0) {}
    800027e8:	00009797          	auipc	a5,0x9
    800027ec:	fd078793          	addi	a5,a5,-48 # 8000b7b8 <_ZN9Scheduler16readyThreadQueueE>
    800027f0:	0007b023          	sd	zero,0(a5)
    800027f4:	0007b423          	sd	zero,8(a5)
    800027f8:	fd9ff06f          	j	800027d0 <_Z41__static_initialization_and_destruction_0ii+0x14>

00000000800027fc <_ZN9Scheduler3getEv>:
{
    800027fc:	fe010113          	addi	sp,sp,-32
    80002800:	00113c23          	sd	ra,24(sp)
    80002804:	00813823          	sd	s0,16(sp)
    80002808:	00913423          	sd	s1,8(sp)
    8000280c:	02010413          	addi	s0,sp,32
        if (!head) { return 0; }
    80002810:	00009517          	auipc	a0,0x9
    80002814:	fa853503          	ld	a0,-88(a0) # 8000b7b8 <_ZN9Scheduler16readyThreadQueueE>
    80002818:	04050263          	beqz	a0,8000285c <_ZN9Scheduler3getEv+0x60>
        head = head->next;
    8000281c:	00853783          	ld	a5,8(a0)
    80002820:	00009717          	auipc	a4,0x9
    80002824:	f8f73c23          	sd	a5,-104(a4) # 8000b7b8 <_ZN9Scheduler16readyThreadQueueE>
        if (!head) { tail = 0; }
    80002828:	02078463          	beqz	a5,80002850 <_ZN9Scheduler3getEv+0x54>
        T *ret = elem->data;
    8000282c:	00053483          	ld	s1,0(a0)
        delete elem;
    80002830:	fffff097          	auipc	ra,0xfffff
    80002834:	ea4080e7          	jalr	-348(ra) # 800016d4 <_ZdlPv>
}
    80002838:	00048513          	mv	a0,s1
    8000283c:	01813083          	ld	ra,24(sp)
    80002840:	01013403          	ld	s0,16(sp)
    80002844:	00813483          	ld	s1,8(sp)
    80002848:	02010113          	addi	sp,sp,32
    8000284c:	00008067          	ret
        if (!head) { tail = 0; }
    80002850:	00009797          	auipc	a5,0x9
    80002854:	f607b823          	sd	zero,-144(a5) # 8000b7c0 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80002858:	fd5ff06f          	j	8000282c <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    8000285c:	00050493          	mv	s1,a0
    return readyThreadQueue.removeFirst();
    80002860:	fd9ff06f          	j	80002838 <_ZN9Scheduler3getEv+0x3c>

0000000080002864 <_ZN9Scheduler3putEP3TCB>:
{
    80002864:	fe010113          	addi	sp,sp,-32
    80002868:	00113c23          	sd	ra,24(sp)
    8000286c:	00813823          	sd	s0,16(sp)
    80002870:	00913423          	sd	s1,8(sp)
    80002874:	02010413          	addi	s0,sp,32
    80002878:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    8000287c:	01000513          	li	a0,16
    80002880:	fffff097          	auipc	ra,0xfffff
    80002884:	e04080e7          	jalr	-508(ra) # 80001684 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80002888:	00953023          	sd	s1,0(a0)
    8000288c:	00053423          	sd	zero,8(a0)
        if (tail)
    80002890:	00009797          	auipc	a5,0x9
    80002894:	f307b783          	ld	a5,-208(a5) # 8000b7c0 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80002898:	02078263          	beqz	a5,800028bc <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    8000289c:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800028a0:	00009797          	auipc	a5,0x9
    800028a4:	f2a7b023          	sd	a0,-224(a5) # 8000b7c0 <_ZN9Scheduler16readyThreadQueueE+0x8>
    800028a8:	01813083          	ld	ra,24(sp)
    800028ac:	01013403          	ld	s0,16(sp)
    800028b0:	00813483          	ld	s1,8(sp)
    800028b4:	02010113          	addi	sp,sp,32
    800028b8:	00008067          	ret
            head = tail = elem;
    800028bc:	00009797          	auipc	a5,0x9
    800028c0:	efc78793          	addi	a5,a5,-260 # 8000b7b8 <_ZN9Scheduler16readyThreadQueueE>
    800028c4:	00a7b423          	sd	a0,8(a5)
    800028c8:	00a7b023          	sd	a0,0(a5)
    800028cc:	fddff06f          	j	800028a8 <_ZN9Scheduler3putEP3TCB+0x44>

00000000800028d0 <_GLOBAL__sub_I__ZN9Scheduler16readyThreadQueueE>:
    800028d0:	ff010113          	addi	sp,sp,-16
    800028d4:	00113423          	sd	ra,8(sp)
    800028d8:	00813023          	sd	s0,0(sp)
    800028dc:	01010413          	addi	s0,sp,16
    800028e0:	000105b7          	lui	a1,0x10
    800028e4:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800028e8:	00100513          	li	a0,1
    800028ec:	00000097          	auipc	ra,0x0
    800028f0:	ed0080e7          	jalr	-304(ra) # 800027bc <_Z41__static_initialization_and_destruction_0ii>
    800028f4:	00813083          	ld	ra,8(sp)
    800028f8:	00013403          	ld	s0,0(sp)
    800028fc:	01010113          	addi	sp,sp,16
    80002900:	00008067          	ret

0000000080002904 <_Z7modFuncv>:
        dispatch();
    }

};

void modFunc() {
    80002904:	f8010113          	addi	sp,sp,-128
    80002908:	06113c23          	sd	ra,120(sp)
    8000290c:	06813823          	sd	s0,112(sp)
    80002910:	06913423          	sd	s1,104(sp)
    80002914:	07213023          	sd	s2,96(sp)
    80002918:	05313c23          	sd	s3,88(sp)
    8000291c:	08010413          	addi	s0,sp,128

    Thread* threads[10];

    for (int i = 0; i < 10; i++) {
    80002920:	00000913          	li	s2,0
    80002924:	0880006f          	j	800029ac <_Z7modFuncv+0xa8>
    explicit A():Thread() {
    80002928:	00009797          	auipc	a5,0x9
    8000292c:	c2078793          	addi	a5,a5,-992 # 8000b548 <_ZTV1A+0x10>
    80002930:	00f4b023          	sd	a5,0(s1)
        printString("Created thread id= ");
    80002934:	00007517          	auipc	a0,0x7
    80002938:	8ac50513          	addi	a0,a0,-1876 # 800091e0 <CONSOLE_STATUS+0x1d0>
    8000293c:	00002097          	auipc	ra,0x2
    80002940:	760080e7          	jalr	1888(ra) # 8000509c <_Z11printStringPKc>
    static void dispatch ();

    static int sleep (time_t time);

    // mod
    int getThreadId() { return myHandle->getId(); }
    80002944:	0084b783          	ld	a5,8(s1)
        printInt(getThreadId());
    80002948:	00000613          	li	a2,0
    8000294c:	00a00593          	li	a1,10
    80002950:	0347a503          	lw	a0,52(a5)
    80002954:	00003097          	auipc	ra,0x3
    80002958:	8f8080e7          	jalr	-1800(ra) # 8000524c <_Z8printIntiii>
        printString("\n");
    8000295c:	00007517          	auipc	a0,0x7
    80002960:	c1450513          	addi	a0,a0,-1004 # 80009570 <CONSOLE_STATUS+0x560>
    80002964:	00002097          	auipc	ra,0x2
    80002968:	738080e7          	jalr	1848(ra) # 8000509c <_Z11printStringPKc>
    8000296c:	02c0006f          	j	80002998 <_Z7modFuncv+0x94>
    80002970:	00050913          	mv	s2,a0
    explicit A():Thread() {
    80002974:	00098513          	mv	a0,s3
    80002978:	fffff097          	auipc	ra,0xfffff
    8000297c:	48c080e7          	jalr	1164(ra) # 80001e04 <_ZN6ThreadD1Ev>
        threads[i] = new A();
    80002980:	00048513          	mv	a0,s1
    80002984:	fffff097          	auipc	ra,0xfffff
    80002988:	d50080e7          	jalr	-688(ra) # 800016d4 <_ZdlPv>
    8000298c:	00090513          	mv	a0,s2
    80002990:	0000a097          	auipc	ra,0xa
    80002994:	f58080e7          	jalr	-168(ra) # 8000c8e8 <_Unwind_Resume>
    80002998:	00391793          	slli	a5,s2,0x3
    8000299c:	fd040713          	addi	a4,s0,-48
    800029a0:	00f707b3          	add	a5,a4,a5
    800029a4:	fa97b823          	sd	s1,-80(a5)
    for (int i = 0; i < 10; i++) {
    800029a8:	0019091b          	addiw	s2,s2,1
    800029ac:	00900793          	li	a5,9
    800029b0:	0327c263          	blt	a5,s2,800029d4 <_Z7modFuncv+0xd0>
        threads[i] = new A();
    800029b4:	02000513          	li	a0,32
    800029b8:	fffff097          	auipc	ra,0xfffff
    800029bc:	ccc080e7          	jalr	-820(ra) # 80001684 <_Znwm>
    800029c0:	00050493          	mv	s1,a0
    explicit A():Thread() {
    800029c4:	00050993          	mv	s3,a0
    800029c8:	fffff097          	auipc	ra,0xfffff
    800029cc:	5f8080e7          	jalr	1528(ra) # 80001fc0 <_ZN6ThreadC1Ev>
    800029d0:	f59ff06f          	j	80002928 <_Z7modFuncv+0x24>
    }

    Thread::pair(threads[2], threads[9]); // 3-10
    800029d4:	fc843583          	ld	a1,-56(s0)
    800029d8:	f9043503          	ld	a0,-112(s0)
    800029dc:	fffff097          	auipc	ra,0xfffff
    800029e0:	670080e7          	jalr	1648(ra) # 8000204c <_ZN6Thread4pairEPS_S0_>
    Thread::pair(threads[5], threads[7]); // 6-8
    800029e4:	fb843583          	ld	a1,-72(s0)
    800029e8:	fa843503          	ld	a0,-88(s0)
    800029ec:	fffff097          	auipc	ra,0xfffff
    800029f0:	660080e7          	jalr	1632(ra) # 8000204c <_ZN6Thread4pairEPS_S0_>

    for (auto &thread : threads) {
    800029f4:	f8040493          	addi	s1,s0,-128
    800029f8:	fd040793          	addi	a5,s0,-48
    800029fc:	00f48c63          	beq	s1,a5,80002a14 <_Z7modFuncv+0x110>
        thread->start();
    80002a00:	0004b503          	ld	a0,0(s1)
    80002a04:	fffff097          	auipc	ra,0xfffff
    80002a08:	58c080e7          	jalr	1420(ra) # 80001f90 <_ZN6Thread5startEv>
    for (auto &thread : threads) {
    80002a0c:	00848493          	addi	s1,s1,8
    80002a10:	fe9ff06f          	j	800029f8 <_Z7modFuncv+0xf4>
    }

    for (auto &thread : threads) {
    80002a14:	f8040493          	addi	s1,s0,-128
    80002a18:	0080006f          	j	80002a20 <_Z7modFuncv+0x11c>
    80002a1c:	00848493          	addi	s1,s1,8
    80002a20:	fd040793          	addi	a5,s0,-48
    80002a24:	02f48063          	beq	s1,a5,80002a44 <_Z7modFuncv+0x140>
        while (!thread->isFinishedThread()) {
    80002a28:	0004b783          	ld	a5,0(s1)
    static void pair(Thread* t1, Thread* t2);
    void synchronize();

    bool isFinishedThread(){ return myHandle->isFinished(); };
    80002a2c:	0087b783          	ld	a5,8(a5)
class TCB
{
public:
    ~TCB() { delete[] stack; }

    bool isFinished() const { return finished; }
    80002a30:	0207c783          	lbu	a5,32(a5)
    80002a34:	fe0794e3          	bnez	a5,80002a1c <_Z7modFuncv+0x118>
            Thread::dispatch();
    80002a38:	fffff097          	auipc	ra,0xfffff
    80002a3c:	4f8080e7          	jalr	1272(ra) # 80001f30 <_ZN6Thread8dispatchEv>
    80002a40:	fe9ff06f          	j	80002a28 <_Z7modFuncv+0x124>
        }
    }

    for (auto &thread : threads) {
    80002a44:	f8040493          	addi	s1,s0,-128
    80002a48:	0080006f          	j	80002a50 <_Z7modFuncv+0x14c>
    80002a4c:	00848493          	addi	s1,s1,8
    80002a50:	fd040793          	addi	a5,s0,-48
    80002a54:	02f48263          	beq	s1,a5,80002a78 <_Z7modFuncv+0x174>
        delete thread;
    80002a58:	0004b503          	ld	a0,0(s1)
    80002a5c:	fe0508e3          	beqz	a0,80002a4c <_Z7modFuncv+0x148>
    80002a60:	00053783          	ld	a5,0(a0)
    80002a64:	0087b783          	ld	a5,8(a5)
    80002a68:	000780e7          	jalr	a5
    80002a6c:	fe1ff06f          	j	80002a4c <_Z7modFuncv+0x148>
    80002a70:	00050913          	mv	s2,a0
    80002a74:	f0dff06f          	j	80002980 <_Z7modFuncv+0x7c>
    }
}
    80002a78:	07813083          	ld	ra,120(sp)
    80002a7c:	07013403          	ld	s0,112(sp)
    80002a80:	06813483          	ld	s1,104(sp)
    80002a84:	06013903          	ld	s2,96(sp)
    80002a88:	05813983          	ld	s3,88(sp)
    80002a8c:	08010113          	addi	sp,sp,128
    80002a90:	00008067          	ret

0000000080002a94 <_ZN1AD1Ev>:
class A:public Thread {
    80002a94:	ff010113          	addi	sp,sp,-16
    80002a98:	00113423          	sd	ra,8(sp)
    80002a9c:	00813023          	sd	s0,0(sp)
    80002aa0:	01010413          	addi	s0,sp,16
    80002aa4:	00009797          	auipc	a5,0x9
    80002aa8:	aa478793          	addi	a5,a5,-1372 # 8000b548 <_ZTV1A+0x10>
    80002aac:	00f53023          	sd	a5,0(a0)
    80002ab0:	fffff097          	auipc	ra,0xfffff
    80002ab4:	354080e7          	jalr	852(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80002ab8:	00813083          	ld	ra,8(sp)
    80002abc:	00013403          	ld	s0,0(sp)
    80002ac0:	01010113          	addi	sp,sp,16
    80002ac4:	00008067          	ret

0000000080002ac8 <_ZN1AD0Ev>:
    80002ac8:	fe010113          	addi	sp,sp,-32
    80002acc:	00113c23          	sd	ra,24(sp)
    80002ad0:	00813823          	sd	s0,16(sp)
    80002ad4:	00913423          	sd	s1,8(sp)
    80002ad8:	02010413          	addi	s0,sp,32
    80002adc:	00050493          	mv	s1,a0
    80002ae0:	00009797          	auipc	a5,0x9
    80002ae4:	a6878793          	addi	a5,a5,-1432 # 8000b548 <_ZTV1A+0x10>
    80002ae8:	00f53023          	sd	a5,0(a0)
    80002aec:	fffff097          	auipc	ra,0xfffff
    80002af0:	318080e7          	jalr	792(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80002af4:	00048513          	mv	a0,s1
    80002af8:	fffff097          	auipc	ra,0xfffff
    80002afc:	bdc080e7          	jalr	-1060(ra) # 800016d4 <_ZdlPv>
    80002b00:	01813083          	ld	ra,24(sp)
    80002b04:	01013403          	ld	s0,16(sp)
    80002b08:	00813483          	ld	s1,8(sp)
    80002b0c:	02010113          	addi	sp,sp,32
    80002b10:	00008067          	ret

0000000080002b14 <_ZN1A3runEv>:
    void run() override {
    80002b14:	fd010113          	addi	sp,sp,-48
    80002b18:	02113423          	sd	ra,40(sp)
    80002b1c:	02813023          	sd	s0,32(sp)
    80002b20:	00913c23          	sd	s1,24(sp)
    80002b24:	01213823          	sd	s2,16(sp)
    80002b28:	01313423          	sd	s3,8(sp)
    80002b2c:	03010413          	addi	s0,sp,48
    80002b30:	00050993          	mv	s3,a0
    int getThreadId() { return myHandle->getId(); }
    80002b34:	00853783          	ld	a5,8(a0)
    void setBlocked(bool value) { this->blocked = value; }

    bool isMain() const { return this->main; }

    //mod
    int getId() const { return id; }
    80002b38:	0347a903          	lw	s2,52(a5)
        for(int i = 0; i < 3; i++) {
    80002b3c:	00000493          	li	s1,0
    80002b40:	0840006f          	j	80002bc4 <_ZN1A3runEv+0xb0>
            printString("ID: ");
    80002b44:	00006517          	auipc	a0,0x6
    80002b48:	63c50513          	addi	a0,a0,1596 # 80009180 <CONSOLE_STATUS+0x170>
    80002b4c:	00002097          	auipc	ra,0x2
    80002b50:	550080e7          	jalr	1360(ra) # 8000509c <_Z11printStringPKc>
            printInt(id);
    80002b54:	00000613          	li	a2,0
    80002b58:	00a00593          	li	a1,10
    80002b5c:	00090513          	mv	a0,s2
    80002b60:	00002097          	auipc	ra,0x2
    80002b64:	6ec080e7          	jalr	1772(ra) # 8000524c <_Z8printIntiii>
            printString(": Approaching...\n");
    80002b68:	00006517          	auipc	a0,0x6
    80002b6c:	62050513          	addi	a0,a0,1568 # 80009188 <CONSOLE_STATUS+0x178>
    80002b70:	00002097          	auipc	ra,0x2
    80002b74:	52c080e7          	jalr	1324(ra) # 8000509c <_Z11printStringPKc>
            synchronize();
    80002b78:	00098513          	mv	a0,s3
    80002b7c:	fffff097          	auipc	ra,0xfffff
    80002b80:	4a4080e7          	jalr	1188(ra) # 80002020 <_ZN6Thread11synchronizeEv>
            printString("Synchronized thread id= ");
    80002b84:	00006517          	auipc	a0,0x6
    80002b88:	61c50513          	addi	a0,a0,1564 # 800091a0 <CONSOLE_STATUS+0x190>
    80002b8c:	00002097          	auipc	ra,0x2
    80002b90:	510080e7          	jalr	1296(ra) # 8000509c <_Z11printStringPKc>
            printInt(id);
    80002b94:	00000613          	li	a2,0
    80002b98:	00a00593          	li	a1,10
    80002b9c:	00090513          	mv	a0,s2
    80002ba0:	00002097          	auipc	ra,0x2
    80002ba4:	6ac080e7          	jalr	1708(ra) # 8000524c <_Z8printIntiii>
            printString("\n");
    80002ba8:	00007517          	auipc	a0,0x7
    80002bac:	9c850513          	addi	a0,a0,-1592 # 80009570 <CONSOLE_STATUS+0x560>
    80002bb0:	00002097          	auipc	ra,0x2
    80002bb4:	4ec080e7          	jalr	1260(ra) # 8000509c <_Z11printStringPKc>
            dispatch();
    80002bb8:	fffff097          	auipc	ra,0xfffff
    80002bbc:	378080e7          	jalr	888(ra) # 80001f30 <_ZN6Thread8dispatchEv>
        for(int i = 0; i < 3; i++) {
    80002bc0:	0014849b          	addiw	s1,s1,1
    80002bc4:	00200793          	li	a5,2
    80002bc8:	f697dee3          	bge	a5,s1,80002b44 <_ZN1A3runEv+0x30>
        printString("Thread id= ");
    80002bcc:	00006517          	auipc	a0,0x6
    80002bd0:	5f450513          	addi	a0,a0,1524 # 800091c0 <CONSOLE_STATUS+0x1b0>
    80002bd4:	00002097          	auipc	ra,0x2
    80002bd8:	4c8080e7          	jalr	1224(ra) # 8000509c <_Z11printStringPKc>
        printInt(id);
    80002bdc:	00000613          	li	a2,0
    80002be0:	00a00593          	li	a1,10
    80002be4:	00090513          	mv	a0,s2
    80002be8:	00002097          	auipc	ra,0x2
    80002bec:	664080e7          	jalr	1636(ra) # 8000524c <_Z8printIntiii>
        printString(" is finished\n");
    80002bf0:	00006517          	auipc	a0,0x6
    80002bf4:	5e050513          	addi	a0,a0,1504 # 800091d0 <CONSOLE_STATUS+0x1c0>
    80002bf8:	00002097          	auipc	ra,0x2
    80002bfc:	4a4080e7          	jalr	1188(ra) # 8000509c <_Z11printStringPKc>
        dispatch();
    80002c00:	fffff097          	auipc	ra,0xfffff
    80002c04:	330080e7          	jalr	816(ra) # 80001f30 <_ZN6Thread8dispatchEv>
    }
    80002c08:	02813083          	ld	ra,40(sp)
    80002c0c:	02013403          	ld	s0,32(sp)
    80002c10:	01813483          	ld	s1,24(sp)
    80002c14:	01013903          	ld	s2,16(sp)
    80002c18:	00813983          	ld	s3,8(sp)
    80002c1c:	03010113          	addi	sp,sp,48
    80002c20:	00008067          	ret

0000000080002c24 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80002c24:	fe010113          	addi	sp,sp,-32
    80002c28:	00113c23          	sd	ra,24(sp)
    80002c2c:	00813823          	sd	s0,16(sp)
    80002c30:	00913423          	sd	s1,8(sp)
    80002c34:	01213023          	sd	s2,0(sp)
    80002c38:	02010413          	addi	s0,sp,32
    80002c3c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002c40:	00000913          	li	s2,0
    80002c44:	00c0006f          	j	80002c50 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002c48:	fffff097          	auipc	ra,0xfffff
    80002c4c:	86c080e7          	jalr	-1940(ra) # 800014b4 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80002c50:	fffff097          	auipc	ra,0xfffff
    80002c54:	964080e7          	jalr	-1692(ra) # 800015b4 <_Z4getcv>
    80002c58:	0005059b          	sext.w	a1,a0
    80002c5c:	01b00793          	li	a5,27
    80002c60:	02f58a63          	beq	a1,a5,80002c94 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80002c64:	0084b503          	ld	a0,8(s1)
    80002c68:	00003097          	auipc	ra,0x3
    80002c6c:	410080e7          	jalr	1040(ra) # 80006078 <_ZN6Buffer3putEi>
        i++;
    80002c70:	0019071b          	addiw	a4,s2,1
    80002c74:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002c78:	0004a683          	lw	a3,0(s1)
    80002c7c:	0026979b          	slliw	a5,a3,0x2
    80002c80:	00d787bb          	addw	a5,a5,a3
    80002c84:	0017979b          	slliw	a5,a5,0x1
    80002c88:	02f767bb          	remw	a5,a4,a5
    80002c8c:	fc0792e3          	bnez	a5,80002c50 <_ZL16producerKeyboardPv+0x2c>
    80002c90:	fb9ff06f          	j	80002c48 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80002c94:	00100793          	li	a5,1
    80002c98:	00009717          	auipc	a4,0x9
    80002c9c:	b2f72823          	sw	a5,-1232(a4) # 8000b7c8 <_ZL9threadEnd>
    data->buffer->put('!');
    80002ca0:	02100593          	li	a1,33
    80002ca4:	0084b503          	ld	a0,8(s1)
    80002ca8:	00003097          	auipc	ra,0x3
    80002cac:	3d0080e7          	jalr	976(ra) # 80006078 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80002cb0:	0104b503          	ld	a0,16(s1)
    80002cb4:	fffff097          	auipc	ra,0xfffff
    80002cb8:	8a8080e7          	jalr	-1880(ra) # 8000155c <_Z10sem_signalP13SyncSemaphore>
}
    80002cbc:	01813083          	ld	ra,24(sp)
    80002cc0:	01013403          	ld	s0,16(sp)
    80002cc4:	00813483          	ld	s1,8(sp)
    80002cc8:	00013903          	ld	s2,0(sp)
    80002ccc:	02010113          	addi	sp,sp,32
    80002cd0:	00008067          	ret

0000000080002cd4 <_ZL8producerPv>:

static void producer(void *arg) {
    80002cd4:	fe010113          	addi	sp,sp,-32
    80002cd8:	00113c23          	sd	ra,24(sp)
    80002cdc:	00813823          	sd	s0,16(sp)
    80002ce0:	00913423          	sd	s1,8(sp)
    80002ce4:	01213023          	sd	s2,0(sp)
    80002ce8:	02010413          	addi	s0,sp,32
    80002cec:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002cf0:	00000913          	li	s2,0
    80002cf4:	00c0006f          	j	80002d00 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002cf8:	ffffe097          	auipc	ra,0xffffe
    80002cfc:	7bc080e7          	jalr	1980(ra) # 800014b4 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80002d00:	00009797          	auipc	a5,0x9
    80002d04:	ac87a783          	lw	a5,-1336(a5) # 8000b7c8 <_ZL9threadEnd>
    80002d08:	02079e63          	bnez	a5,80002d44 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80002d0c:	0004a583          	lw	a1,0(s1)
    80002d10:	0305859b          	addiw	a1,a1,48
    80002d14:	0084b503          	ld	a0,8(s1)
    80002d18:	00003097          	auipc	ra,0x3
    80002d1c:	360080e7          	jalr	864(ra) # 80006078 <_ZN6Buffer3putEi>
        i++;
    80002d20:	0019071b          	addiw	a4,s2,1
    80002d24:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002d28:	0004a683          	lw	a3,0(s1)
    80002d2c:	0026979b          	slliw	a5,a3,0x2
    80002d30:	00d787bb          	addw	a5,a5,a3
    80002d34:	0017979b          	slliw	a5,a5,0x1
    80002d38:	02f767bb          	remw	a5,a4,a5
    80002d3c:	fc0792e3          	bnez	a5,80002d00 <_ZL8producerPv+0x2c>
    80002d40:	fb9ff06f          	j	80002cf8 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80002d44:	0104b503          	ld	a0,16(s1)
    80002d48:	fffff097          	auipc	ra,0xfffff
    80002d4c:	814080e7          	jalr	-2028(ra) # 8000155c <_Z10sem_signalP13SyncSemaphore>
}
    80002d50:	01813083          	ld	ra,24(sp)
    80002d54:	01013403          	ld	s0,16(sp)
    80002d58:	00813483          	ld	s1,8(sp)
    80002d5c:	00013903          	ld	s2,0(sp)
    80002d60:	02010113          	addi	sp,sp,32
    80002d64:	00008067          	ret

0000000080002d68 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80002d68:	fd010113          	addi	sp,sp,-48
    80002d6c:	02113423          	sd	ra,40(sp)
    80002d70:	02813023          	sd	s0,32(sp)
    80002d74:	00913c23          	sd	s1,24(sp)
    80002d78:	01213823          	sd	s2,16(sp)
    80002d7c:	01313423          	sd	s3,8(sp)
    80002d80:	03010413          	addi	s0,sp,48
    80002d84:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002d88:	00000993          	li	s3,0
    80002d8c:	01c0006f          	j	80002da8 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80002d90:	ffffe097          	auipc	ra,0xffffe
    80002d94:	724080e7          	jalr	1828(ra) # 800014b4 <_Z15thread_dispatchv>
    80002d98:	0500006f          	j	80002de8 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80002d9c:	00a00513          	li	a0,10
    80002da0:	fffff097          	auipc	ra,0xfffff
    80002da4:	83c080e7          	jalr	-1988(ra) # 800015dc <_Z4putcc>
    while (!threadEnd) {
    80002da8:	00009797          	auipc	a5,0x9
    80002dac:	a207a783          	lw	a5,-1504(a5) # 8000b7c8 <_ZL9threadEnd>
    80002db0:	06079063          	bnez	a5,80002e10 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80002db4:	00893503          	ld	a0,8(s2)
    80002db8:	00003097          	auipc	ra,0x3
    80002dbc:	350080e7          	jalr	848(ra) # 80006108 <_ZN6Buffer3getEv>
        i++;
    80002dc0:	0019849b          	addiw	s1,s3,1
    80002dc4:	0004899b          	sext.w	s3,s1
        putc(key);
    80002dc8:	0ff57513          	andi	a0,a0,255
    80002dcc:	fffff097          	auipc	ra,0xfffff
    80002dd0:	810080e7          	jalr	-2032(ra) # 800015dc <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80002dd4:	00092703          	lw	a4,0(s2)
    80002dd8:	0027179b          	slliw	a5,a4,0x2
    80002ddc:	00e787bb          	addw	a5,a5,a4
    80002de0:	02f4e7bb          	remw	a5,s1,a5
    80002de4:	fa0786e3          	beqz	a5,80002d90 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80002de8:	05000793          	li	a5,80
    80002dec:	02f4e4bb          	remw	s1,s1,a5
    80002df0:	fa049ce3          	bnez	s1,80002da8 <_ZL8consumerPv+0x40>
    80002df4:	fa9ff06f          	j	80002d9c <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80002df8:	00893503          	ld	a0,8(s2)
    80002dfc:	00003097          	auipc	ra,0x3
    80002e00:	30c080e7          	jalr	780(ra) # 80006108 <_ZN6Buffer3getEv>
        putc(key);
    80002e04:	0ff57513          	andi	a0,a0,255
    80002e08:	ffffe097          	auipc	ra,0xffffe
    80002e0c:	7d4080e7          	jalr	2004(ra) # 800015dc <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80002e10:	00893503          	ld	a0,8(s2)
    80002e14:	00003097          	auipc	ra,0x3
    80002e18:	380080e7          	jalr	896(ra) # 80006194 <_ZN6Buffer6getCntEv>
    80002e1c:	fca04ee3          	bgtz	a0,80002df8 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80002e20:	01093503          	ld	a0,16(s2)
    80002e24:	ffffe097          	auipc	ra,0xffffe
    80002e28:	738080e7          	jalr	1848(ra) # 8000155c <_Z10sem_signalP13SyncSemaphore>
}
    80002e2c:	02813083          	ld	ra,40(sp)
    80002e30:	02013403          	ld	s0,32(sp)
    80002e34:	01813483          	ld	s1,24(sp)
    80002e38:	01013903          	ld	s2,16(sp)
    80002e3c:	00813983          	ld	s3,8(sp)
    80002e40:	03010113          	addi	sp,sp,48
    80002e44:	00008067          	ret

0000000080002e48 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80002e48:	f9010113          	addi	sp,sp,-112
    80002e4c:	06113423          	sd	ra,104(sp)
    80002e50:	06813023          	sd	s0,96(sp)
    80002e54:	04913c23          	sd	s1,88(sp)
    80002e58:	05213823          	sd	s2,80(sp)
    80002e5c:	05313423          	sd	s3,72(sp)
    80002e60:	05413023          	sd	s4,64(sp)
    80002e64:	03513c23          	sd	s5,56(sp)
    80002e68:	03613823          	sd	s6,48(sp)
    80002e6c:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80002e70:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80002e74:	00006517          	auipc	a0,0x6
    80002e78:	38450513          	addi	a0,a0,900 # 800091f8 <CONSOLE_STATUS+0x1e8>
    80002e7c:	00002097          	auipc	ra,0x2
    80002e80:	220080e7          	jalr	544(ra) # 8000509c <_Z11printStringPKc>
    getString(input, 30);
    80002e84:	01e00593          	li	a1,30
    80002e88:	fa040493          	addi	s1,s0,-96
    80002e8c:	00048513          	mv	a0,s1
    80002e90:	00002097          	auipc	ra,0x2
    80002e94:	294080e7          	jalr	660(ra) # 80005124 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80002e98:	00048513          	mv	a0,s1
    80002e9c:	00002097          	auipc	ra,0x2
    80002ea0:	360080e7          	jalr	864(ra) # 800051fc <_Z11stringToIntPKc>
    80002ea4:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80002ea8:	00006517          	auipc	a0,0x6
    80002eac:	37050513          	addi	a0,a0,880 # 80009218 <CONSOLE_STATUS+0x208>
    80002eb0:	00002097          	auipc	ra,0x2
    80002eb4:	1ec080e7          	jalr	492(ra) # 8000509c <_Z11printStringPKc>
    getString(input, 30);
    80002eb8:	01e00593          	li	a1,30
    80002ebc:	00048513          	mv	a0,s1
    80002ec0:	00002097          	auipc	ra,0x2
    80002ec4:	264080e7          	jalr	612(ra) # 80005124 <_Z9getStringPci>
    n = stringToInt(input);
    80002ec8:	00048513          	mv	a0,s1
    80002ecc:	00002097          	auipc	ra,0x2
    80002ed0:	330080e7          	jalr	816(ra) # 800051fc <_Z11stringToIntPKc>
    80002ed4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80002ed8:	00006517          	auipc	a0,0x6
    80002edc:	36050513          	addi	a0,a0,864 # 80009238 <CONSOLE_STATUS+0x228>
    80002ee0:	00002097          	auipc	ra,0x2
    80002ee4:	1bc080e7          	jalr	444(ra) # 8000509c <_Z11printStringPKc>
    80002ee8:	00000613          	li	a2,0
    80002eec:	00a00593          	li	a1,10
    80002ef0:	00090513          	mv	a0,s2
    80002ef4:	00002097          	auipc	ra,0x2
    80002ef8:	358080e7          	jalr	856(ra) # 8000524c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80002efc:	00006517          	auipc	a0,0x6
    80002f00:	35450513          	addi	a0,a0,852 # 80009250 <CONSOLE_STATUS+0x240>
    80002f04:	00002097          	auipc	ra,0x2
    80002f08:	198080e7          	jalr	408(ra) # 8000509c <_Z11printStringPKc>
    80002f0c:	00000613          	li	a2,0
    80002f10:	00a00593          	li	a1,10
    80002f14:	00048513          	mv	a0,s1
    80002f18:	00002097          	auipc	ra,0x2
    80002f1c:	334080e7          	jalr	820(ra) # 8000524c <_Z8printIntiii>
    printString(".\n");
    80002f20:	00006517          	auipc	a0,0x6
    80002f24:	34850513          	addi	a0,a0,840 # 80009268 <CONSOLE_STATUS+0x258>
    80002f28:	00002097          	auipc	ra,0x2
    80002f2c:	174080e7          	jalr	372(ra) # 8000509c <_Z11printStringPKc>
    if(threadNum > n) {
    80002f30:	0324c463          	blt	s1,s2,80002f58 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80002f34:	03205c63          	blez	s2,80002f6c <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80002f38:	03800513          	li	a0,56
    80002f3c:	ffffe097          	auipc	ra,0xffffe
    80002f40:	748080e7          	jalr	1864(ra) # 80001684 <_Znwm>
    80002f44:	00050a13          	mv	s4,a0
    80002f48:	00048593          	mv	a1,s1
    80002f4c:	00003097          	auipc	ra,0x3
    80002f50:	090080e7          	jalr	144(ra) # 80005fdc <_ZN6BufferC1Ei>
    80002f54:	0300006f          	j	80002f84 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002f58:	00006517          	auipc	a0,0x6
    80002f5c:	31850513          	addi	a0,a0,792 # 80009270 <CONSOLE_STATUS+0x260>
    80002f60:	00002097          	auipc	ra,0x2
    80002f64:	13c080e7          	jalr	316(ra) # 8000509c <_Z11printStringPKc>
        return;
    80002f68:	0140006f          	j	80002f7c <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002f6c:	00006517          	auipc	a0,0x6
    80002f70:	34450513          	addi	a0,a0,836 # 800092b0 <CONSOLE_STATUS+0x2a0>
    80002f74:	00002097          	auipc	ra,0x2
    80002f78:	128080e7          	jalr	296(ra) # 8000509c <_Z11printStringPKc>
        return;
    80002f7c:	000b0113          	mv	sp,s6
    80002f80:	1500006f          	j	800030d0 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002f84:	00000593          	li	a1,0
    80002f88:	00009517          	auipc	a0,0x9
    80002f8c:	84850513          	addi	a0,a0,-1976 # 8000b7d0 <_ZL10waitForAll>
    80002f90:	ffffe097          	auipc	ra,0xffffe
    80002f94:	544080e7          	jalr	1348(ra) # 800014d4 <_Z8sem_openPP13SyncSemaphorej>
    thread_t threads[threadNum];
    80002f98:	00391793          	slli	a5,s2,0x3
    80002f9c:	00f78793          	addi	a5,a5,15
    80002fa0:	ff07f793          	andi	a5,a5,-16
    80002fa4:	40f10133          	sub	sp,sp,a5
    80002fa8:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80002fac:	0019071b          	addiw	a4,s2,1
    80002fb0:	00171793          	slli	a5,a4,0x1
    80002fb4:	00e787b3          	add	a5,a5,a4
    80002fb8:	00379793          	slli	a5,a5,0x3
    80002fbc:	00f78793          	addi	a5,a5,15
    80002fc0:	ff07f793          	andi	a5,a5,-16
    80002fc4:	40f10133          	sub	sp,sp,a5
    80002fc8:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80002fcc:	00191613          	slli	a2,s2,0x1
    80002fd0:	012607b3          	add	a5,a2,s2
    80002fd4:	00379793          	slli	a5,a5,0x3
    80002fd8:	00f987b3          	add	a5,s3,a5
    80002fdc:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80002fe0:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80002fe4:	00008717          	auipc	a4,0x8
    80002fe8:	7ec73703          	ld	a4,2028(a4) # 8000b7d0 <_ZL10waitForAll>
    80002fec:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80002ff0:	00078613          	mv	a2,a5
    80002ff4:	00000597          	auipc	a1,0x0
    80002ff8:	d7458593          	addi	a1,a1,-652 # 80002d68 <_ZL8consumerPv>
    80002ffc:	f9840513          	addi	a0,s0,-104
    80003000:	ffffe097          	auipc	ra,0xffffe
    80003004:	458080e7          	jalr	1112(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003008:	00000493          	li	s1,0
    8000300c:	0280006f          	j	80003034 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003010:	00000597          	auipc	a1,0x0
    80003014:	c1458593          	addi	a1,a1,-1004 # 80002c24 <_ZL16producerKeyboardPv>
                      data + i);
    80003018:	00179613          	slli	a2,a5,0x1
    8000301c:	00f60633          	add	a2,a2,a5
    80003020:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003024:	00c98633          	add	a2,s3,a2
    80003028:	ffffe097          	auipc	ra,0xffffe
    8000302c:	430080e7          	jalr	1072(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003030:	0014849b          	addiw	s1,s1,1
    80003034:	0524d263          	bge	s1,s2,80003078 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003038:	00149793          	slli	a5,s1,0x1
    8000303c:	009787b3          	add	a5,a5,s1
    80003040:	00379793          	slli	a5,a5,0x3
    80003044:	00f987b3          	add	a5,s3,a5
    80003048:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    8000304c:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003050:	00008717          	auipc	a4,0x8
    80003054:	78073703          	ld	a4,1920(a4) # 8000b7d0 <_ZL10waitForAll>
    80003058:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    8000305c:	00048793          	mv	a5,s1
    80003060:	00349513          	slli	a0,s1,0x3
    80003064:	00aa8533          	add	a0,s5,a0
    80003068:	fa9054e3          	blez	s1,80003010 <_Z22producerConsumer_C_APIv+0x1c8>
    8000306c:	00000597          	auipc	a1,0x0
    80003070:	c6858593          	addi	a1,a1,-920 # 80002cd4 <_ZL8producerPv>
    80003074:	fa5ff06f          	j	80003018 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003078:	ffffe097          	auipc	ra,0xffffe
    8000307c:	43c080e7          	jalr	1084(ra) # 800014b4 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003080:	00000493          	li	s1,0
    80003084:	00994e63          	blt	s2,s1,800030a0 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003088:	00008517          	auipc	a0,0x8
    8000308c:	74853503          	ld	a0,1864(a0) # 8000b7d0 <_ZL10waitForAll>
    80003090:	ffffe097          	auipc	ra,0xffffe
    80003094:	4a0080e7          	jalr	1184(ra) # 80001530 <_Z8sem_waitP13SyncSemaphore>
    for (int i = 0; i <= threadNum; i++) {
    80003098:	0014849b          	addiw	s1,s1,1
    8000309c:	fe9ff06f          	j	80003084 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800030a0:	00008517          	auipc	a0,0x8
    800030a4:	73053503          	ld	a0,1840(a0) # 8000b7d0 <_ZL10waitForAll>
    800030a8:	ffffe097          	auipc	ra,0xffffe
    800030ac:	45c080e7          	jalr	1116(ra) # 80001504 <_Z9sem_closeP13SyncSemaphore>
    delete buffer;
    800030b0:	000a0e63          	beqz	s4,800030cc <_Z22producerConsumer_C_APIv+0x284>
    800030b4:	000a0513          	mv	a0,s4
    800030b8:	00003097          	auipc	ra,0x3
    800030bc:	164080e7          	jalr	356(ra) # 8000621c <_ZN6BufferD1Ev>
    800030c0:	000a0513          	mv	a0,s4
    800030c4:	ffffe097          	auipc	ra,0xffffe
    800030c8:	610080e7          	jalr	1552(ra) # 800016d4 <_ZdlPv>
    800030cc:	000b0113          	mv	sp,s6

}
    800030d0:	f9040113          	addi	sp,s0,-112
    800030d4:	06813083          	ld	ra,104(sp)
    800030d8:	06013403          	ld	s0,96(sp)
    800030dc:	05813483          	ld	s1,88(sp)
    800030e0:	05013903          	ld	s2,80(sp)
    800030e4:	04813983          	ld	s3,72(sp)
    800030e8:	04013a03          	ld	s4,64(sp)
    800030ec:	03813a83          	ld	s5,56(sp)
    800030f0:	03013b03          	ld	s6,48(sp)
    800030f4:	07010113          	addi	sp,sp,112
    800030f8:	00008067          	ret
    800030fc:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003100:	000a0513          	mv	a0,s4
    80003104:	ffffe097          	auipc	ra,0xffffe
    80003108:	5d0080e7          	jalr	1488(ra) # 800016d4 <_ZdlPv>
    8000310c:	00048513          	mv	a0,s1
    80003110:	00009097          	auipc	ra,0x9
    80003114:	7d8080e7          	jalr	2008(ra) # 8000c8e8 <_Unwind_Resume>

0000000080003118 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003118:	fe010113          	addi	sp,sp,-32
    8000311c:	00113c23          	sd	ra,24(sp)
    80003120:	00813823          	sd	s0,16(sp)
    80003124:	00913423          	sd	s1,8(sp)
    80003128:	01213023          	sd	s2,0(sp)
    8000312c:	02010413          	addi	s0,sp,32
    80003130:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003134:	00100793          	li	a5,1
    80003138:	02a7f863          	bgeu	a5,a0,80003168 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000313c:	00a00793          	li	a5,10
    80003140:	02f577b3          	remu	a5,a0,a5
    80003144:	02078e63          	beqz	a5,80003180 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003148:	fff48513          	addi	a0,s1,-1
    8000314c:	00000097          	auipc	ra,0x0
    80003150:	fcc080e7          	jalr	-52(ra) # 80003118 <_ZL9fibonaccim>
    80003154:	00050913          	mv	s2,a0
    80003158:	ffe48513          	addi	a0,s1,-2
    8000315c:	00000097          	auipc	ra,0x0
    80003160:	fbc080e7          	jalr	-68(ra) # 80003118 <_ZL9fibonaccim>
    80003164:	00a90533          	add	a0,s2,a0
}
    80003168:	01813083          	ld	ra,24(sp)
    8000316c:	01013403          	ld	s0,16(sp)
    80003170:	00813483          	ld	s1,8(sp)
    80003174:	00013903          	ld	s2,0(sp)
    80003178:	02010113          	addi	sp,sp,32
    8000317c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003180:	ffffe097          	auipc	ra,0xffffe
    80003184:	334080e7          	jalr	820(ra) # 800014b4 <_Z15thread_dispatchv>
    80003188:	fc1ff06f          	j	80003148 <_ZL9fibonaccim+0x30>

000000008000318c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    8000318c:	fe010113          	addi	sp,sp,-32
    80003190:	00113c23          	sd	ra,24(sp)
    80003194:	00813823          	sd	s0,16(sp)
    80003198:	00913423          	sd	s1,8(sp)
    8000319c:	01213023          	sd	s2,0(sp)
    800031a0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800031a4:	00000913          	li	s2,0
    800031a8:	0380006f          	j	800031e0 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800031ac:	ffffe097          	auipc	ra,0xffffe
    800031b0:	308080e7          	jalr	776(ra) # 800014b4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800031b4:	00148493          	addi	s1,s1,1
    800031b8:	000027b7          	lui	a5,0x2
    800031bc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800031c0:	0097ee63          	bltu	a5,s1,800031dc <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800031c4:	00000713          	li	a4,0
    800031c8:	000077b7          	lui	a5,0x7
    800031cc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800031d0:	fce7eee3          	bltu	a5,a4,800031ac <_ZN7WorkerA11workerBodyAEPv+0x20>
    800031d4:	00170713          	addi	a4,a4,1
    800031d8:	ff1ff06f          	j	800031c8 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800031dc:	00190913          	addi	s2,s2,1
    800031e0:	00900793          	li	a5,9
    800031e4:	0527e063          	bltu	a5,s2,80003224 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800031e8:	00006517          	auipc	a0,0x6
    800031ec:	0f850513          	addi	a0,a0,248 # 800092e0 <CONSOLE_STATUS+0x2d0>
    800031f0:	00002097          	auipc	ra,0x2
    800031f4:	eac080e7          	jalr	-340(ra) # 8000509c <_Z11printStringPKc>
    800031f8:	00000613          	li	a2,0
    800031fc:	00a00593          	li	a1,10
    80003200:	0009051b          	sext.w	a0,s2
    80003204:	00002097          	auipc	ra,0x2
    80003208:	048080e7          	jalr	72(ra) # 8000524c <_Z8printIntiii>
    8000320c:	00006517          	auipc	a0,0x6
    80003210:	36450513          	addi	a0,a0,868 # 80009570 <CONSOLE_STATUS+0x560>
    80003214:	00002097          	auipc	ra,0x2
    80003218:	e88080e7          	jalr	-376(ra) # 8000509c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000321c:	00000493          	li	s1,0
    80003220:	f99ff06f          	j	800031b8 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003224:	00006517          	auipc	a0,0x6
    80003228:	0c450513          	addi	a0,a0,196 # 800092e8 <CONSOLE_STATUS+0x2d8>
    8000322c:	00002097          	auipc	ra,0x2
    80003230:	e70080e7          	jalr	-400(ra) # 8000509c <_Z11printStringPKc>
    finishedA = true;
    80003234:	00100793          	li	a5,1
    80003238:	00008717          	auipc	a4,0x8
    8000323c:	5af70023          	sb	a5,1440(a4) # 8000b7d8 <_ZL9finishedA>
}
    80003240:	01813083          	ld	ra,24(sp)
    80003244:	01013403          	ld	s0,16(sp)
    80003248:	00813483          	ld	s1,8(sp)
    8000324c:	00013903          	ld	s2,0(sp)
    80003250:	02010113          	addi	sp,sp,32
    80003254:	00008067          	ret

0000000080003258 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003258:	fe010113          	addi	sp,sp,-32
    8000325c:	00113c23          	sd	ra,24(sp)
    80003260:	00813823          	sd	s0,16(sp)
    80003264:	00913423          	sd	s1,8(sp)
    80003268:	01213023          	sd	s2,0(sp)
    8000326c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003270:	00000913          	li	s2,0
    80003274:	0380006f          	j	800032ac <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003278:	ffffe097          	auipc	ra,0xffffe
    8000327c:	23c080e7          	jalr	572(ra) # 800014b4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003280:	00148493          	addi	s1,s1,1
    80003284:	000027b7          	lui	a5,0x2
    80003288:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000328c:	0097ee63          	bltu	a5,s1,800032a8 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003290:	00000713          	li	a4,0
    80003294:	000077b7          	lui	a5,0x7
    80003298:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000329c:	fce7eee3          	bltu	a5,a4,80003278 <_ZN7WorkerB11workerBodyBEPv+0x20>
    800032a0:	00170713          	addi	a4,a4,1
    800032a4:	ff1ff06f          	j	80003294 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800032a8:	00190913          	addi	s2,s2,1
    800032ac:	00f00793          	li	a5,15
    800032b0:	0527e063          	bltu	a5,s2,800032f0 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800032b4:	00006517          	auipc	a0,0x6
    800032b8:	04450513          	addi	a0,a0,68 # 800092f8 <CONSOLE_STATUS+0x2e8>
    800032bc:	00002097          	auipc	ra,0x2
    800032c0:	de0080e7          	jalr	-544(ra) # 8000509c <_Z11printStringPKc>
    800032c4:	00000613          	li	a2,0
    800032c8:	00a00593          	li	a1,10
    800032cc:	0009051b          	sext.w	a0,s2
    800032d0:	00002097          	auipc	ra,0x2
    800032d4:	f7c080e7          	jalr	-132(ra) # 8000524c <_Z8printIntiii>
    800032d8:	00006517          	auipc	a0,0x6
    800032dc:	29850513          	addi	a0,a0,664 # 80009570 <CONSOLE_STATUS+0x560>
    800032e0:	00002097          	auipc	ra,0x2
    800032e4:	dbc080e7          	jalr	-580(ra) # 8000509c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800032e8:	00000493          	li	s1,0
    800032ec:	f99ff06f          	j	80003284 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800032f0:	00006517          	auipc	a0,0x6
    800032f4:	01050513          	addi	a0,a0,16 # 80009300 <CONSOLE_STATUS+0x2f0>
    800032f8:	00002097          	auipc	ra,0x2
    800032fc:	da4080e7          	jalr	-604(ra) # 8000509c <_Z11printStringPKc>
    finishedB = true;
    80003300:	00100793          	li	a5,1
    80003304:	00008717          	auipc	a4,0x8
    80003308:	4cf70aa3          	sb	a5,1237(a4) # 8000b7d9 <_ZL9finishedB>
    thread_dispatch();
    8000330c:	ffffe097          	auipc	ra,0xffffe
    80003310:	1a8080e7          	jalr	424(ra) # 800014b4 <_Z15thread_dispatchv>
}
    80003314:	01813083          	ld	ra,24(sp)
    80003318:	01013403          	ld	s0,16(sp)
    8000331c:	00813483          	ld	s1,8(sp)
    80003320:	00013903          	ld	s2,0(sp)
    80003324:	02010113          	addi	sp,sp,32
    80003328:	00008067          	ret

000000008000332c <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    8000332c:	fe010113          	addi	sp,sp,-32
    80003330:	00113c23          	sd	ra,24(sp)
    80003334:	00813823          	sd	s0,16(sp)
    80003338:	00913423          	sd	s1,8(sp)
    8000333c:	01213023          	sd	s2,0(sp)
    80003340:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003344:	00000493          	li	s1,0
    80003348:	0400006f          	j	80003388 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000334c:	00006517          	auipc	a0,0x6
    80003350:	fc450513          	addi	a0,a0,-60 # 80009310 <CONSOLE_STATUS+0x300>
    80003354:	00002097          	auipc	ra,0x2
    80003358:	d48080e7          	jalr	-696(ra) # 8000509c <_Z11printStringPKc>
    8000335c:	00000613          	li	a2,0
    80003360:	00a00593          	li	a1,10
    80003364:	00048513          	mv	a0,s1
    80003368:	00002097          	auipc	ra,0x2
    8000336c:	ee4080e7          	jalr	-284(ra) # 8000524c <_Z8printIntiii>
    80003370:	00006517          	auipc	a0,0x6
    80003374:	20050513          	addi	a0,a0,512 # 80009570 <CONSOLE_STATUS+0x560>
    80003378:	00002097          	auipc	ra,0x2
    8000337c:	d24080e7          	jalr	-732(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003380:	0014849b          	addiw	s1,s1,1
    80003384:	0ff4f493          	andi	s1,s1,255
    80003388:	00200793          	li	a5,2
    8000338c:	fc97f0e3          	bgeu	a5,s1,8000334c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003390:	00006517          	auipc	a0,0x6
    80003394:	f8850513          	addi	a0,a0,-120 # 80009318 <CONSOLE_STATUS+0x308>
    80003398:	00002097          	auipc	ra,0x2
    8000339c:	d04080e7          	jalr	-764(ra) # 8000509c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800033a0:	00700313          	li	t1,7
    thread_dispatch();
    800033a4:	ffffe097          	auipc	ra,0xffffe
    800033a8:	110080e7          	jalr	272(ra) # 800014b4 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800033ac:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800033b0:	00006517          	auipc	a0,0x6
    800033b4:	f7850513          	addi	a0,a0,-136 # 80009328 <CONSOLE_STATUS+0x318>
    800033b8:	00002097          	auipc	ra,0x2
    800033bc:	ce4080e7          	jalr	-796(ra) # 8000509c <_Z11printStringPKc>
    800033c0:	00000613          	li	a2,0
    800033c4:	00a00593          	li	a1,10
    800033c8:	0009051b          	sext.w	a0,s2
    800033cc:	00002097          	auipc	ra,0x2
    800033d0:	e80080e7          	jalr	-384(ra) # 8000524c <_Z8printIntiii>
    800033d4:	00006517          	auipc	a0,0x6
    800033d8:	19c50513          	addi	a0,a0,412 # 80009570 <CONSOLE_STATUS+0x560>
    800033dc:	00002097          	auipc	ra,0x2
    800033e0:	cc0080e7          	jalr	-832(ra) # 8000509c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800033e4:	00c00513          	li	a0,12
    800033e8:	00000097          	auipc	ra,0x0
    800033ec:	d30080e7          	jalr	-720(ra) # 80003118 <_ZL9fibonaccim>
    800033f0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800033f4:	00006517          	auipc	a0,0x6
    800033f8:	f3c50513          	addi	a0,a0,-196 # 80009330 <CONSOLE_STATUS+0x320>
    800033fc:	00002097          	auipc	ra,0x2
    80003400:	ca0080e7          	jalr	-864(ra) # 8000509c <_Z11printStringPKc>
    80003404:	00000613          	li	a2,0
    80003408:	00a00593          	li	a1,10
    8000340c:	0009051b          	sext.w	a0,s2
    80003410:	00002097          	auipc	ra,0x2
    80003414:	e3c080e7          	jalr	-452(ra) # 8000524c <_Z8printIntiii>
    80003418:	00006517          	auipc	a0,0x6
    8000341c:	15850513          	addi	a0,a0,344 # 80009570 <CONSOLE_STATUS+0x560>
    80003420:	00002097          	auipc	ra,0x2
    80003424:	c7c080e7          	jalr	-900(ra) # 8000509c <_Z11printStringPKc>
    80003428:	0400006f          	j	80003468 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000342c:	00006517          	auipc	a0,0x6
    80003430:	ee450513          	addi	a0,a0,-284 # 80009310 <CONSOLE_STATUS+0x300>
    80003434:	00002097          	auipc	ra,0x2
    80003438:	c68080e7          	jalr	-920(ra) # 8000509c <_Z11printStringPKc>
    8000343c:	00000613          	li	a2,0
    80003440:	00a00593          	li	a1,10
    80003444:	00048513          	mv	a0,s1
    80003448:	00002097          	auipc	ra,0x2
    8000344c:	e04080e7          	jalr	-508(ra) # 8000524c <_Z8printIntiii>
    80003450:	00006517          	auipc	a0,0x6
    80003454:	12050513          	addi	a0,a0,288 # 80009570 <CONSOLE_STATUS+0x560>
    80003458:	00002097          	auipc	ra,0x2
    8000345c:	c44080e7          	jalr	-956(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003460:	0014849b          	addiw	s1,s1,1
    80003464:	0ff4f493          	andi	s1,s1,255
    80003468:	00500793          	li	a5,5
    8000346c:	fc97f0e3          	bgeu	a5,s1,8000342c <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80003470:	00006517          	auipc	a0,0x6
    80003474:	ed050513          	addi	a0,a0,-304 # 80009340 <CONSOLE_STATUS+0x330>
    80003478:	00002097          	auipc	ra,0x2
    8000347c:	c24080e7          	jalr	-988(ra) # 8000509c <_Z11printStringPKc>
    finishedC = true;
    80003480:	00100793          	li	a5,1
    80003484:	00008717          	auipc	a4,0x8
    80003488:	34f70b23          	sb	a5,854(a4) # 8000b7da <_ZL9finishedC>
    thread_dispatch();
    8000348c:	ffffe097          	auipc	ra,0xffffe
    80003490:	028080e7          	jalr	40(ra) # 800014b4 <_Z15thread_dispatchv>
}
    80003494:	01813083          	ld	ra,24(sp)
    80003498:	01013403          	ld	s0,16(sp)
    8000349c:	00813483          	ld	s1,8(sp)
    800034a0:	00013903          	ld	s2,0(sp)
    800034a4:	02010113          	addi	sp,sp,32
    800034a8:	00008067          	ret

00000000800034ac <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800034ac:	fe010113          	addi	sp,sp,-32
    800034b0:	00113c23          	sd	ra,24(sp)
    800034b4:	00813823          	sd	s0,16(sp)
    800034b8:	00913423          	sd	s1,8(sp)
    800034bc:	01213023          	sd	s2,0(sp)
    800034c0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800034c4:	00a00493          	li	s1,10
    800034c8:	0400006f          	j	80003508 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800034cc:	00006517          	auipc	a0,0x6
    800034d0:	e8450513          	addi	a0,a0,-380 # 80009350 <CONSOLE_STATUS+0x340>
    800034d4:	00002097          	auipc	ra,0x2
    800034d8:	bc8080e7          	jalr	-1080(ra) # 8000509c <_Z11printStringPKc>
    800034dc:	00000613          	li	a2,0
    800034e0:	00a00593          	li	a1,10
    800034e4:	00048513          	mv	a0,s1
    800034e8:	00002097          	auipc	ra,0x2
    800034ec:	d64080e7          	jalr	-668(ra) # 8000524c <_Z8printIntiii>
    800034f0:	00006517          	auipc	a0,0x6
    800034f4:	08050513          	addi	a0,a0,128 # 80009570 <CONSOLE_STATUS+0x560>
    800034f8:	00002097          	auipc	ra,0x2
    800034fc:	ba4080e7          	jalr	-1116(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003500:	0014849b          	addiw	s1,s1,1
    80003504:	0ff4f493          	andi	s1,s1,255
    80003508:	00c00793          	li	a5,12
    8000350c:	fc97f0e3          	bgeu	a5,s1,800034cc <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003510:	00006517          	auipc	a0,0x6
    80003514:	e4850513          	addi	a0,a0,-440 # 80009358 <CONSOLE_STATUS+0x348>
    80003518:	00002097          	auipc	ra,0x2
    8000351c:	b84080e7          	jalr	-1148(ra) # 8000509c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003520:	00500313          	li	t1,5
    thread_dispatch();
    80003524:	ffffe097          	auipc	ra,0xffffe
    80003528:	f90080e7          	jalr	-112(ra) # 800014b4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000352c:	01000513          	li	a0,16
    80003530:	00000097          	auipc	ra,0x0
    80003534:	be8080e7          	jalr	-1048(ra) # 80003118 <_ZL9fibonaccim>
    80003538:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000353c:	00006517          	auipc	a0,0x6
    80003540:	e2c50513          	addi	a0,a0,-468 # 80009368 <CONSOLE_STATUS+0x358>
    80003544:	00002097          	auipc	ra,0x2
    80003548:	b58080e7          	jalr	-1192(ra) # 8000509c <_Z11printStringPKc>
    8000354c:	00000613          	li	a2,0
    80003550:	00a00593          	li	a1,10
    80003554:	0009051b          	sext.w	a0,s2
    80003558:	00002097          	auipc	ra,0x2
    8000355c:	cf4080e7          	jalr	-780(ra) # 8000524c <_Z8printIntiii>
    80003560:	00006517          	auipc	a0,0x6
    80003564:	01050513          	addi	a0,a0,16 # 80009570 <CONSOLE_STATUS+0x560>
    80003568:	00002097          	auipc	ra,0x2
    8000356c:	b34080e7          	jalr	-1228(ra) # 8000509c <_Z11printStringPKc>
    80003570:	0400006f          	j	800035b0 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003574:	00006517          	auipc	a0,0x6
    80003578:	ddc50513          	addi	a0,a0,-548 # 80009350 <CONSOLE_STATUS+0x340>
    8000357c:	00002097          	auipc	ra,0x2
    80003580:	b20080e7          	jalr	-1248(ra) # 8000509c <_Z11printStringPKc>
    80003584:	00000613          	li	a2,0
    80003588:	00a00593          	li	a1,10
    8000358c:	00048513          	mv	a0,s1
    80003590:	00002097          	auipc	ra,0x2
    80003594:	cbc080e7          	jalr	-836(ra) # 8000524c <_Z8printIntiii>
    80003598:	00006517          	auipc	a0,0x6
    8000359c:	fd850513          	addi	a0,a0,-40 # 80009570 <CONSOLE_STATUS+0x560>
    800035a0:	00002097          	auipc	ra,0x2
    800035a4:	afc080e7          	jalr	-1284(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 16; i++) {
    800035a8:	0014849b          	addiw	s1,s1,1
    800035ac:	0ff4f493          	andi	s1,s1,255
    800035b0:	00f00793          	li	a5,15
    800035b4:	fc97f0e3          	bgeu	a5,s1,80003574 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800035b8:	00006517          	auipc	a0,0x6
    800035bc:	dc050513          	addi	a0,a0,-576 # 80009378 <CONSOLE_STATUS+0x368>
    800035c0:	00002097          	auipc	ra,0x2
    800035c4:	adc080e7          	jalr	-1316(ra) # 8000509c <_Z11printStringPKc>
    finishedD = true;
    800035c8:	00100793          	li	a5,1
    800035cc:	00008717          	auipc	a4,0x8
    800035d0:	20f707a3          	sb	a5,527(a4) # 8000b7db <_ZL9finishedD>
    thread_dispatch();
    800035d4:	ffffe097          	auipc	ra,0xffffe
    800035d8:	ee0080e7          	jalr	-288(ra) # 800014b4 <_Z15thread_dispatchv>
}
    800035dc:	01813083          	ld	ra,24(sp)
    800035e0:	01013403          	ld	s0,16(sp)
    800035e4:	00813483          	ld	s1,8(sp)
    800035e8:	00013903          	ld	s2,0(sp)
    800035ec:	02010113          	addi	sp,sp,32
    800035f0:	00008067          	ret

00000000800035f4 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800035f4:	fc010113          	addi	sp,sp,-64
    800035f8:	02113c23          	sd	ra,56(sp)
    800035fc:	02813823          	sd	s0,48(sp)
    80003600:	02913423          	sd	s1,40(sp)
    80003604:	03213023          	sd	s2,32(sp)
    80003608:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    8000360c:	02000513          	li	a0,32
    80003610:	ffffe097          	auipc	ra,0xffffe
    80003614:	074080e7          	jalr	116(ra) # 80001684 <_Znwm>
    80003618:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    8000361c:	fffff097          	auipc	ra,0xfffff
    80003620:	9a4080e7          	jalr	-1628(ra) # 80001fc0 <_ZN6ThreadC1Ev>
    80003624:	00008797          	auipc	a5,0x8
    80003628:	f4c78793          	addi	a5,a5,-180 # 8000b570 <_ZTV7WorkerA+0x10>
    8000362c:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003630:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003634:	00006517          	auipc	a0,0x6
    80003638:	d5450513          	addi	a0,a0,-684 # 80009388 <CONSOLE_STATUS+0x378>
    8000363c:	00002097          	auipc	ra,0x2
    80003640:	a60080e7          	jalr	-1440(ra) # 8000509c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003644:	02000513          	li	a0,32
    80003648:	ffffe097          	auipc	ra,0xffffe
    8000364c:	03c080e7          	jalr	60(ra) # 80001684 <_Znwm>
    80003650:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003654:	fffff097          	auipc	ra,0xfffff
    80003658:	96c080e7          	jalr	-1684(ra) # 80001fc0 <_ZN6ThreadC1Ev>
    8000365c:	00008797          	auipc	a5,0x8
    80003660:	f3c78793          	addi	a5,a5,-196 # 8000b598 <_ZTV7WorkerB+0x10>
    80003664:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003668:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    8000366c:	00006517          	auipc	a0,0x6
    80003670:	d3450513          	addi	a0,a0,-716 # 800093a0 <CONSOLE_STATUS+0x390>
    80003674:	00002097          	auipc	ra,0x2
    80003678:	a28080e7          	jalr	-1496(ra) # 8000509c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    8000367c:	02000513          	li	a0,32
    80003680:	ffffe097          	auipc	ra,0xffffe
    80003684:	004080e7          	jalr	4(ra) # 80001684 <_Znwm>
    80003688:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    8000368c:	fffff097          	auipc	ra,0xfffff
    80003690:	934080e7          	jalr	-1740(ra) # 80001fc0 <_ZN6ThreadC1Ev>
    80003694:	00008797          	auipc	a5,0x8
    80003698:	f2c78793          	addi	a5,a5,-212 # 8000b5c0 <_ZTV7WorkerC+0x10>
    8000369c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800036a0:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800036a4:	00006517          	auipc	a0,0x6
    800036a8:	d1450513          	addi	a0,a0,-748 # 800093b8 <CONSOLE_STATUS+0x3a8>
    800036ac:	00002097          	auipc	ra,0x2
    800036b0:	9f0080e7          	jalr	-1552(ra) # 8000509c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800036b4:	02000513          	li	a0,32
    800036b8:	ffffe097          	auipc	ra,0xffffe
    800036bc:	fcc080e7          	jalr	-52(ra) # 80001684 <_Znwm>
    800036c0:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800036c4:	fffff097          	auipc	ra,0xfffff
    800036c8:	8fc080e7          	jalr	-1796(ra) # 80001fc0 <_ZN6ThreadC1Ev>
    800036cc:	00008797          	auipc	a5,0x8
    800036d0:	f1c78793          	addi	a5,a5,-228 # 8000b5e8 <_ZTV7WorkerD+0x10>
    800036d4:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800036d8:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800036dc:	00006517          	auipc	a0,0x6
    800036e0:	cf450513          	addi	a0,a0,-780 # 800093d0 <CONSOLE_STATUS+0x3c0>
    800036e4:	00002097          	auipc	ra,0x2
    800036e8:	9b8080e7          	jalr	-1608(ra) # 8000509c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800036ec:	00000493          	li	s1,0
    800036f0:	00300793          	li	a5,3
    800036f4:	0297c663          	blt	a5,s1,80003720 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800036f8:	00349793          	slli	a5,s1,0x3
    800036fc:	fe040713          	addi	a4,s0,-32
    80003700:	00f707b3          	add	a5,a4,a5
    80003704:	fe07b503          	ld	a0,-32(a5)
    80003708:	fffff097          	auipc	ra,0xfffff
    8000370c:	888080e7          	jalr	-1912(ra) # 80001f90 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003710:	0014849b          	addiw	s1,s1,1
    80003714:	fddff06f          	j	800036f0 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003718:	fffff097          	auipc	ra,0xfffff
    8000371c:	818080e7          	jalr	-2024(ra) # 80001f30 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003720:	00008797          	auipc	a5,0x8
    80003724:	0b87c783          	lbu	a5,184(a5) # 8000b7d8 <_ZL9finishedA>
    80003728:	fe0788e3          	beqz	a5,80003718 <_Z20Threads_CPP_API_testv+0x124>
    8000372c:	00008797          	auipc	a5,0x8
    80003730:	0ad7c783          	lbu	a5,173(a5) # 8000b7d9 <_ZL9finishedB>
    80003734:	fe0782e3          	beqz	a5,80003718 <_Z20Threads_CPP_API_testv+0x124>
    80003738:	00008797          	auipc	a5,0x8
    8000373c:	0a27c783          	lbu	a5,162(a5) # 8000b7da <_ZL9finishedC>
    80003740:	fc078ce3          	beqz	a5,80003718 <_Z20Threads_CPP_API_testv+0x124>
    80003744:	00008797          	auipc	a5,0x8
    80003748:	0977c783          	lbu	a5,151(a5) # 8000b7db <_ZL9finishedD>
    8000374c:	fc0786e3          	beqz	a5,80003718 <_Z20Threads_CPP_API_testv+0x124>
    80003750:	fc040493          	addi	s1,s0,-64
    80003754:	0080006f          	j	8000375c <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80003758:	00848493          	addi	s1,s1,8
    8000375c:	fe040793          	addi	a5,s0,-32
    80003760:	08f48663          	beq	s1,a5,800037ec <_Z20Threads_CPP_API_testv+0x1f8>
    80003764:	0004b503          	ld	a0,0(s1)
    80003768:	fe0508e3          	beqz	a0,80003758 <_Z20Threads_CPP_API_testv+0x164>
    8000376c:	00053783          	ld	a5,0(a0)
    80003770:	0087b783          	ld	a5,8(a5)
    80003774:	000780e7          	jalr	a5
    80003778:	fe1ff06f          	j	80003758 <_Z20Threads_CPP_API_testv+0x164>
    8000377c:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003780:	00048513          	mv	a0,s1
    80003784:	ffffe097          	auipc	ra,0xffffe
    80003788:	f50080e7          	jalr	-176(ra) # 800016d4 <_ZdlPv>
    8000378c:	00090513          	mv	a0,s2
    80003790:	00009097          	auipc	ra,0x9
    80003794:	158080e7          	jalr	344(ra) # 8000c8e8 <_Unwind_Resume>
    80003798:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    8000379c:	00048513          	mv	a0,s1
    800037a0:	ffffe097          	auipc	ra,0xffffe
    800037a4:	f34080e7          	jalr	-204(ra) # 800016d4 <_ZdlPv>
    800037a8:	00090513          	mv	a0,s2
    800037ac:	00009097          	auipc	ra,0x9
    800037b0:	13c080e7          	jalr	316(ra) # 8000c8e8 <_Unwind_Resume>
    800037b4:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800037b8:	00048513          	mv	a0,s1
    800037bc:	ffffe097          	auipc	ra,0xffffe
    800037c0:	f18080e7          	jalr	-232(ra) # 800016d4 <_ZdlPv>
    800037c4:	00090513          	mv	a0,s2
    800037c8:	00009097          	auipc	ra,0x9
    800037cc:	120080e7          	jalr	288(ra) # 8000c8e8 <_Unwind_Resume>
    800037d0:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800037d4:	00048513          	mv	a0,s1
    800037d8:	ffffe097          	auipc	ra,0xffffe
    800037dc:	efc080e7          	jalr	-260(ra) # 800016d4 <_ZdlPv>
    800037e0:	00090513          	mv	a0,s2
    800037e4:	00009097          	auipc	ra,0x9
    800037e8:	104080e7          	jalr	260(ra) # 8000c8e8 <_Unwind_Resume>
}
    800037ec:	03813083          	ld	ra,56(sp)
    800037f0:	03013403          	ld	s0,48(sp)
    800037f4:	02813483          	ld	s1,40(sp)
    800037f8:	02013903          	ld	s2,32(sp)
    800037fc:	04010113          	addi	sp,sp,64
    80003800:	00008067          	ret

0000000080003804 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003804:	ff010113          	addi	sp,sp,-16
    80003808:	00113423          	sd	ra,8(sp)
    8000380c:	00813023          	sd	s0,0(sp)
    80003810:	01010413          	addi	s0,sp,16
    80003814:	00008797          	auipc	a5,0x8
    80003818:	d5c78793          	addi	a5,a5,-676 # 8000b570 <_ZTV7WorkerA+0x10>
    8000381c:	00f53023          	sd	a5,0(a0)
    80003820:	ffffe097          	auipc	ra,0xffffe
    80003824:	5e4080e7          	jalr	1508(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80003828:	00813083          	ld	ra,8(sp)
    8000382c:	00013403          	ld	s0,0(sp)
    80003830:	01010113          	addi	sp,sp,16
    80003834:	00008067          	ret

0000000080003838 <_ZN7WorkerAD0Ev>:
    80003838:	fe010113          	addi	sp,sp,-32
    8000383c:	00113c23          	sd	ra,24(sp)
    80003840:	00813823          	sd	s0,16(sp)
    80003844:	00913423          	sd	s1,8(sp)
    80003848:	02010413          	addi	s0,sp,32
    8000384c:	00050493          	mv	s1,a0
    80003850:	00008797          	auipc	a5,0x8
    80003854:	d2078793          	addi	a5,a5,-736 # 8000b570 <_ZTV7WorkerA+0x10>
    80003858:	00f53023          	sd	a5,0(a0)
    8000385c:	ffffe097          	auipc	ra,0xffffe
    80003860:	5a8080e7          	jalr	1448(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80003864:	00048513          	mv	a0,s1
    80003868:	ffffe097          	auipc	ra,0xffffe
    8000386c:	e6c080e7          	jalr	-404(ra) # 800016d4 <_ZdlPv>
    80003870:	01813083          	ld	ra,24(sp)
    80003874:	01013403          	ld	s0,16(sp)
    80003878:	00813483          	ld	s1,8(sp)
    8000387c:	02010113          	addi	sp,sp,32
    80003880:	00008067          	ret

0000000080003884 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003884:	ff010113          	addi	sp,sp,-16
    80003888:	00113423          	sd	ra,8(sp)
    8000388c:	00813023          	sd	s0,0(sp)
    80003890:	01010413          	addi	s0,sp,16
    80003894:	00008797          	auipc	a5,0x8
    80003898:	d0478793          	addi	a5,a5,-764 # 8000b598 <_ZTV7WorkerB+0x10>
    8000389c:	00f53023          	sd	a5,0(a0)
    800038a0:	ffffe097          	auipc	ra,0xffffe
    800038a4:	564080e7          	jalr	1380(ra) # 80001e04 <_ZN6ThreadD1Ev>
    800038a8:	00813083          	ld	ra,8(sp)
    800038ac:	00013403          	ld	s0,0(sp)
    800038b0:	01010113          	addi	sp,sp,16
    800038b4:	00008067          	ret

00000000800038b8 <_ZN7WorkerBD0Ev>:
    800038b8:	fe010113          	addi	sp,sp,-32
    800038bc:	00113c23          	sd	ra,24(sp)
    800038c0:	00813823          	sd	s0,16(sp)
    800038c4:	00913423          	sd	s1,8(sp)
    800038c8:	02010413          	addi	s0,sp,32
    800038cc:	00050493          	mv	s1,a0
    800038d0:	00008797          	auipc	a5,0x8
    800038d4:	cc878793          	addi	a5,a5,-824 # 8000b598 <_ZTV7WorkerB+0x10>
    800038d8:	00f53023          	sd	a5,0(a0)
    800038dc:	ffffe097          	auipc	ra,0xffffe
    800038e0:	528080e7          	jalr	1320(ra) # 80001e04 <_ZN6ThreadD1Ev>
    800038e4:	00048513          	mv	a0,s1
    800038e8:	ffffe097          	auipc	ra,0xffffe
    800038ec:	dec080e7          	jalr	-532(ra) # 800016d4 <_ZdlPv>
    800038f0:	01813083          	ld	ra,24(sp)
    800038f4:	01013403          	ld	s0,16(sp)
    800038f8:	00813483          	ld	s1,8(sp)
    800038fc:	02010113          	addi	sp,sp,32
    80003900:	00008067          	ret

0000000080003904 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80003904:	ff010113          	addi	sp,sp,-16
    80003908:	00113423          	sd	ra,8(sp)
    8000390c:	00813023          	sd	s0,0(sp)
    80003910:	01010413          	addi	s0,sp,16
    80003914:	00008797          	auipc	a5,0x8
    80003918:	cac78793          	addi	a5,a5,-852 # 8000b5c0 <_ZTV7WorkerC+0x10>
    8000391c:	00f53023          	sd	a5,0(a0)
    80003920:	ffffe097          	auipc	ra,0xffffe
    80003924:	4e4080e7          	jalr	1252(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80003928:	00813083          	ld	ra,8(sp)
    8000392c:	00013403          	ld	s0,0(sp)
    80003930:	01010113          	addi	sp,sp,16
    80003934:	00008067          	ret

0000000080003938 <_ZN7WorkerCD0Ev>:
    80003938:	fe010113          	addi	sp,sp,-32
    8000393c:	00113c23          	sd	ra,24(sp)
    80003940:	00813823          	sd	s0,16(sp)
    80003944:	00913423          	sd	s1,8(sp)
    80003948:	02010413          	addi	s0,sp,32
    8000394c:	00050493          	mv	s1,a0
    80003950:	00008797          	auipc	a5,0x8
    80003954:	c7078793          	addi	a5,a5,-912 # 8000b5c0 <_ZTV7WorkerC+0x10>
    80003958:	00f53023          	sd	a5,0(a0)
    8000395c:	ffffe097          	auipc	ra,0xffffe
    80003960:	4a8080e7          	jalr	1192(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80003964:	00048513          	mv	a0,s1
    80003968:	ffffe097          	auipc	ra,0xffffe
    8000396c:	d6c080e7          	jalr	-660(ra) # 800016d4 <_ZdlPv>
    80003970:	01813083          	ld	ra,24(sp)
    80003974:	01013403          	ld	s0,16(sp)
    80003978:	00813483          	ld	s1,8(sp)
    8000397c:	02010113          	addi	sp,sp,32
    80003980:	00008067          	ret

0000000080003984 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003984:	ff010113          	addi	sp,sp,-16
    80003988:	00113423          	sd	ra,8(sp)
    8000398c:	00813023          	sd	s0,0(sp)
    80003990:	01010413          	addi	s0,sp,16
    80003994:	00008797          	auipc	a5,0x8
    80003998:	c5478793          	addi	a5,a5,-940 # 8000b5e8 <_ZTV7WorkerD+0x10>
    8000399c:	00f53023          	sd	a5,0(a0)
    800039a0:	ffffe097          	auipc	ra,0xffffe
    800039a4:	464080e7          	jalr	1124(ra) # 80001e04 <_ZN6ThreadD1Ev>
    800039a8:	00813083          	ld	ra,8(sp)
    800039ac:	00013403          	ld	s0,0(sp)
    800039b0:	01010113          	addi	sp,sp,16
    800039b4:	00008067          	ret

00000000800039b8 <_ZN7WorkerDD0Ev>:
    800039b8:	fe010113          	addi	sp,sp,-32
    800039bc:	00113c23          	sd	ra,24(sp)
    800039c0:	00813823          	sd	s0,16(sp)
    800039c4:	00913423          	sd	s1,8(sp)
    800039c8:	02010413          	addi	s0,sp,32
    800039cc:	00050493          	mv	s1,a0
    800039d0:	00008797          	auipc	a5,0x8
    800039d4:	c1878793          	addi	a5,a5,-1000 # 8000b5e8 <_ZTV7WorkerD+0x10>
    800039d8:	00f53023          	sd	a5,0(a0)
    800039dc:	ffffe097          	auipc	ra,0xffffe
    800039e0:	428080e7          	jalr	1064(ra) # 80001e04 <_ZN6ThreadD1Ev>
    800039e4:	00048513          	mv	a0,s1
    800039e8:	ffffe097          	auipc	ra,0xffffe
    800039ec:	cec080e7          	jalr	-788(ra) # 800016d4 <_ZdlPv>
    800039f0:	01813083          	ld	ra,24(sp)
    800039f4:	01013403          	ld	s0,16(sp)
    800039f8:	00813483          	ld	s1,8(sp)
    800039fc:	02010113          	addi	sp,sp,32
    80003a00:	00008067          	ret

0000000080003a04 <_ZN7WorkerA3runEv>:
    void run() override {
    80003a04:	ff010113          	addi	sp,sp,-16
    80003a08:	00113423          	sd	ra,8(sp)
    80003a0c:	00813023          	sd	s0,0(sp)
    80003a10:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003a14:	00000593          	li	a1,0
    80003a18:	fffff097          	auipc	ra,0xfffff
    80003a1c:	774080e7          	jalr	1908(ra) # 8000318c <_ZN7WorkerA11workerBodyAEPv>
    }
    80003a20:	00813083          	ld	ra,8(sp)
    80003a24:	00013403          	ld	s0,0(sp)
    80003a28:	01010113          	addi	sp,sp,16
    80003a2c:	00008067          	ret

0000000080003a30 <_ZN7WorkerB3runEv>:
    void run() override {
    80003a30:	ff010113          	addi	sp,sp,-16
    80003a34:	00113423          	sd	ra,8(sp)
    80003a38:	00813023          	sd	s0,0(sp)
    80003a3c:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003a40:	00000593          	li	a1,0
    80003a44:	00000097          	auipc	ra,0x0
    80003a48:	814080e7          	jalr	-2028(ra) # 80003258 <_ZN7WorkerB11workerBodyBEPv>
    }
    80003a4c:	00813083          	ld	ra,8(sp)
    80003a50:	00013403          	ld	s0,0(sp)
    80003a54:	01010113          	addi	sp,sp,16
    80003a58:	00008067          	ret

0000000080003a5c <_ZN7WorkerC3runEv>:
    void run() override {
    80003a5c:	ff010113          	addi	sp,sp,-16
    80003a60:	00113423          	sd	ra,8(sp)
    80003a64:	00813023          	sd	s0,0(sp)
    80003a68:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003a6c:	00000593          	li	a1,0
    80003a70:	00000097          	auipc	ra,0x0
    80003a74:	8bc080e7          	jalr	-1860(ra) # 8000332c <_ZN7WorkerC11workerBodyCEPv>
    }
    80003a78:	00813083          	ld	ra,8(sp)
    80003a7c:	00013403          	ld	s0,0(sp)
    80003a80:	01010113          	addi	sp,sp,16
    80003a84:	00008067          	ret

0000000080003a88 <_ZN7WorkerD3runEv>:
    void run() override {
    80003a88:	ff010113          	addi	sp,sp,-16
    80003a8c:	00113423          	sd	ra,8(sp)
    80003a90:	00813023          	sd	s0,0(sp)
    80003a94:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80003a98:	00000593          	li	a1,0
    80003a9c:	00000097          	auipc	ra,0x0
    80003aa0:	a10080e7          	jalr	-1520(ra) # 800034ac <_ZN7WorkerD11workerBodyDEPv>
    }
    80003aa4:	00813083          	ld	ra,8(sp)
    80003aa8:	00013403          	ld	s0,0(sp)
    80003aac:	01010113          	addi	sp,sp,16
    80003ab0:	00008067          	ret

0000000080003ab4 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80003ab4:	f8010113          	addi	sp,sp,-128
    80003ab8:	06113c23          	sd	ra,120(sp)
    80003abc:	06813823          	sd	s0,112(sp)
    80003ac0:	06913423          	sd	s1,104(sp)
    80003ac4:	07213023          	sd	s2,96(sp)
    80003ac8:	05313c23          	sd	s3,88(sp)
    80003acc:	05413823          	sd	s4,80(sp)
    80003ad0:	05513423          	sd	s5,72(sp)
    80003ad4:	05613023          	sd	s6,64(sp)
    80003ad8:	03713c23          	sd	s7,56(sp)
    80003adc:	03813823          	sd	s8,48(sp)
    80003ae0:	03913423          	sd	s9,40(sp)
    80003ae4:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80003ae8:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80003aec:	00005517          	auipc	a0,0x5
    80003af0:	70c50513          	addi	a0,a0,1804 # 800091f8 <CONSOLE_STATUS+0x1e8>
    80003af4:	00001097          	auipc	ra,0x1
    80003af8:	5a8080e7          	jalr	1448(ra) # 8000509c <_Z11printStringPKc>
    getString(input, 30);
    80003afc:	01e00593          	li	a1,30
    80003b00:	f8040493          	addi	s1,s0,-128
    80003b04:	00048513          	mv	a0,s1
    80003b08:	00001097          	auipc	ra,0x1
    80003b0c:	61c080e7          	jalr	1564(ra) # 80005124 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003b10:	00048513          	mv	a0,s1
    80003b14:	00001097          	auipc	ra,0x1
    80003b18:	6e8080e7          	jalr	1768(ra) # 800051fc <_Z11stringToIntPKc>
    80003b1c:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80003b20:	00005517          	auipc	a0,0x5
    80003b24:	6f850513          	addi	a0,a0,1784 # 80009218 <CONSOLE_STATUS+0x208>
    80003b28:	00001097          	auipc	ra,0x1
    80003b2c:	574080e7          	jalr	1396(ra) # 8000509c <_Z11printStringPKc>
    getString(input, 30);
    80003b30:	01e00593          	li	a1,30
    80003b34:	00048513          	mv	a0,s1
    80003b38:	00001097          	auipc	ra,0x1
    80003b3c:	5ec080e7          	jalr	1516(ra) # 80005124 <_Z9getStringPci>
    n = stringToInt(input);
    80003b40:	00048513          	mv	a0,s1
    80003b44:	00001097          	auipc	ra,0x1
    80003b48:	6b8080e7          	jalr	1720(ra) # 800051fc <_Z11stringToIntPKc>
    80003b4c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003b50:	00005517          	auipc	a0,0x5
    80003b54:	6e850513          	addi	a0,a0,1768 # 80009238 <CONSOLE_STATUS+0x228>
    80003b58:	00001097          	auipc	ra,0x1
    80003b5c:	544080e7          	jalr	1348(ra) # 8000509c <_Z11printStringPKc>
    printInt(threadNum);
    80003b60:	00000613          	li	a2,0
    80003b64:	00a00593          	li	a1,10
    80003b68:	00098513          	mv	a0,s3
    80003b6c:	00001097          	auipc	ra,0x1
    80003b70:	6e0080e7          	jalr	1760(ra) # 8000524c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003b74:	00005517          	auipc	a0,0x5
    80003b78:	6dc50513          	addi	a0,a0,1756 # 80009250 <CONSOLE_STATUS+0x240>
    80003b7c:	00001097          	auipc	ra,0x1
    80003b80:	520080e7          	jalr	1312(ra) # 8000509c <_Z11printStringPKc>
    printInt(n);
    80003b84:	00000613          	li	a2,0
    80003b88:	00a00593          	li	a1,10
    80003b8c:	00048513          	mv	a0,s1
    80003b90:	00001097          	auipc	ra,0x1
    80003b94:	6bc080e7          	jalr	1724(ra) # 8000524c <_Z8printIntiii>
    printString(".\n");
    80003b98:	00005517          	auipc	a0,0x5
    80003b9c:	6d050513          	addi	a0,a0,1744 # 80009268 <CONSOLE_STATUS+0x258>
    80003ba0:	00001097          	auipc	ra,0x1
    80003ba4:	4fc080e7          	jalr	1276(ra) # 8000509c <_Z11printStringPKc>
    if (threadNum > n) {
    80003ba8:	0334c463          	blt	s1,s3,80003bd0 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80003bac:	03305c63          	blez	s3,80003be4 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80003bb0:	03800513          	li	a0,56
    80003bb4:	ffffe097          	auipc	ra,0xffffe
    80003bb8:	ad0080e7          	jalr	-1328(ra) # 80001684 <_Znwm>
    80003bbc:	00050a93          	mv	s5,a0
    80003bc0:	00048593          	mv	a1,s1
    80003bc4:	00001097          	auipc	ra,0x1
    80003bc8:	7a8080e7          	jalr	1960(ra) # 8000536c <_ZN9BufferCPPC1Ei>
    80003bcc:	0300006f          	j	80003bfc <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003bd0:	00005517          	auipc	a0,0x5
    80003bd4:	6a050513          	addi	a0,a0,1696 # 80009270 <CONSOLE_STATUS+0x260>
    80003bd8:	00001097          	auipc	ra,0x1
    80003bdc:	4c4080e7          	jalr	1220(ra) # 8000509c <_Z11printStringPKc>
        return;
    80003be0:	0140006f          	j	80003bf4 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003be4:	00005517          	auipc	a0,0x5
    80003be8:	6cc50513          	addi	a0,a0,1740 # 800092b0 <CONSOLE_STATUS+0x2a0>
    80003bec:	00001097          	auipc	ra,0x1
    80003bf0:	4b0080e7          	jalr	1200(ra) # 8000509c <_Z11printStringPKc>
        return;
    80003bf4:	000c0113          	mv	sp,s8
    80003bf8:	2140006f          	j	80003e0c <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80003bfc:	01000513          	li	a0,16
    80003c00:	ffffe097          	auipc	ra,0xffffe
    80003c04:	a84080e7          	jalr	-1404(ra) # 80001684 <_Znwm>
    80003c08:	00050913          	mv	s2,a0
    80003c0c:	00000593          	li	a1,0
    80003c10:	ffffe097          	auipc	ra,0xffffe
    80003c14:	46c080e7          	jalr	1132(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    80003c18:	00008797          	auipc	a5,0x8
    80003c1c:	bd27b823          	sd	s2,-1072(a5) # 8000b7e8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80003c20:	00399793          	slli	a5,s3,0x3
    80003c24:	00f78793          	addi	a5,a5,15
    80003c28:	ff07f793          	andi	a5,a5,-16
    80003c2c:	40f10133          	sub	sp,sp,a5
    80003c30:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80003c34:	0019871b          	addiw	a4,s3,1
    80003c38:	00171793          	slli	a5,a4,0x1
    80003c3c:	00e787b3          	add	a5,a5,a4
    80003c40:	00379793          	slli	a5,a5,0x3
    80003c44:	00f78793          	addi	a5,a5,15
    80003c48:	ff07f793          	andi	a5,a5,-16
    80003c4c:	40f10133          	sub	sp,sp,a5
    80003c50:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80003c54:	00199493          	slli	s1,s3,0x1
    80003c58:	013484b3          	add	s1,s1,s3
    80003c5c:	00349493          	slli	s1,s1,0x3
    80003c60:	009b04b3          	add	s1,s6,s1
    80003c64:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80003c68:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80003c6c:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80003c70:	02800513          	li	a0,40
    80003c74:	ffffe097          	auipc	ra,0xffffe
    80003c78:	a10080e7          	jalr	-1520(ra) # 80001684 <_Znwm>
    80003c7c:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80003c80:	ffffe097          	auipc	ra,0xffffe
    80003c84:	340080e7          	jalr	832(ra) # 80001fc0 <_ZN6ThreadC1Ev>
    80003c88:	00008797          	auipc	a5,0x8
    80003c8c:	9d878793          	addi	a5,a5,-1576 # 8000b660 <_ZTV8Consumer+0x10>
    80003c90:	00fbb023          	sd	a5,0(s7)
    80003c94:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80003c98:	000b8513          	mv	a0,s7
    80003c9c:	ffffe097          	auipc	ra,0xffffe
    80003ca0:	2f4080e7          	jalr	756(ra) # 80001f90 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80003ca4:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80003ca8:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80003cac:	00008797          	auipc	a5,0x8
    80003cb0:	b3c7b783          	ld	a5,-1220(a5) # 8000b7e8 <_ZL10waitForAll>
    80003cb4:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80003cb8:	02800513          	li	a0,40
    80003cbc:	ffffe097          	auipc	ra,0xffffe
    80003cc0:	9c8080e7          	jalr	-1592(ra) # 80001684 <_Znwm>
    80003cc4:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80003cc8:	ffffe097          	auipc	ra,0xffffe
    80003ccc:	2f8080e7          	jalr	760(ra) # 80001fc0 <_ZN6ThreadC1Ev>
    80003cd0:	00008797          	auipc	a5,0x8
    80003cd4:	94078793          	addi	a5,a5,-1728 # 8000b610 <_ZTV16ProducerKeyborad+0x10>
    80003cd8:	00f4b023          	sd	a5,0(s1)
    80003cdc:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80003ce0:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80003ce4:	00048513          	mv	a0,s1
    80003ce8:	ffffe097          	auipc	ra,0xffffe
    80003cec:	2a8080e7          	jalr	680(ra) # 80001f90 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80003cf0:	00100913          	li	s2,1
    80003cf4:	0300006f          	j	80003d24 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80003cf8:	00008797          	auipc	a5,0x8
    80003cfc:	94078793          	addi	a5,a5,-1728 # 8000b638 <_ZTV8Producer+0x10>
    80003d00:	00fcb023          	sd	a5,0(s9)
    80003d04:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80003d08:	00391793          	slli	a5,s2,0x3
    80003d0c:	00fa07b3          	add	a5,s4,a5
    80003d10:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80003d14:	000c8513          	mv	a0,s9
    80003d18:	ffffe097          	auipc	ra,0xffffe
    80003d1c:	278080e7          	jalr	632(ra) # 80001f90 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80003d20:	0019091b          	addiw	s2,s2,1
    80003d24:	05395263          	bge	s2,s3,80003d68 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80003d28:	00191493          	slli	s1,s2,0x1
    80003d2c:	012484b3          	add	s1,s1,s2
    80003d30:	00349493          	slli	s1,s1,0x3
    80003d34:	009b04b3          	add	s1,s6,s1
    80003d38:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80003d3c:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80003d40:	00008797          	auipc	a5,0x8
    80003d44:	aa87b783          	ld	a5,-1368(a5) # 8000b7e8 <_ZL10waitForAll>
    80003d48:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80003d4c:	02800513          	li	a0,40
    80003d50:	ffffe097          	auipc	ra,0xffffe
    80003d54:	934080e7          	jalr	-1740(ra) # 80001684 <_Znwm>
    80003d58:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80003d5c:	ffffe097          	auipc	ra,0xffffe
    80003d60:	264080e7          	jalr	612(ra) # 80001fc0 <_ZN6ThreadC1Ev>
    80003d64:	f95ff06f          	j	80003cf8 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80003d68:	ffffe097          	auipc	ra,0xffffe
    80003d6c:	1c8080e7          	jalr	456(ra) # 80001f30 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80003d70:	00000493          	li	s1,0
    80003d74:	0099ce63          	blt	s3,s1,80003d90 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80003d78:	00008517          	auipc	a0,0x8
    80003d7c:	a7053503          	ld	a0,-1424(a0) # 8000b7e8 <_ZL10waitForAll>
    80003d80:	ffffe097          	auipc	ra,0xffffe
    80003d84:	334080e7          	jalr	820(ra) # 800020b4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80003d88:	0014849b          	addiw	s1,s1,1
    80003d8c:	fe9ff06f          	j	80003d74 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80003d90:	00008517          	auipc	a0,0x8
    80003d94:	a5853503          	ld	a0,-1448(a0) # 8000b7e8 <_ZL10waitForAll>
    80003d98:	00050863          	beqz	a0,80003da8 <_Z20testConsumerProducerv+0x2f4>
    80003d9c:	00053783          	ld	a5,0(a0)
    80003da0:	0087b783          	ld	a5,8(a5)
    80003da4:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80003da8:	00000493          	li	s1,0
    80003dac:	0080006f          	j	80003db4 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80003db0:	0014849b          	addiw	s1,s1,1
    80003db4:	0334d263          	bge	s1,s3,80003dd8 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80003db8:	00349793          	slli	a5,s1,0x3
    80003dbc:	00fa07b3          	add	a5,s4,a5
    80003dc0:	0007b503          	ld	a0,0(a5)
    80003dc4:	fe0506e3          	beqz	a0,80003db0 <_Z20testConsumerProducerv+0x2fc>
    80003dc8:	00053783          	ld	a5,0(a0)
    80003dcc:	0087b783          	ld	a5,8(a5)
    80003dd0:	000780e7          	jalr	a5
    80003dd4:	fddff06f          	j	80003db0 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80003dd8:	000b8a63          	beqz	s7,80003dec <_Z20testConsumerProducerv+0x338>
    80003ddc:	000bb783          	ld	a5,0(s7)
    80003de0:	0087b783          	ld	a5,8(a5)
    80003de4:	000b8513          	mv	a0,s7
    80003de8:	000780e7          	jalr	a5
    delete buffer;
    80003dec:	000a8e63          	beqz	s5,80003e08 <_Z20testConsumerProducerv+0x354>
    80003df0:	000a8513          	mv	a0,s5
    80003df4:	00002097          	auipc	ra,0x2
    80003df8:	870080e7          	jalr	-1936(ra) # 80005664 <_ZN9BufferCPPD1Ev>
    80003dfc:	000a8513          	mv	a0,s5
    80003e00:	ffffe097          	auipc	ra,0xffffe
    80003e04:	8d4080e7          	jalr	-1836(ra) # 800016d4 <_ZdlPv>
    80003e08:	000c0113          	mv	sp,s8
}
    80003e0c:	f8040113          	addi	sp,s0,-128
    80003e10:	07813083          	ld	ra,120(sp)
    80003e14:	07013403          	ld	s0,112(sp)
    80003e18:	06813483          	ld	s1,104(sp)
    80003e1c:	06013903          	ld	s2,96(sp)
    80003e20:	05813983          	ld	s3,88(sp)
    80003e24:	05013a03          	ld	s4,80(sp)
    80003e28:	04813a83          	ld	s5,72(sp)
    80003e2c:	04013b03          	ld	s6,64(sp)
    80003e30:	03813b83          	ld	s7,56(sp)
    80003e34:	03013c03          	ld	s8,48(sp)
    80003e38:	02813c83          	ld	s9,40(sp)
    80003e3c:	08010113          	addi	sp,sp,128
    80003e40:	00008067          	ret
    80003e44:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80003e48:	000a8513          	mv	a0,s5
    80003e4c:	ffffe097          	auipc	ra,0xffffe
    80003e50:	888080e7          	jalr	-1912(ra) # 800016d4 <_ZdlPv>
    80003e54:	00048513          	mv	a0,s1
    80003e58:	00009097          	auipc	ra,0x9
    80003e5c:	a90080e7          	jalr	-1392(ra) # 8000c8e8 <_Unwind_Resume>
    80003e60:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80003e64:	00090513          	mv	a0,s2
    80003e68:	ffffe097          	auipc	ra,0xffffe
    80003e6c:	86c080e7          	jalr	-1940(ra) # 800016d4 <_ZdlPv>
    80003e70:	00048513          	mv	a0,s1
    80003e74:	00009097          	auipc	ra,0x9
    80003e78:	a74080e7          	jalr	-1420(ra) # 8000c8e8 <_Unwind_Resume>
    80003e7c:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80003e80:	000b8513          	mv	a0,s7
    80003e84:	ffffe097          	auipc	ra,0xffffe
    80003e88:	850080e7          	jalr	-1968(ra) # 800016d4 <_ZdlPv>
    80003e8c:	00048513          	mv	a0,s1
    80003e90:	00009097          	auipc	ra,0x9
    80003e94:	a58080e7          	jalr	-1448(ra) # 8000c8e8 <_Unwind_Resume>
    80003e98:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80003e9c:	00048513          	mv	a0,s1
    80003ea0:	ffffe097          	auipc	ra,0xffffe
    80003ea4:	834080e7          	jalr	-1996(ra) # 800016d4 <_ZdlPv>
    80003ea8:	00090513          	mv	a0,s2
    80003eac:	00009097          	auipc	ra,0x9
    80003eb0:	a3c080e7          	jalr	-1476(ra) # 8000c8e8 <_Unwind_Resume>
    80003eb4:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80003eb8:	000c8513          	mv	a0,s9
    80003ebc:	ffffe097          	auipc	ra,0xffffe
    80003ec0:	818080e7          	jalr	-2024(ra) # 800016d4 <_ZdlPv>
    80003ec4:	00048513          	mv	a0,s1
    80003ec8:	00009097          	auipc	ra,0x9
    80003ecc:	a20080e7          	jalr	-1504(ra) # 8000c8e8 <_Unwind_Resume>

0000000080003ed0 <_ZN8Consumer3runEv>:
    void run() override {
    80003ed0:	fd010113          	addi	sp,sp,-48
    80003ed4:	02113423          	sd	ra,40(sp)
    80003ed8:	02813023          	sd	s0,32(sp)
    80003edc:	00913c23          	sd	s1,24(sp)
    80003ee0:	01213823          	sd	s2,16(sp)
    80003ee4:	01313423          	sd	s3,8(sp)
    80003ee8:	03010413          	addi	s0,sp,48
    80003eec:	00050913          	mv	s2,a0
        int i = 0;
    80003ef0:	00000993          	li	s3,0
    80003ef4:	0100006f          	j	80003f04 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80003ef8:	00a00513          	li	a0,10
    80003efc:	ffffe097          	auipc	ra,0xffffe
    80003f00:	258080e7          	jalr	600(ra) # 80002154 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80003f04:	00008797          	auipc	a5,0x8
    80003f08:	8dc7a783          	lw	a5,-1828(a5) # 8000b7e0 <_ZL9threadEnd>
    80003f0c:	04079a63          	bnez	a5,80003f60 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80003f10:	02093783          	ld	a5,32(s2)
    80003f14:	0087b503          	ld	a0,8(a5)
    80003f18:	00001097          	auipc	ra,0x1
    80003f1c:	638080e7          	jalr	1592(ra) # 80005550 <_ZN9BufferCPP3getEv>
            i++;
    80003f20:	0019849b          	addiw	s1,s3,1
    80003f24:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80003f28:	0ff57513          	andi	a0,a0,255
    80003f2c:	ffffe097          	auipc	ra,0xffffe
    80003f30:	228080e7          	jalr	552(ra) # 80002154 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80003f34:	05000793          	li	a5,80
    80003f38:	02f4e4bb          	remw	s1,s1,a5
    80003f3c:	fc0494e3          	bnez	s1,80003f04 <_ZN8Consumer3runEv+0x34>
    80003f40:	fb9ff06f          	j	80003ef8 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80003f44:	02093783          	ld	a5,32(s2)
    80003f48:	0087b503          	ld	a0,8(a5)
    80003f4c:	00001097          	auipc	ra,0x1
    80003f50:	604080e7          	jalr	1540(ra) # 80005550 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80003f54:	0ff57513          	andi	a0,a0,255
    80003f58:	ffffe097          	auipc	ra,0xffffe
    80003f5c:	1fc080e7          	jalr	508(ra) # 80002154 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80003f60:	02093783          	ld	a5,32(s2)
    80003f64:	0087b503          	ld	a0,8(a5)
    80003f68:	00001097          	auipc	ra,0x1
    80003f6c:	674080e7          	jalr	1652(ra) # 800055dc <_ZN9BufferCPP6getCntEv>
    80003f70:	fca04ae3          	bgtz	a0,80003f44 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80003f74:	02093783          	ld	a5,32(s2)
    80003f78:	0107b503          	ld	a0,16(a5)
    80003f7c:	ffffe097          	auipc	ra,0xffffe
    80003f80:	164080e7          	jalr	356(ra) # 800020e0 <_ZN9Semaphore6signalEv>
    }
    80003f84:	02813083          	ld	ra,40(sp)
    80003f88:	02013403          	ld	s0,32(sp)
    80003f8c:	01813483          	ld	s1,24(sp)
    80003f90:	01013903          	ld	s2,16(sp)
    80003f94:	00813983          	ld	s3,8(sp)
    80003f98:	03010113          	addi	sp,sp,48
    80003f9c:	00008067          	ret

0000000080003fa0 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80003fa0:	ff010113          	addi	sp,sp,-16
    80003fa4:	00113423          	sd	ra,8(sp)
    80003fa8:	00813023          	sd	s0,0(sp)
    80003fac:	01010413          	addi	s0,sp,16
    80003fb0:	00007797          	auipc	a5,0x7
    80003fb4:	6b078793          	addi	a5,a5,1712 # 8000b660 <_ZTV8Consumer+0x10>
    80003fb8:	00f53023          	sd	a5,0(a0)
    80003fbc:	ffffe097          	auipc	ra,0xffffe
    80003fc0:	e48080e7          	jalr	-440(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80003fc4:	00813083          	ld	ra,8(sp)
    80003fc8:	00013403          	ld	s0,0(sp)
    80003fcc:	01010113          	addi	sp,sp,16
    80003fd0:	00008067          	ret

0000000080003fd4 <_ZN8ConsumerD0Ev>:
    80003fd4:	fe010113          	addi	sp,sp,-32
    80003fd8:	00113c23          	sd	ra,24(sp)
    80003fdc:	00813823          	sd	s0,16(sp)
    80003fe0:	00913423          	sd	s1,8(sp)
    80003fe4:	02010413          	addi	s0,sp,32
    80003fe8:	00050493          	mv	s1,a0
    80003fec:	00007797          	auipc	a5,0x7
    80003ff0:	67478793          	addi	a5,a5,1652 # 8000b660 <_ZTV8Consumer+0x10>
    80003ff4:	00f53023          	sd	a5,0(a0)
    80003ff8:	ffffe097          	auipc	ra,0xffffe
    80003ffc:	e0c080e7          	jalr	-500(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80004000:	00048513          	mv	a0,s1
    80004004:	ffffd097          	auipc	ra,0xffffd
    80004008:	6d0080e7          	jalr	1744(ra) # 800016d4 <_ZdlPv>
    8000400c:	01813083          	ld	ra,24(sp)
    80004010:	01013403          	ld	s0,16(sp)
    80004014:	00813483          	ld	s1,8(sp)
    80004018:	02010113          	addi	sp,sp,32
    8000401c:	00008067          	ret

0000000080004020 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004020:	ff010113          	addi	sp,sp,-16
    80004024:	00113423          	sd	ra,8(sp)
    80004028:	00813023          	sd	s0,0(sp)
    8000402c:	01010413          	addi	s0,sp,16
    80004030:	00007797          	auipc	a5,0x7
    80004034:	5e078793          	addi	a5,a5,1504 # 8000b610 <_ZTV16ProducerKeyborad+0x10>
    80004038:	00f53023          	sd	a5,0(a0)
    8000403c:	ffffe097          	auipc	ra,0xffffe
    80004040:	dc8080e7          	jalr	-568(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80004044:	00813083          	ld	ra,8(sp)
    80004048:	00013403          	ld	s0,0(sp)
    8000404c:	01010113          	addi	sp,sp,16
    80004050:	00008067          	ret

0000000080004054 <_ZN16ProducerKeyboradD0Ev>:
    80004054:	fe010113          	addi	sp,sp,-32
    80004058:	00113c23          	sd	ra,24(sp)
    8000405c:	00813823          	sd	s0,16(sp)
    80004060:	00913423          	sd	s1,8(sp)
    80004064:	02010413          	addi	s0,sp,32
    80004068:	00050493          	mv	s1,a0
    8000406c:	00007797          	auipc	a5,0x7
    80004070:	5a478793          	addi	a5,a5,1444 # 8000b610 <_ZTV16ProducerKeyborad+0x10>
    80004074:	00f53023          	sd	a5,0(a0)
    80004078:	ffffe097          	auipc	ra,0xffffe
    8000407c:	d8c080e7          	jalr	-628(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80004080:	00048513          	mv	a0,s1
    80004084:	ffffd097          	auipc	ra,0xffffd
    80004088:	650080e7          	jalr	1616(ra) # 800016d4 <_ZdlPv>
    8000408c:	01813083          	ld	ra,24(sp)
    80004090:	01013403          	ld	s0,16(sp)
    80004094:	00813483          	ld	s1,8(sp)
    80004098:	02010113          	addi	sp,sp,32
    8000409c:	00008067          	ret

00000000800040a0 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    800040a0:	ff010113          	addi	sp,sp,-16
    800040a4:	00113423          	sd	ra,8(sp)
    800040a8:	00813023          	sd	s0,0(sp)
    800040ac:	01010413          	addi	s0,sp,16
    800040b0:	00007797          	auipc	a5,0x7
    800040b4:	58878793          	addi	a5,a5,1416 # 8000b638 <_ZTV8Producer+0x10>
    800040b8:	00f53023          	sd	a5,0(a0)
    800040bc:	ffffe097          	auipc	ra,0xffffe
    800040c0:	d48080e7          	jalr	-696(ra) # 80001e04 <_ZN6ThreadD1Ev>
    800040c4:	00813083          	ld	ra,8(sp)
    800040c8:	00013403          	ld	s0,0(sp)
    800040cc:	01010113          	addi	sp,sp,16
    800040d0:	00008067          	ret

00000000800040d4 <_ZN8ProducerD0Ev>:
    800040d4:	fe010113          	addi	sp,sp,-32
    800040d8:	00113c23          	sd	ra,24(sp)
    800040dc:	00813823          	sd	s0,16(sp)
    800040e0:	00913423          	sd	s1,8(sp)
    800040e4:	02010413          	addi	s0,sp,32
    800040e8:	00050493          	mv	s1,a0
    800040ec:	00007797          	auipc	a5,0x7
    800040f0:	54c78793          	addi	a5,a5,1356 # 8000b638 <_ZTV8Producer+0x10>
    800040f4:	00f53023          	sd	a5,0(a0)
    800040f8:	ffffe097          	auipc	ra,0xffffe
    800040fc:	d0c080e7          	jalr	-756(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80004100:	00048513          	mv	a0,s1
    80004104:	ffffd097          	auipc	ra,0xffffd
    80004108:	5d0080e7          	jalr	1488(ra) # 800016d4 <_ZdlPv>
    8000410c:	01813083          	ld	ra,24(sp)
    80004110:	01013403          	ld	s0,16(sp)
    80004114:	00813483          	ld	s1,8(sp)
    80004118:	02010113          	addi	sp,sp,32
    8000411c:	00008067          	ret

0000000080004120 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004120:	fe010113          	addi	sp,sp,-32
    80004124:	00113c23          	sd	ra,24(sp)
    80004128:	00813823          	sd	s0,16(sp)
    8000412c:	00913423          	sd	s1,8(sp)
    80004130:	02010413          	addi	s0,sp,32
    80004134:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004138:	ffffd097          	auipc	ra,0xffffd
    8000413c:	47c080e7          	jalr	1148(ra) # 800015b4 <_Z4getcv>
    80004140:	0005059b          	sext.w	a1,a0
    80004144:	01b00793          	li	a5,27
    80004148:	00f58c63          	beq	a1,a5,80004160 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    8000414c:	0204b783          	ld	a5,32(s1)
    80004150:	0087b503          	ld	a0,8(a5)
    80004154:	00001097          	auipc	ra,0x1
    80004158:	36c080e7          	jalr	876(ra) # 800054c0 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    8000415c:	fddff06f          	j	80004138 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004160:	00100793          	li	a5,1
    80004164:	00007717          	auipc	a4,0x7
    80004168:	66f72e23          	sw	a5,1660(a4) # 8000b7e0 <_ZL9threadEnd>
        td->buffer->put('!');
    8000416c:	0204b783          	ld	a5,32(s1)
    80004170:	02100593          	li	a1,33
    80004174:	0087b503          	ld	a0,8(a5)
    80004178:	00001097          	auipc	ra,0x1
    8000417c:	348080e7          	jalr	840(ra) # 800054c0 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004180:	0204b783          	ld	a5,32(s1)
    80004184:	0107b503          	ld	a0,16(a5)
    80004188:	ffffe097          	auipc	ra,0xffffe
    8000418c:	f58080e7          	jalr	-168(ra) # 800020e0 <_ZN9Semaphore6signalEv>
    }
    80004190:	01813083          	ld	ra,24(sp)
    80004194:	01013403          	ld	s0,16(sp)
    80004198:	00813483          	ld	s1,8(sp)
    8000419c:	02010113          	addi	sp,sp,32
    800041a0:	00008067          	ret

00000000800041a4 <_ZN8Producer3runEv>:
    void run() override {
    800041a4:	fe010113          	addi	sp,sp,-32
    800041a8:	00113c23          	sd	ra,24(sp)
    800041ac:	00813823          	sd	s0,16(sp)
    800041b0:	00913423          	sd	s1,8(sp)
    800041b4:	01213023          	sd	s2,0(sp)
    800041b8:	02010413          	addi	s0,sp,32
    800041bc:	00050493          	mv	s1,a0
        int i = 0;
    800041c0:	00000913          	li	s2,0
        while (!threadEnd) {
    800041c4:	00007797          	auipc	a5,0x7
    800041c8:	61c7a783          	lw	a5,1564(a5) # 8000b7e0 <_ZL9threadEnd>
    800041cc:	04079263          	bnez	a5,80004210 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800041d0:	0204b783          	ld	a5,32(s1)
    800041d4:	0007a583          	lw	a1,0(a5)
    800041d8:	0305859b          	addiw	a1,a1,48
    800041dc:	0087b503          	ld	a0,8(a5)
    800041e0:	00001097          	auipc	ra,0x1
    800041e4:	2e0080e7          	jalr	736(ra) # 800054c0 <_ZN9BufferCPP3putEi>
            i++;
    800041e8:	0019071b          	addiw	a4,s2,1
    800041ec:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800041f0:	0204b783          	ld	a5,32(s1)
    800041f4:	0007a783          	lw	a5,0(a5)
    800041f8:	00e787bb          	addw	a5,a5,a4
    800041fc:	00500513          	li	a0,5
    80004200:	02a7e53b          	remw	a0,a5,a0
    80004204:	ffffe097          	auipc	ra,0xffffe
    80004208:	e00080e7          	jalr	-512(ra) # 80002004 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    8000420c:	fb9ff06f          	j	800041c4 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004210:	0204b783          	ld	a5,32(s1)
    80004214:	0107b503          	ld	a0,16(a5)
    80004218:	ffffe097          	auipc	ra,0xffffe
    8000421c:	ec8080e7          	jalr	-312(ra) # 800020e0 <_ZN9Semaphore6signalEv>
    }
    80004220:	01813083          	ld	ra,24(sp)
    80004224:	01013403          	ld	s0,16(sp)
    80004228:	00813483          	ld	s1,8(sp)
    8000422c:	00013903          	ld	s2,0(sp)
    80004230:	02010113          	addi	sp,sp,32
    80004234:	00008067          	ret

0000000080004238 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004238:	fe010113          	addi	sp,sp,-32
    8000423c:	00113c23          	sd	ra,24(sp)
    80004240:	00813823          	sd	s0,16(sp)
    80004244:	00913423          	sd	s1,8(sp)
    80004248:	01213023          	sd	s2,0(sp)
    8000424c:	02010413          	addi	s0,sp,32
    80004250:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004254:	00100793          	li	a5,1
    80004258:	02a7f863          	bgeu	a5,a0,80004288 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000425c:	00a00793          	li	a5,10
    80004260:	02f577b3          	remu	a5,a0,a5
    80004264:	02078e63          	beqz	a5,800042a0 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004268:	fff48513          	addi	a0,s1,-1
    8000426c:	00000097          	auipc	ra,0x0
    80004270:	fcc080e7          	jalr	-52(ra) # 80004238 <_ZL9fibonaccim>
    80004274:	00050913          	mv	s2,a0
    80004278:	ffe48513          	addi	a0,s1,-2
    8000427c:	00000097          	auipc	ra,0x0
    80004280:	fbc080e7          	jalr	-68(ra) # 80004238 <_ZL9fibonaccim>
    80004284:	00a90533          	add	a0,s2,a0
}
    80004288:	01813083          	ld	ra,24(sp)
    8000428c:	01013403          	ld	s0,16(sp)
    80004290:	00813483          	ld	s1,8(sp)
    80004294:	00013903          	ld	s2,0(sp)
    80004298:	02010113          	addi	sp,sp,32
    8000429c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800042a0:	ffffd097          	auipc	ra,0xffffd
    800042a4:	214080e7          	jalr	532(ra) # 800014b4 <_Z15thread_dispatchv>
    800042a8:	fc1ff06f          	j	80004268 <_ZL9fibonaccim+0x30>

00000000800042ac <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800042ac:	fe010113          	addi	sp,sp,-32
    800042b0:	00113c23          	sd	ra,24(sp)
    800042b4:	00813823          	sd	s0,16(sp)
    800042b8:	00913423          	sd	s1,8(sp)
    800042bc:	01213023          	sd	s2,0(sp)
    800042c0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800042c4:	00a00493          	li	s1,10
    800042c8:	0400006f          	j	80004308 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800042cc:	00005517          	auipc	a0,0x5
    800042d0:	08450513          	addi	a0,a0,132 # 80009350 <CONSOLE_STATUS+0x340>
    800042d4:	00001097          	auipc	ra,0x1
    800042d8:	dc8080e7          	jalr	-568(ra) # 8000509c <_Z11printStringPKc>
    800042dc:	00000613          	li	a2,0
    800042e0:	00a00593          	li	a1,10
    800042e4:	00048513          	mv	a0,s1
    800042e8:	00001097          	auipc	ra,0x1
    800042ec:	f64080e7          	jalr	-156(ra) # 8000524c <_Z8printIntiii>
    800042f0:	00005517          	auipc	a0,0x5
    800042f4:	28050513          	addi	a0,a0,640 # 80009570 <CONSOLE_STATUS+0x560>
    800042f8:	00001097          	auipc	ra,0x1
    800042fc:	da4080e7          	jalr	-604(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004300:	0014849b          	addiw	s1,s1,1
    80004304:	0ff4f493          	andi	s1,s1,255
    80004308:	00c00793          	li	a5,12
    8000430c:	fc97f0e3          	bgeu	a5,s1,800042cc <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004310:	00005517          	auipc	a0,0x5
    80004314:	04850513          	addi	a0,a0,72 # 80009358 <CONSOLE_STATUS+0x348>
    80004318:	00001097          	auipc	ra,0x1
    8000431c:	d84080e7          	jalr	-636(ra) # 8000509c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004320:	00500313          	li	t1,5
    thread_dispatch();
    80004324:	ffffd097          	auipc	ra,0xffffd
    80004328:	190080e7          	jalr	400(ra) # 800014b4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000432c:	01000513          	li	a0,16
    80004330:	00000097          	auipc	ra,0x0
    80004334:	f08080e7          	jalr	-248(ra) # 80004238 <_ZL9fibonaccim>
    80004338:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000433c:	00005517          	auipc	a0,0x5
    80004340:	02c50513          	addi	a0,a0,44 # 80009368 <CONSOLE_STATUS+0x358>
    80004344:	00001097          	auipc	ra,0x1
    80004348:	d58080e7          	jalr	-680(ra) # 8000509c <_Z11printStringPKc>
    8000434c:	00000613          	li	a2,0
    80004350:	00a00593          	li	a1,10
    80004354:	0009051b          	sext.w	a0,s2
    80004358:	00001097          	auipc	ra,0x1
    8000435c:	ef4080e7          	jalr	-268(ra) # 8000524c <_Z8printIntiii>
    80004360:	00005517          	auipc	a0,0x5
    80004364:	21050513          	addi	a0,a0,528 # 80009570 <CONSOLE_STATUS+0x560>
    80004368:	00001097          	auipc	ra,0x1
    8000436c:	d34080e7          	jalr	-716(ra) # 8000509c <_Z11printStringPKc>
    80004370:	0400006f          	j	800043b0 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004374:	00005517          	auipc	a0,0x5
    80004378:	fdc50513          	addi	a0,a0,-36 # 80009350 <CONSOLE_STATUS+0x340>
    8000437c:	00001097          	auipc	ra,0x1
    80004380:	d20080e7          	jalr	-736(ra) # 8000509c <_Z11printStringPKc>
    80004384:	00000613          	li	a2,0
    80004388:	00a00593          	li	a1,10
    8000438c:	00048513          	mv	a0,s1
    80004390:	00001097          	auipc	ra,0x1
    80004394:	ebc080e7          	jalr	-324(ra) # 8000524c <_Z8printIntiii>
    80004398:	00005517          	auipc	a0,0x5
    8000439c:	1d850513          	addi	a0,a0,472 # 80009570 <CONSOLE_STATUS+0x560>
    800043a0:	00001097          	auipc	ra,0x1
    800043a4:	cfc080e7          	jalr	-772(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 16; i++) {
    800043a8:	0014849b          	addiw	s1,s1,1
    800043ac:	0ff4f493          	andi	s1,s1,255
    800043b0:	00f00793          	li	a5,15
    800043b4:	fc97f0e3          	bgeu	a5,s1,80004374 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800043b8:	00005517          	auipc	a0,0x5
    800043bc:	fc050513          	addi	a0,a0,-64 # 80009378 <CONSOLE_STATUS+0x368>
    800043c0:	00001097          	auipc	ra,0x1
    800043c4:	cdc080e7          	jalr	-804(ra) # 8000509c <_Z11printStringPKc>
    finishedD = true;
    800043c8:	00100793          	li	a5,1
    800043cc:	00007717          	auipc	a4,0x7
    800043d0:	42f70223          	sb	a5,1060(a4) # 8000b7f0 <_ZL9finishedD>
    thread_dispatch();
    800043d4:	ffffd097          	auipc	ra,0xffffd
    800043d8:	0e0080e7          	jalr	224(ra) # 800014b4 <_Z15thread_dispatchv>
}
    800043dc:	01813083          	ld	ra,24(sp)
    800043e0:	01013403          	ld	s0,16(sp)
    800043e4:	00813483          	ld	s1,8(sp)
    800043e8:	00013903          	ld	s2,0(sp)
    800043ec:	02010113          	addi	sp,sp,32
    800043f0:	00008067          	ret

00000000800043f4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800043f4:	fe010113          	addi	sp,sp,-32
    800043f8:	00113c23          	sd	ra,24(sp)
    800043fc:	00813823          	sd	s0,16(sp)
    80004400:	00913423          	sd	s1,8(sp)
    80004404:	01213023          	sd	s2,0(sp)
    80004408:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000440c:	00000493          	li	s1,0
    80004410:	0400006f          	j	80004450 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004414:	00005517          	auipc	a0,0x5
    80004418:	efc50513          	addi	a0,a0,-260 # 80009310 <CONSOLE_STATUS+0x300>
    8000441c:	00001097          	auipc	ra,0x1
    80004420:	c80080e7          	jalr	-896(ra) # 8000509c <_Z11printStringPKc>
    80004424:	00000613          	li	a2,0
    80004428:	00a00593          	li	a1,10
    8000442c:	00048513          	mv	a0,s1
    80004430:	00001097          	auipc	ra,0x1
    80004434:	e1c080e7          	jalr	-484(ra) # 8000524c <_Z8printIntiii>
    80004438:	00005517          	auipc	a0,0x5
    8000443c:	13850513          	addi	a0,a0,312 # 80009570 <CONSOLE_STATUS+0x560>
    80004440:	00001097          	auipc	ra,0x1
    80004444:	c5c080e7          	jalr	-932(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004448:	0014849b          	addiw	s1,s1,1
    8000444c:	0ff4f493          	andi	s1,s1,255
    80004450:	00200793          	li	a5,2
    80004454:	fc97f0e3          	bgeu	a5,s1,80004414 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004458:	00005517          	auipc	a0,0x5
    8000445c:	ec050513          	addi	a0,a0,-320 # 80009318 <CONSOLE_STATUS+0x308>
    80004460:	00001097          	auipc	ra,0x1
    80004464:	c3c080e7          	jalr	-964(ra) # 8000509c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004468:	00700313          	li	t1,7
    thread_dispatch();
    8000446c:	ffffd097          	auipc	ra,0xffffd
    80004470:	048080e7          	jalr	72(ra) # 800014b4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004474:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004478:	00005517          	auipc	a0,0x5
    8000447c:	eb050513          	addi	a0,a0,-336 # 80009328 <CONSOLE_STATUS+0x318>
    80004480:	00001097          	auipc	ra,0x1
    80004484:	c1c080e7          	jalr	-996(ra) # 8000509c <_Z11printStringPKc>
    80004488:	00000613          	li	a2,0
    8000448c:	00a00593          	li	a1,10
    80004490:	0009051b          	sext.w	a0,s2
    80004494:	00001097          	auipc	ra,0x1
    80004498:	db8080e7          	jalr	-584(ra) # 8000524c <_Z8printIntiii>
    8000449c:	00005517          	auipc	a0,0x5
    800044a0:	0d450513          	addi	a0,a0,212 # 80009570 <CONSOLE_STATUS+0x560>
    800044a4:	00001097          	auipc	ra,0x1
    800044a8:	bf8080e7          	jalr	-1032(ra) # 8000509c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800044ac:	00c00513          	li	a0,12
    800044b0:	00000097          	auipc	ra,0x0
    800044b4:	d88080e7          	jalr	-632(ra) # 80004238 <_ZL9fibonaccim>
    800044b8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800044bc:	00005517          	auipc	a0,0x5
    800044c0:	e7450513          	addi	a0,a0,-396 # 80009330 <CONSOLE_STATUS+0x320>
    800044c4:	00001097          	auipc	ra,0x1
    800044c8:	bd8080e7          	jalr	-1064(ra) # 8000509c <_Z11printStringPKc>
    800044cc:	00000613          	li	a2,0
    800044d0:	00a00593          	li	a1,10
    800044d4:	0009051b          	sext.w	a0,s2
    800044d8:	00001097          	auipc	ra,0x1
    800044dc:	d74080e7          	jalr	-652(ra) # 8000524c <_Z8printIntiii>
    800044e0:	00005517          	auipc	a0,0x5
    800044e4:	09050513          	addi	a0,a0,144 # 80009570 <CONSOLE_STATUS+0x560>
    800044e8:	00001097          	auipc	ra,0x1
    800044ec:	bb4080e7          	jalr	-1100(ra) # 8000509c <_Z11printStringPKc>
    800044f0:	0400006f          	j	80004530 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800044f4:	00005517          	auipc	a0,0x5
    800044f8:	e1c50513          	addi	a0,a0,-484 # 80009310 <CONSOLE_STATUS+0x300>
    800044fc:	00001097          	auipc	ra,0x1
    80004500:	ba0080e7          	jalr	-1120(ra) # 8000509c <_Z11printStringPKc>
    80004504:	00000613          	li	a2,0
    80004508:	00a00593          	li	a1,10
    8000450c:	00048513          	mv	a0,s1
    80004510:	00001097          	auipc	ra,0x1
    80004514:	d3c080e7          	jalr	-708(ra) # 8000524c <_Z8printIntiii>
    80004518:	00005517          	auipc	a0,0x5
    8000451c:	05850513          	addi	a0,a0,88 # 80009570 <CONSOLE_STATUS+0x560>
    80004520:	00001097          	auipc	ra,0x1
    80004524:	b7c080e7          	jalr	-1156(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004528:	0014849b          	addiw	s1,s1,1
    8000452c:	0ff4f493          	andi	s1,s1,255
    80004530:	00500793          	li	a5,5
    80004534:	fc97f0e3          	bgeu	a5,s1,800044f4 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004538:	00005517          	auipc	a0,0x5
    8000453c:	db050513          	addi	a0,a0,-592 # 800092e8 <CONSOLE_STATUS+0x2d8>
    80004540:	00001097          	auipc	ra,0x1
    80004544:	b5c080e7          	jalr	-1188(ra) # 8000509c <_Z11printStringPKc>
    finishedC = true;
    80004548:	00100793          	li	a5,1
    8000454c:	00007717          	auipc	a4,0x7
    80004550:	2af702a3          	sb	a5,677(a4) # 8000b7f1 <_ZL9finishedC>
    thread_dispatch();
    80004554:	ffffd097          	auipc	ra,0xffffd
    80004558:	f60080e7          	jalr	-160(ra) # 800014b4 <_Z15thread_dispatchv>
}
    8000455c:	01813083          	ld	ra,24(sp)
    80004560:	01013403          	ld	s0,16(sp)
    80004564:	00813483          	ld	s1,8(sp)
    80004568:	00013903          	ld	s2,0(sp)
    8000456c:	02010113          	addi	sp,sp,32
    80004570:	00008067          	ret

0000000080004574 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004574:	fe010113          	addi	sp,sp,-32
    80004578:	00113c23          	sd	ra,24(sp)
    8000457c:	00813823          	sd	s0,16(sp)
    80004580:	00913423          	sd	s1,8(sp)
    80004584:	01213023          	sd	s2,0(sp)
    80004588:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000458c:	00000913          	li	s2,0
    80004590:	0380006f          	j	800045c8 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004594:	ffffd097          	auipc	ra,0xffffd
    80004598:	f20080e7          	jalr	-224(ra) # 800014b4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000459c:	00148493          	addi	s1,s1,1
    800045a0:	000027b7          	lui	a5,0x2
    800045a4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800045a8:	0097ee63          	bltu	a5,s1,800045c4 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800045ac:	00000713          	li	a4,0
    800045b0:	000077b7          	lui	a5,0x7
    800045b4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800045b8:	fce7eee3          	bltu	a5,a4,80004594 <_ZL11workerBodyBPv+0x20>
    800045bc:	00170713          	addi	a4,a4,1
    800045c0:	ff1ff06f          	j	800045b0 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800045c4:	00190913          	addi	s2,s2,1
    800045c8:	00f00793          	li	a5,15
    800045cc:	0527e063          	bltu	a5,s2,8000460c <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800045d0:	00005517          	auipc	a0,0x5
    800045d4:	d2850513          	addi	a0,a0,-728 # 800092f8 <CONSOLE_STATUS+0x2e8>
    800045d8:	00001097          	auipc	ra,0x1
    800045dc:	ac4080e7          	jalr	-1340(ra) # 8000509c <_Z11printStringPKc>
    800045e0:	00000613          	li	a2,0
    800045e4:	00a00593          	li	a1,10
    800045e8:	0009051b          	sext.w	a0,s2
    800045ec:	00001097          	auipc	ra,0x1
    800045f0:	c60080e7          	jalr	-928(ra) # 8000524c <_Z8printIntiii>
    800045f4:	00005517          	auipc	a0,0x5
    800045f8:	f7c50513          	addi	a0,a0,-132 # 80009570 <CONSOLE_STATUS+0x560>
    800045fc:	00001097          	auipc	ra,0x1
    80004600:	aa0080e7          	jalr	-1376(ra) # 8000509c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004604:	00000493          	li	s1,0
    80004608:	f99ff06f          	j	800045a0 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    8000460c:	00005517          	auipc	a0,0x5
    80004610:	cf450513          	addi	a0,a0,-780 # 80009300 <CONSOLE_STATUS+0x2f0>
    80004614:	00001097          	auipc	ra,0x1
    80004618:	a88080e7          	jalr	-1400(ra) # 8000509c <_Z11printStringPKc>
    finishedB = true;
    8000461c:	00100793          	li	a5,1
    80004620:	00007717          	auipc	a4,0x7
    80004624:	1cf70923          	sb	a5,466(a4) # 8000b7f2 <_ZL9finishedB>
    thread_dispatch();
    80004628:	ffffd097          	auipc	ra,0xffffd
    8000462c:	e8c080e7          	jalr	-372(ra) # 800014b4 <_Z15thread_dispatchv>
}
    80004630:	01813083          	ld	ra,24(sp)
    80004634:	01013403          	ld	s0,16(sp)
    80004638:	00813483          	ld	s1,8(sp)
    8000463c:	00013903          	ld	s2,0(sp)
    80004640:	02010113          	addi	sp,sp,32
    80004644:	00008067          	ret

0000000080004648 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004648:	fe010113          	addi	sp,sp,-32
    8000464c:	00113c23          	sd	ra,24(sp)
    80004650:	00813823          	sd	s0,16(sp)
    80004654:	00913423          	sd	s1,8(sp)
    80004658:	01213023          	sd	s2,0(sp)
    8000465c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004660:	00000913          	li	s2,0
    80004664:	0380006f          	j	8000469c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004668:	ffffd097          	auipc	ra,0xffffd
    8000466c:	e4c080e7          	jalr	-436(ra) # 800014b4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004670:	00148493          	addi	s1,s1,1
    80004674:	000027b7          	lui	a5,0x2
    80004678:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000467c:	0097ee63          	bltu	a5,s1,80004698 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004680:	00000713          	li	a4,0
    80004684:	000077b7          	lui	a5,0x7
    80004688:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000468c:	fce7eee3          	bltu	a5,a4,80004668 <_ZL11workerBodyAPv+0x20>
    80004690:	00170713          	addi	a4,a4,1
    80004694:	ff1ff06f          	j	80004684 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004698:	00190913          	addi	s2,s2,1
    8000469c:	00900793          	li	a5,9
    800046a0:	0527e063          	bltu	a5,s2,800046e0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800046a4:	00005517          	auipc	a0,0x5
    800046a8:	c3c50513          	addi	a0,a0,-964 # 800092e0 <CONSOLE_STATUS+0x2d0>
    800046ac:	00001097          	auipc	ra,0x1
    800046b0:	9f0080e7          	jalr	-1552(ra) # 8000509c <_Z11printStringPKc>
    800046b4:	00000613          	li	a2,0
    800046b8:	00a00593          	li	a1,10
    800046bc:	0009051b          	sext.w	a0,s2
    800046c0:	00001097          	auipc	ra,0x1
    800046c4:	b8c080e7          	jalr	-1140(ra) # 8000524c <_Z8printIntiii>
    800046c8:	00005517          	auipc	a0,0x5
    800046cc:	ea850513          	addi	a0,a0,-344 # 80009570 <CONSOLE_STATUS+0x560>
    800046d0:	00001097          	auipc	ra,0x1
    800046d4:	9cc080e7          	jalr	-1588(ra) # 8000509c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800046d8:	00000493          	li	s1,0
    800046dc:	f99ff06f          	j	80004674 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800046e0:	00005517          	auipc	a0,0x5
    800046e4:	c0850513          	addi	a0,a0,-1016 # 800092e8 <CONSOLE_STATUS+0x2d8>
    800046e8:	00001097          	auipc	ra,0x1
    800046ec:	9b4080e7          	jalr	-1612(ra) # 8000509c <_Z11printStringPKc>
    finishedA = true;
    800046f0:	00100793          	li	a5,1
    800046f4:	00007717          	auipc	a4,0x7
    800046f8:	0ef70fa3          	sb	a5,255(a4) # 8000b7f3 <_ZL9finishedA>
}
    800046fc:	01813083          	ld	ra,24(sp)
    80004700:	01013403          	ld	s0,16(sp)
    80004704:	00813483          	ld	s1,8(sp)
    80004708:	00013903          	ld	s2,0(sp)
    8000470c:	02010113          	addi	sp,sp,32
    80004710:	00008067          	ret

0000000080004714 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004714:	fd010113          	addi	sp,sp,-48
    80004718:	02113423          	sd	ra,40(sp)
    8000471c:	02813023          	sd	s0,32(sp)
    80004720:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004724:	00000613          	li	a2,0
    80004728:	00000597          	auipc	a1,0x0
    8000472c:	f2058593          	addi	a1,a1,-224 # 80004648 <_ZL11workerBodyAPv>
    80004730:	fd040513          	addi	a0,s0,-48
    80004734:	ffffd097          	auipc	ra,0xffffd
    80004738:	d24080e7          	jalr	-732(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    8000473c:	00005517          	auipc	a0,0x5
    80004740:	c4c50513          	addi	a0,a0,-948 # 80009388 <CONSOLE_STATUS+0x378>
    80004744:	00001097          	auipc	ra,0x1
    80004748:	958080e7          	jalr	-1704(ra) # 8000509c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000474c:	00000613          	li	a2,0
    80004750:	00000597          	auipc	a1,0x0
    80004754:	e2458593          	addi	a1,a1,-476 # 80004574 <_ZL11workerBodyBPv>
    80004758:	fd840513          	addi	a0,s0,-40
    8000475c:	ffffd097          	auipc	ra,0xffffd
    80004760:	cfc080e7          	jalr	-772(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004764:	00005517          	auipc	a0,0x5
    80004768:	c3c50513          	addi	a0,a0,-964 # 800093a0 <CONSOLE_STATUS+0x390>
    8000476c:	00001097          	auipc	ra,0x1
    80004770:	930080e7          	jalr	-1744(ra) # 8000509c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004774:	00000613          	li	a2,0
    80004778:	00000597          	auipc	a1,0x0
    8000477c:	c7c58593          	addi	a1,a1,-900 # 800043f4 <_ZL11workerBodyCPv>
    80004780:	fe040513          	addi	a0,s0,-32
    80004784:	ffffd097          	auipc	ra,0xffffd
    80004788:	cd4080e7          	jalr	-812(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000478c:	00005517          	auipc	a0,0x5
    80004790:	c2c50513          	addi	a0,a0,-980 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80004794:	00001097          	auipc	ra,0x1
    80004798:	908080e7          	jalr	-1784(ra) # 8000509c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000479c:	00000613          	li	a2,0
    800047a0:	00000597          	auipc	a1,0x0
    800047a4:	b0c58593          	addi	a1,a1,-1268 # 800042ac <_ZL11workerBodyDPv>
    800047a8:	fe840513          	addi	a0,s0,-24
    800047ac:	ffffd097          	auipc	ra,0xffffd
    800047b0:	cac080e7          	jalr	-852(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800047b4:	00005517          	auipc	a0,0x5
    800047b8:	c1c50513          	addi	a0,a0,-996 # 800093d0 <CONSOLE_STATUS+0x3c0>
    800047bc:	00001097          	auipc	ra,0x1
    800047c0:	8e0080e7          	jalr	-1824(ra) # 8000509c <_Z11printStringPKc>
    800047c4:	00c0006f          	j	800047d0 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800047c8:	ffffd097          	auipc	ra,0xffffd
    800047cc:	cec080e7          	jalr	-788(ra) # 800014b4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800047d0:	00007797          	auipc	a5,0x7
    800047d4:	0237c783          	lbu	a5,35(a5) # 8000b7f3 <_ZL9finishedA>
    800047d8:	fe0788e3          	beqz	a5,800047c8 <_Z18Threads_C_API_testv+0xb4>
    800047dc:	00007797          	auipc	a5,0x7
    800047e0:	0167c783          	lbu	a5,22(a5) # 8000b7f2 <_ZL9finishedB>
    800047e4:	fe0782e3          	beqz	a5,800047c8 <_Z18Threads_C_API_testv+0xb4>
    800047e8:	00007797          	auipc	a5,0x7
    800047ec:	0097c783          	lbu	a5,9(a5) # 8000b7f1 <_ZL9finishedC>
    800047f0:	fc078ce3          	beqz	a5,800047c8 <_Z18Threads_C_API_testv+0xb4>
    800047f4:	00007797          	auipc	a5,0x7
    800047f8:	ffc7c783          	lbu	a5,-4(a5) # 8000b7f0 <_ZL9finishedD>
    800047fc:	fc0786e3          	beqz	a5,800047c8 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80004800:	02813083          	ld	ra,40(sp)
    80004804:	02013403          	ld	s0,32(sp)
    80004808:	03010113          	addi	sp,sp,48
    8000480c:	00008067          	ret

0000000080004810 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80004810:	fd010113          	addi	sp,sp,-48
    80004814:	02113423          	sd	ra,40(sp)
    80004818:	02813023          	sd	s0,32(sp)
    8000481c:	00913c23          	sd	s1,24(sp)
    80004820:	01213823          	sd	s2,16(sp)
    80004824:	01313423          	sd	s3,8(sp)
    80004828:	03010413          	addi	s0,sp,48
    8000482c:	00050993          	mv	s3,a0
    80004830:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004834:	00000913          	li	s2,0
    80004838:	00c0006f          	j	80004844 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    8000483c:	ffffd097          	auipc	ra,0xffffd
    80004840:	6f4080e7          	jalr	1780(ra) # 80001f30 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004844:	ffffd097          	auipc	ra,0xffffd
    80004848:	d70080e7          	jalr	-656(ra) # 800015b4 <_Z4getcv>
    8000484c:	0005059b          	sext.w	a1,a0
    80004850:	01b00793          	li	a5,27
    80004854:	02f58a63          	beq	a1,a5,80004888 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80004858:	0084b503          	ld	a0,8(s1)
    8000485c:	00001097          	auipc	ra,0x1
    80004860:	c64080e7          	jalr	-924(ra) # 800054c0 <_ZN9BufferCPP3putEi>
        i++;
    80004864:	0019071b          	addiw	a4,s2,1
    80004868:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000486c:	0004a683          	lw	a3,0(s1)
    80004870:	0026979b          	slliw	a5,a3,0x2
    80004874:	00d787bb          	addw	a5,a5,a3
    80004878:	0017979b          	slliw	a5,a5,0x1
    8000487c:	02f767bb          	remw	a5,a4,a5
    80004880:	fc0792e3          	bnez	a5,80004844 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80004884:	fb9ff06f          	j	8000483c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80004888:	00100793          	li	a5,1
    8000488c:	00007717          	auipc	a4,0x7
    80004890:	f6f72623          	sw	a5,-148(a4) # 8000b7f8 <_ZL9threadEnd>
    td->buffer->put('!');
    80004894:	0209b783          	ld	a5,32(s3)
    80004898:	02100593          	li	a1,33
    8000489c:	0087b503          	ld	a0,8(a5)
    800048a0:	00001097          	auipc	ra,0x1
    800048a4:	c20080e7          	jalr	-992(ra) # 800054c0 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800048a8:	0104b503          	ld	a0,16(s1)
    800048ac:	ffffe097          	auipc	ra,0xffffe
    800048b0:	834080e7          	jalr	-1996(ra) # 800020e0 <_ZN9Semaphore6signalEv>
}
    800048b4:	02813083          	ld	ra,40(sp)
    800048b8:	02013403          	ld	s0,32(sp)
    800048bc:	01813483          	ld	s1,24(sp)
    800048c0:	01013903          	ld	s2,16(sp)
    800048c4:	00813983          	ld	s3,8(sp)
    800048c8:	03010113          	addi	sp,sp,48
    800048cc:	00008067          	ret

00000000800048d0 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800048d0:	fe010113          	addi	sp,sp,-32
    800048d4:	00113c23          	sd	ra,24(sp)
    800048d8:	00813823          	sd	s0,16(sp)
    800048dc:	00913423          	sd	s1,8(sp)
    800048e0:	01213023          	sd	s2,0(sp)
    800048e4:	02010413          	addi	s0,sp,32
    800048e8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800048ec:	00000913          	li	s2,0
    800048f0:	00c0006f          	j	800048fc <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800048f4:	ffffd097          	auipc	ra,0xffffd
    800048f8:	63c080e7          	jalr	1596(ra) # 80001f30 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800048fc:	00007797          	auipc	a5,0x7
    80004900:	efc7a783          	lw	a5,-260(a5) # 8000b7f8 <_ZL9threadEnd>
    80004904:	02079e63          	bnez	a5,80004940 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80004908:	0004a583          	lw	a1,0(s1)
    8000490c:	0305859b          	addiw	a1,a1,48
    80004910:	0084b503          	ld	a0,8(s1)
    80004914:	00001097          	auipc	ra,0x1
    80004918:	bac080e7          	jalr	-1108(ra) # 800054c0 <_ZN9BufferCPP3putEi>
        i++;
    8000491c:	0019071b          	addiw	a4,s2,1
    80004920:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004924:	0004a683          	lw	a3,0(s1)
    80004928:	0026979b          	slliw	a5,a3,0x2
    8000492c:	00d787bb          	addw	a5,a5,a3
    80004930:	0017979b          	slliw	a5,a5,0x1
    80004934:	02f767bb          	remw	a5,a4,a5
    80004938:	fc0792e3          	bnez	a5,800048fc <_ZN12ProducerSync8producerEPv+0x2c>
    8000493c:	fb9ff06f          	j	800048f4 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80004940:	0104b503          	ld	a0,16(s1)
    80004944:	ffffd097          	auipc	ra,0xffffd
    80004948:	79c080e7          	jalr	1948(ra) # 800020e0 <_ZN9Semaphore6signalEv>
}
    8000494c:	01813083          	ld	ra,24(sp)
    80004950:	01013403          	ld	s0,16(sp)
    80004954:	00813483          	ld	s1,8(sp)
    80004958:	00013903          	ld	s2,0(sp)
    8000495c:	02010113          	addi	sp,sp,32
    80004960:	00008067          	ret

0000000080004964 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80004964:	fd010113          	addi	sp,sp,-48
    80004968:	02113423          	sd	ra,40(sp)
    8000496c:	02813023          	sd	s0,32(sp)
    80004970:	00913c23          	sd	s1,24(sp)
    80004974:	01213823          	sd	s2,16(sp)
    80004978:	01313423          	sd	s3,8(sp)
    8000497c:	01413023          	sd	s4,0(sp)
    80004980:	03010413          	addi	s0,sp,48
    80004984:	00050993          	mv	s3,a0
    80004988:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000498c:	00000a13          	li	s4,0
    80004990:	01c0006f          	j	800049ac <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80004994:	ffffd097          	auipc	ra,0xffffd
    80004998:	59c080e7          	jalr	1436(ra) # 80001f30 <_ZN6Thread8dispatchEv>
    8000499c:	0500006f          	j	800049ec <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800049a0:	00a00513          	li	a0,10
    800049a4:	ffffd097          	auipc	ra,0xffffd
    800049a8:	c38080e7          	jalr	-968(ra) # 800015dc <_Z4putcc>
    while (!threadEnd) {
    800049ac:	00007797          	auipc	a5,0x7
    800049b0:	e4c7a783          	lw	a5,-436(a5) # 8000b7f8 <_ZL9threadEnd>
    800049b4:	06079263          	bnez	a5,80004a18 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800049b8:	00893503          	ld	a0,8(s2)
    800049bc:	00001097          	auipc	ra,0x1
    800049c0:	b94080e7          	jalr	-1132(ra) # 80005550 <_ZN9BufferCPP3getEv>
        i++;
    800049c4:	001a049b          	addiw	s1,s4,1
    800049c8:	00048a1b          	sext.w	s4,s1
        putc(key);
    800049cc:	0ff57513          	andi	a0,a0,255
    800049d0:	ffffd097          	auipc	ra,0xffffd
    800049d4:	c0c080e7          	jalr	-1012(ra) # 800015dc <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800049d8:	00092703          	lw	a4,0(s2)
    800049dc:	0027179b          	slliw	a5,a4,0x2
    800049e0:	00e787bb          	addw	a5,a5,a4
    800049e4:	02f4e7bb          	remw	a5,s1,a5
    800049e8:	fa0786e3          	beqz	a5,80004994 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800049ec:	05000793          	li	a5,80
    800049f0:	02f4e4bb          	remw	s1,s1,a5
    800049f4:	fa049ce3          	bnez	s1,800049ac <_ZN12ConsumerSync8consumerEPv+0x48>
    800049f8:	fa9ff06f          	j	800049a0 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800049fc:	0209b783          	ld	a5,32(s3)
    80004a00:	0087b503          	ld	a0,8(a5)
    80004a04:	00001097          	auipc	ra,0x1
    80004a08:	b4c080e7          	jalr	-1204(ra) # 80005550 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80004a0c:	0ff57513          	andi	a0,a0,255
    80004a10:	ffffd097          	auipc	ra,0xffffd
    80004a14:	744080e7          	jalr	1860(ra) # 80002154 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80004a18:	0209b783          	ld	a5,32(s3)
    80004a1c:	0087b503          	ld	a0,8(a5)
    80004a20:	00001097          	auipc	ra,0x1
    80004a24:	bbc080e7          	jalr	-1092(ra) # 800055dc <_ZN9BufferCPP6getCntEv>
    80004a28:	fca04ae3          	bgtz	a0,800049fc <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80004a2c:	01093503          	ld	a0,16(s2)
    80004a30:	ffffd097          	auipc	ra,0xffffd
    80004a34:	6b0080e7          	jalr	1712(ra) # 800020e0 <_ZN9Semaphore6signalEv>
}
    80004a38:	02813083          	ld	ra,40(sp)
    80004a3c:	02013403          	ld	s0,32(sp)
    80004a40:	01813483          	ld	s1,24(sp)
    80004a44:	01013903          	ld	s2,16(sp)
    80004a48:	00813983          	ld	s3,8(sp)
    80004a4c:	00013a03          	ld	s4,0(sp)
    80004a50:	03010113          	addi	sp,sp,48
    80004a54:	00008067          	ret

0000000080004a58 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80004a58:	f8010113          	addi	sp,sp,-128
    80004a5c:	06113c23          	sd	ra,120(sp)
    80004a60:	06813823          	sd	s0,112(sp)
    80004a64:	06913423          	sd	s1,104(sp)
    80004a68:	07213023          	sd	s2,96(sp)
    80004a6c:	05313c23          	sd	s3,88(sp)
    80004a70:	05413823          	sd	s4,80(sp)
    80004a74:	05513423          	sd	s5,72(sp)
    80004a78:	05613023          	sd	s6,64(sp)
    80004a7c:	03713c23          	sd	s7,56(sp)
    80004a80:	03813823          	sd	s8,48(sp)
    80004a84:	03913423          	sd	s9,40(sp)
    80004a88:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80004a8c:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80004a90:	00004517          	auipc	a0,0x4
    80004a94:	76850513          	addi	a0,a0,1896 # 800091f8 <CONSOLE_STATUS+0x1e8>
    80004a98:	00000097          	auipc	ra,0x0
    80004a9c:	604080e7          	jalr	1540(ra) # 8000509c <_Z11printStringPKc>
    getString(input, 30);
    80004aa0:	01e00593          	li	a1,30
    80004aa4:	f8040493          	addi	s1,s0,-128
    80004aa8:	00048513          	mv	a0,s1
    80004aac:	00000097          	auipc	ra,0x0
    80004ab0:	678080e7          	jalr	1656(ra) # 80005124 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004ab4:	00048513          	mv	a0,s1
    80004ab8:	00000097          	auipc	ra,0x0
    80004abc:	744080e7          	jalr	1860(ra) # 800051fc <_Z11stringToIntPKc>
    80004ac0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80004ac4:	00004517          	auipc	a0,0x4
    80004ac8:	75450513          	addi	a0,a0,1876 # 80009218 <CONSOLE_STATUS+0x208>
    80004acc:	00000097          	auipc	ra,0x0
    80004ad0:	5d0080e7          	jalr	1488(ra) # 8000509c <_Z11printStringPKc>
    getString(input, 30);
    80004ad4:	01e00593          	li	a1,30
    80004ad8:	00048513          	mv	a0,s1
    80004adc:	00000097          	auipc	ra,0x0
    80004ae0:	648080e7          	jalr	1608(ra) # 80005124 <_Z9getStringPci>
    n = stringToInt(input);
    80004ae4:	00048513          	mv	a0,s1
    80004ae8:	00000097          	auipc	ra,0x0
    80004aec:	714080e7          	jalr	1812(ra) # 800051fc <_Z11stringToIntPKc>
    80004af0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80004af4:	00004517          	auipc	a0,0x4
    80004af8:	74450513          	addi	a0,a0,1860 # 80009238 <CONSOLE_STATUS+0x228>
    80004afc:	00000097          	auipc	ra,0x0
    80004b00:	5a0080e7          	jalr	1440(ra) # 8000509c <_Z11printStringPKc>
    80004b04:	00000613          	li	a2,0
    80004b08:	00a00593          	li	a1,10
    80004b0c:	00090513          	mv	a0,s2
    80004b10:	00000097          	auipc	ra,0x0
    80004b14:	73c080e7          	jalr	1852(ra) # 8000524c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004b18:	00004517          	auipc	a0,0x4
    80004b1c:	73850513          	addi	a0,a0,1848 # 80009250 <CONSOLE_STATUS+0x240>
    80004b20:	00000097          	auipc	ra,0x0
    80004b24:	57c080e7          	jalr	1404(ra) # 8000509c <_Z11printStringPKc>
    80004b28:	00000613          	li	a2,0
    80004b2c:	00a00593          	li	a1,10
    80004b30:	00048513          	mv	a0,s1
    80004b34:	00000097          	auipc	ra,0x0
    80004b38:	718080e7          	jalr	1816(ra) # 8000524c <_Z8printIntiii>
    printString(".\n");
    80004b3c:	00004517          	auipc	a0,0x4
    80004b40:	72c50513          	addi	a0,a0,1836 # 80009268 <CONSOLE_STATUS+0x258>
    80004b44:	00000097          	auipc	ra,0x0
    80004b48:	558080e7          	jalr	1368(ra) # 8000509c <_Z11printStringPKc>
    if(threadNum > n) {
    80004b4c:	0324c463          	blt	s1,s2,80004b74 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80004b50:	03205c63          	blez	s2,80004b88 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004b54:	03800513          	li	a0,56
    80004b58:	ffffd097          	auipc	ra,0xffffd
    80004b5c:	b2c080e7          	jalr	-1236(ra) # 80001684 <_Znwm>
    80004b60:	00050a93          	mv	s5,a0
    80004b64:	00048593          	mv	a1,s1
    80004b68:	00001097          	auipc	ra,0x1
    80004b6c:	804080e7          	jalr	-2044(ra) # 8000536c <_ZN9BufferCPPC1Ei>
    80004b70:	0300006f          	j	80004ba0 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004b74:	00004517          	auipc	a0,0x4
    80004b78:	6fc50513          	addi	a0,a0,1788 # 80009270 <CONSOLE_STATUS+0x260>
    80004b7c:	00000097          	auipc	ra,0x0
    80004b80:	520080e7          	jalr	1312(ra) # 8000509c <_Z11printStringPKc>
        return;
    80004b84:	0140006f          	j	80004b98 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004b88:	00004517          	auipc	a0,0x4
    80004b8c:	72850513          	addi	a0,a0,1832 # 800092b0 <CONSOLE_STATUS+0x2a0>
    80004b90:	00000097          	auipc	ra,0x0
    80004b94:	50c080e7          	jalr	1292(ra) # 8000509c <_Z11printStringPKc>
        return;
    80004b98:	000b8113          	mv	sp,s7
    80004b9c:	2380006f          	j	80004dd4 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80004ba0:	01000513          	li	a0,16
    80004ba4:	ffffd097          	auipc	ra,0xffffd
    80004ba8:	ae0080e7          	jalr	-1312(ra) # 80001684 <_Znwm>
    80004bac:	00050493          	mv	s1,a0
    80004bb0:	00000593          	li	a1,0
    80004bb4:	ffffd097          	auipc	ra,0xffffd
    80004bb8:	4c8080e7          	jalr	1224(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    80004bbc:	00007797          	auipc	a5,0x7
    80004bc0:	c497b223          	sd	s1,-956(a5) # 8000b800 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80004bc4:	00391793          	slli	a5,s2,0x3
    80004bc8:	00f78793          	addi	a5,a5,15
    80004bcc:	ff07f793          	andi	a5,a5,-16
    80004bd0:	40f10133          	sub	sp,sp,a5
    80004bd4:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80004bd8:	0019071b          	addiw	a4,s2,1
    80004bdc:	00171793          	slli	a5,a4,0x1
    80004be0:	00e787b3          	add	a5,a5,a4
    80004be4:	00379793          	slli	a5,a5,0x3
    80004be8:	00f78793          	addi	a5,a5,15
    80004bec:	ff07f793          	andi	a5,a5,-16
    80004bf0:	40f10133          	sub	sp,sp,a5
    80004bf4:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80004bf8:	00191c13          	slli	s8,s2,0x1
    80004bfc:	012c07b3          	add	a5,s8,s2
    80004c00:	00379793          	slli	a5,a5,0x3
    80004c04:	00fa07b3          	add	a5,s4,a5
    80004c08:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80004c0c:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80004c10:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80004c14:	02800513          	li	a0,40
    80004c18:	ffffd097          	auipc	ra,0xffffd
    80004c1c:	a6c080e7          	jalr	-1428(ra) # 80001684 <_Znwm>
    80004c20:	00050b13          	mv	s6,a0
    80004c24:	012c0c33          	add	s8,s8,s2
    80004c28:	003c1c13          	slli	s8,s8,0x3
    80004c2c:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80004c30:	ffffd097          	auipc	ra,0xffffd
    80004c34:	390080e7          	jalr	912(ra) # 80001fc0 <_ZN6ThreadC1Ev>
    80004c38:	00007797          	auipc	a5,0x7
    80004c3c:	aa078793          	addi	a5,a5,-1376 # 8000b6d8 <_ZTV12ConsumerSync+0x10>
    80004c40:	00fb3023          	sd	a5,0(s6)
    80004c44:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80004c48:	000b0513          	mv	a0,s6
    80004c4c:	ffffd097          	auipc	ra,0xffffd
    80004c50:	344080e7          	jalr	836(ra) # 80001f90 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004c54:	00000493          	li	s1,0
    80004c58:	0380006f          	j	80004c90 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004c5c:	00007797          	auipc	a5,0x7
    80004c60:	a5478793          	addi	a5,a5,-1452 # 8000b6b0 <_ZTV12ProducerSync+0x10>
    80004c64:	00fcb023          	sd	a5,0(s9)
    80004c68:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80004c6c:	00349793          	slli	a5,s1,0x3
    80004c70:	00f987b3          	add	a5,s3,a5
    80004c74:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80004c78:	00349793          	slli	a5,s1,0x3
    80004c7c:	00f987b3          	add	a5,s3,a5
    80004c80:	0007b503          	ld	a0,0(a5)
    80004c84:	ffffd097          	auipc	ra,0xffffd
    80004c88:	30c080e7          	jalr	780(ra) # 80001f90 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004c8c:	0014849b          	addiw	s1,s1,1
    80004c90:	0b24d063          	bge	s1,s2,80004d30 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80004c94:	00149793          	slli	a5,s1,0x1
    80004c98:	009787b3          	add	a5,a5,s1
    80004c9c:	00379793          	slli	a5,a5,0x3
    80004ca0:	00fa07b3          	add	a5,s4,a5
    80004ca4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004ca8:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80004cac:	00007717          	auipc	a4,0x7
    80004cb0:	b5473703          	ld	a4,-1196(a4) # 8000b800 <_ZL10waitForAll>
    80004cb4:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80004cb8:	02905863          	blez	s1,80004ce8 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80004cbc:	02800513          	li	a0,40
    80004cc0:	ffffd097          	auipc	ra,0xffffd
    80004cc4:	9c4080e7          	jalr	-1596(ra) # 80001684 <_Znwm>
    80004cc8:	00050c93          	mv	s9,a0
    80004ccc:	00149c13          	slli	s8,s1,0x1
    80004cd0:	009c0c33          	add	s8,s8,s1
    80004cd4:	003c1c13          	slli	s8,s8,0x3
    80004cd8:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004cdc:	ffffd097          	auipc	ra,0xffffd
    80004ce0:	2e4080e7          	jalr	740(ra) # 80001fc0 <_ZN6ThreadC1Ev>
    80004ce4:	f79ff06f          	j	80004c5c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80004ce8:	02800513          	li	a0,40
    80004cec:	ffffd097          	auipc	ra,0xffffd
    80004cf0:	998080e7          	jalr	-1640(ra) # 80001684 <_Znwm>
    80004cf4:	00050c93          	mv	s9,a0
    80004cf8:	00149c13          	slli	s8,s1,0x1
    80004cfc:	009c0c33          	add	s8,s8,s1
    80004d00:	003c1c13          	slli	s8,s8,0x3
    80004d04:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80004d08:	ffffd097          	auipc	ra,0xffffd
    80004d0c:	2b8080e7          	jalr	696(ra) # 80001fc0 <_ZN6ThreadC1Ev>
    80004d10:	00007797          	auipc	a5,0x7
    80004d14:	97878793          	addi	a5,a5,-1672 # 8000b688 <_ZTV16ProducerKeyboard+0x10>
    80004d18:	00fcb023          	sd	a5,0(s9)
    80004d1c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80004d20:	00349793          	slli	a5,s1,0x3
    80004d24:	00f987b3          	add	a5,s3,a5
    80004d28:	0197b023          	sd	s9,0(a5)
    80004d2c:	f4dff06f          	j	80004c78 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80004d30:	ffffd097          	auipc	ra,0xffffd
    80004d34:	200080e7          	jalr	512(ra) # 80001f30 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004d38:	00000493          	li	s1,0
    80004d3c:	00994e63          	blt	s2,s1,80004d58 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80004d40:	00007517          	auipc	a0,0x7
    80004d44:	ac053503          	ld	a0,-1344(a0) # 8000b800 <_ZL10waitForAll>
    80004d48:	ffffd097          	auipc	ra,0xffffd
    80004d4c:	36c080e7          	jalr	876(ra) # 800020b4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004d50:	0014849b          	addiw	s1,s1,1
    80004d54:	fe9ff06f          	j	80004d3c <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80004d58:	00000493          	li	s1,0
    80004d5c:	0080006f          	j	80004d64 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80004d60:	0014849b          	addiw	s1,s1,1
    80004d64:	0324d263          	bge	s1,s2,80004d88 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80004d68:	00349793          	slli	a5,s1,0x3
    80004d6c:	00f987b3          	add	a5,s3,a5
    80004d70:	0007b503          	ld	a0,0(a5)
    80004d74:	fe0506e3          	beqz	a0,80004d60 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80004d78:	00053783          	ld	a5,0(a0)
    80004d7c:	0087b783          	ld	a5,8(a5)
    80004d80:	000780e7          	jalr	a5
    80004d84:	fddff06f          	j	80004d60 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80004d88:	000b0a63          	beqz	s6,80004d9c <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80004d8c:	000b3783          	ld	a5,0(s6)
    80004d90:	0087b783          	ld	a5,8(a5)
    80004d94:	000b0513          	mv	a0,s6
    80004d98:	000780e7          	jalr	a5
    delete waitForAll;
    80004d9c:	00007517          	auipc	a0,0x7
    80004da0:	a6453503          	ld	a0,-1436(a0) # 8000b800 <_ZL10waitForAll>
    80004da4:	00050863          	beqz	a0,80004db4 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80004da8:	00053783          	ld	a5,0(a0)
    80004dac:	0087b783          	ld	a5,8(a5)
    80004db0:	000780e7          	jalr	a5
    delete buffer;
    80004db4:	000a8e63          	beqz	s5,80004dd0 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80004db8:	000a8513          	mv	a0,s5
    80004dbc:	00001097          	auipc	ra,0x1
    80004dc0:	8a8080e7          	jalr	-1880(ra) # 80005664 <_ZN9BufferCPPD1Ev>
    80004dc4:	000a8513          	mv	a0,s5
    80004dc8:	ffffd097          	auipc	ra,0xffffd
    80004dcc:	90c080e7          	jalr	-1780(ra) # 800016d4 <_ZdlPv>
    80004dd0:	000b8113          	mv	sp,s7

}
    80004dd4:	f8040113          	addi	sp,s0,-128
    80004dd8:	07813083          	ld	ra,120(sp)
    80004ddc:	07013403          	ld	s0,112(sp)
    80004de0:	06813483          	ld	s1,104(sp)
    80004de4:	06013903          	ld	s2,96(sp)
    80004de8:	05813983          	ld	s3,88(sp)
    80004dec:	05013a03          	ld	s4,80(sp)
    80004df0:	04813a83          	ld	s5,72(sp)
    80004df4:	04013b03          	ld	s6,64(sp)
    80004df8:	03813b83          	ld	s7,56(sp)
    80004dfc:	03013c03          	ld	s8,48(sp)
    80004e00:	02813c83          	ld	s9,40(sp)
    80004e04:	08010113          	addi	sp,sp,128
    80004e08:	00008067          	ret
    80004e0c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004e10:	000a8513          	mv	a0,s5
    80004e14:	ffffd097          	auipc	ra,0xffffd
    80004e18:	8c0080e7          	jalr	-1856(ra) # 800016d4 <_ZdlPv>
    80004e1c:	00048513          	mv	a0,s1
    80004e20:	00008097          	auipc	ra,0x8
    80004e24:	ac8080e7          	jalr	-1336(ra) # 8000c8e8 <_Unwind_Resume>
    80004e28:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80004e2c:	00048513          	mv	a0,s1
    80004e30:	ffffd097          	auipc	ra,0xffffd
    80004e34:	8a4080e7          	jalr	-1884(ra) # 800016d4 <_ZdlPv>
    80004e38:	00090513          	mv	a0,s2
    80004e3c:	00008097          	auipc	ra,0x8
    80004e40:	aac080e7          	jalr	-1364(ra) # 8000c8e8 <_Unwind_Resume>
    80004e44:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80004e48:	000b0513          	mv	a0,s6
    80004e4c:	ffffd097          	auipc	ra,0xffffd
    80004e50:	888080e7          	jalr	-1912(ra) # 800016d4 <_ZdlPv>
    80004e54:	00048513          	mv	a0,s1
    80004e58:	00008097          	auipc	ra,0x8
    80004e5c:	a90080e7          	jalr	-1392(ra) # 8000c8e8 <_Unwind_Resume>
    80004e60:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80004e64:	000c8513          	mv	a0,s9
    80004e68:	ffffd097          	auipc	ra,0xffffd
    80004e6c:	86c080e7          	jalr	-1940(ra) # 800016d4 <_ZdlPv>
    80004e70:	00048513          	mv	a0,s1
    80004e74:	00008097          	auipc	ra,0x8
    80004e78:	a74080e7          	jalr	-1420(ra) # 8000c8e8 <_Unwind_Resume>
    80004e7c:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80004e80:	000c8513          	mv	a0,s9
    80004e84:	ffffd097          	auipc	ra,0xffffd
    80004e88:	850080e7          	jalr	-1968(ra) # 800016d4 <_ZdlPv>
    80004e8c:	00048513          	mv	a0,s1
    80004e90:	00008097          	auipc	ra,0x8
    80004e94:	a58080e7          	jalr	-1448(ra) # 8000c8e8 <_Unwind_Resume>

0000000080004e98 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80004e98:	ff010113          	addi	sp,sp,-16
    80004e9c:	00113423          	sd	ra,8(sp)
    80004ea0:	00813023          	sd	s0,0(sp)
    80004ea4:	01010413          	addi	s0,sp,16
    80004ea8:	00007797          	auipc	a5,0x7
    80004eac:	83078793          	addi	a5,a5,-2000 # 8000b6d8 <_ZTV12ConsumerSync+0x10>
    80004eb0:	00f53023          	sd	a5,0(a0)
    80004eb4:	ffffd097          	auipc	ra,0xffffd
    80004eb8:	f50080e7          	jalr	-176(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80004ebc:	00813083          	ld	ra,8(sp)
    80004ec0:	00013403          	ld	s0,0(sp)
    80004ec4:	01010113          	addi	sp,sp,16
    80004ec8:	00008067          	ret

0000000080004ecc <_ZN12ConsumerSyncD0Ev>:
    80004ecc:	fe010113          	addi	sp,sp,-32
    80004ed0:	00113c23          	sd	ra,24(sp)
    80004ed4:	00813823          	sd	s0,16(sp)
    80004ed8:	00913423          	sd	s1,8(sp)
    80004edc:	02010413          	addi	s0,sp,32
    80004ee0:	00050493          	mv	s1,a0
    80004ee4:	00006797          	auipc	a5,0x6
    80004ee8:	7f478793          	addi	a5,a5,2036 # 8000b6d8 <_ZTV12ConsumerSync+0x10>
    80004eec:	00f53023          	sd	a5,0(a0)
    80004ef0:	ffffd097          	auipc	ra,0xffffd
    80004ef4:	f14080e7          	jalr	-236(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80004ef8:	00048513          	mv	a0,s1
    80004efc:	ffffc097          	auipc	ra,0xffffc
    80004f00:	7d8080e7          	jalr	2008(ra) # 800016d4 <_ZdlPv>
    80004f04:	01813083          	ld	ra,24(sp)
    80004f08:	01013403          	ld	s0,16(sp)
    80004f0c:	00813483          	ld	s1,8(sp)
    80004f10:	02010113          	addi	sp,sp,32
    80004f14:	00008067          	ret

0000000080004f18 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80004f18:	ff010113          	addi	sp,sp,-16
    80004f1c:	00113423          	sd	ra,8(sp)
    80004f20:	00813023          	sd	s0,0(sp)
    80004f24:	01010413          	addi	s0,sp,16
    80004f28:	00006797          	auipc	a5,0x6
    80004f2c:	78878793          	addi	a5,a5,1928 # 8000b6b0 <_ZTV12ProducerSync+0x10>
    80004f30:	00f53023          	sd	a5,0(a0)
    80004f34:	ffffd097          	auipc	ra,0xffffd
    80004f38:	ed0080e7          	jalr	-304(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80004f3c:	00813083          	ld	ra,8(sp)
    80004f40:	00013403          	ld	s0,0(sp)
    80004f44:	01010113          	addi	sp,sp,16
    80004f48:	00008067          	ret

0000000080004f4c <_ZN12ProducerSyncD0Ev>:
    80004f4c:	fe010113          	addi	sp,sp,-32
    80004f50:	00113c23          	sd	ra,24(sp)
    80004f54:	00813823          	sd	s0,16(sp)
    80004f58:	00913423          	sd	s1,8(sp)
    80004f5c:	02010413          	addi	s0,sp,32
    80004f60:	00050493          	mv	s1,a0
    80004f64:	00006797          	auipc	a5,0x6
    80004f68:	74c78793          	addi	a5,a5,1868 # 8000b6b0 <_ZTV12ProducerSync+0x10>
    80004f6c:	00f53023          	sd	a5,0(a0)
    80004f70:	ffffd097          	auipc	ra,0xffffd
    80004f74:	e94080e7          	jalr	-364(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80004f78:	00048513          	mv	a0,s1
    80004f7c:	ffffc097          	auipc	ra,0xffffc
    80004f80:	758080e7          	jalr	1880(ra) # 800016d4 <_ZdlPv>
    80004f84:	01813083          	ld	ra,24(sp)
    80004f88:	01013403          	ld	s0,16(sp)
    80004f8c:	00813483          	ld	s1,8(sp)
    80004f90:	02010113          	addi	sp,sp,32
    80004f94:	00008067          	ret

0000000080004f98 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80004f98:	ff010113          	addi	sp,sp,-16
    80004f9c:	00113423          	sd	ra,8(sp)
    80004fa0:	00813023          	sd	s0,0(sp)
    80004fa4:	01010413          	addi	s0,sp,16
    80004fa8:	00006797          	auipc	a5,0x6
    80004fac:	6e078793          	addi	a5,a5,1760 # 8000b688 <_ZTV16ProducerKeyboard+0x10>
    80004fb0:	00f53023          	sd	a5,0(a0)
    80004fb4:	ffffd097          	auipc	ra,0xffffd
    80004fb8:	e50080e7          	jalr	-432(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80004fbc:	00813083          	ld	ra,8(sp)
    80004fc0:	00013403          	ld	s0,0(sp)
    80004fc4:	01010113          	addi	sp,sp,16
    80004fc8:	00008067          	ret

0000000080004fcc <_ZN16ProducerKeyboardD0Ev>:
    80004fcc:	fe010113          	addi	sp,sp,-32
    80004fd0:	00113c23          	sd	ra,24(sp)
    80004fd4:	00813823          	sd	s0,16(sp)
    80004fd8:	00913423          	sd	s1,8(sp)
    80004fdc:	02010413          	addi	s0,sp,32
    80004fe0:	00050493          	mv	s1,a0
    80004fe4:	00006797          	auipc	a5,0x6
    80004fe8:	6a478793          	addi	a5,a5,1700 # 8000b688 <_ZTV16ProducerKeyboard+0x10>
    80004fec:	00f53023          	sd	a5,0(a0)
    80004ff0:	ffffd097          	auipc	ra,0xffffd
    80004ff4:	e14080e7          	jalr	-492(ra) # 80001e04 <_ZN6ThreadD1Ev>
    80004ff8:	00048513          	mv	a0,s1
    80004ffc:	ffffc097          	auipc	ra,0xffffc
    80005000:	6d8080e7          	jalr	1752(ra) # 800016d4 <_ZdlPv>
    80005004:	01813083          	ld	ra,24(sp)
    80005008:	01013403          	ld	s0,16(sp)
    8000500c:	00813483          	ld	s1,8(sp)
    80005010:	02010113          	addi	sp,sp,32
    80005014:	00008067          	ret

0000000080005018 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005018:	ff010113          	addi	sp,sp,-16
    8000501c:	00113423          	sd	ra,8(sp)
    80005020:	00813023          	sd	s0,0(sp)
    80005024:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005028:	02053583          	ld	a1,32(a0)
    8000502c:	fffff097          	auipc	ra,0xfffff
    80005030:	7e4080e7          	jalr	2020(ra) # 80004810 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005034:	00813083          	ld	ra,8(sp)
    80005038:	00013403          	ld	s0,0(sp)
    8000503c:	01010113          	addi	sp,sp,16
    80005040:	00008067          	ret

0000000080005044 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005044:	ff010113          	addi	sp,sp,-16
    80005048:	00113423          	sd	ra,8(sp)
    8000504c:	00813023          	sd	s0,0(sp)
    80005050:	01010413          	addi	s0,sp,16
        producer(td);
    80005054:	02053583          	ld	a1,32(a0)
    80005058:	00000097          	auipc	ra,0x0
    8000505c:	878080e7          	jalr	-1928(ra) # 800048d0 <_ZN12ProducerSync8producerEPv>
    }
    80005060:	00813083          	ld	ra,8(sp)
    80005064:	00013403          	ld	s0,0(sp)
    80005068:	01010113          	addi	sp,sp,16
    8000506c:	00008067          	ret

0000000080005070 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005070:	ff010113          	addi	sp,sp,-16
    80005074:	00113423          	sd	ra,8(sp)
    80005078:	00813023          	sd	s0,0(sp)
    8000507c:	01010413          	addi	s0,sp,16
        consumer(td);
    80005080:	02053583          	ld	a1,32(a0)
    80005084:	00000097          	auipc	ra,0x0
    80005088:	8e0080e7          	jalr	-1824(ra) # 80004964 <_ZN12ConsumerSync8consumerEPv>
    }
    8000508c:	00813083          	ld	ra,8(sp)
    80005090:	00013403          	ld	s0,0(sp)
    80005094:	01010113          	addi	sp,sp,16
    80005098:	00008067          	ret

000000008000509c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000509c:	fe010113          	addi	sp,sp,-32
    800050a0:	00113c23          	sd	ra,24(sp)
    800050a4:	00813823          	sd	s0,16(sp)
    800050a8:	00913423          	sd	s1,8(sp)
    800050ac:	02010413          	addi	s0,sp,32
    800050b0:	00050493          	mv	s1,a0
    LOCK();
    800050b4:	00100613          	li	a2,1
    800050b8:	00000593          	li	a1,0
    800050bc:	00006517          	auipc	a0,0x6
    800050c0:	74c50513          	addi	a0,a0,1868 # 8000b808 <lockPrint>
    800050c4:	ffffc097          	auipc	ra,0xffffc
    800050c8:	2b8080e7          	jalr	696(ra) # 8000137c <copy_and_swap>
    800050cc:	00050863          	beqz	a0,800050dc <_Z11printStringPKc+0x40>
    800050d0:	ffffc097          	auipc	ra,0xffffc
    800050d4:	3e4080e7          	jalr	996(ra) # 800014b4 <_Z15thread_dispatchv>
    800050d8:	fddff06f          	j	800050b4 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800050dc:	0004c503          	lbu	a0,0(s1)
    800050e0:	00050a63          	beqz	a0,800050f4 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800050e4:	ffffc097          	auipc	ra,0xffffc
    800050e8:	4f8080e7          	jalr	1272(ra) # 800015dc <_Z4putcc>
        string++;
    800050ec:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800050f0:	fedff06f          	j	800050dc <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800050f4:	00000613          	li	a2,0
    800050f8:	00100593          	li	a1,1
    800050fc:	00006517          	auipc	a0,0x6
    80005100:	70c50513          	addi	a0,a0,1804 # 8000b808 <lockPrint>
    80005104:	ffffc097          	auipc	ra,0xffffc
    80005108:	278080e7          	jalr	632(ra) # 8000137c <copy_and_swap>
    8000510c:	fe0514e3          	bnez	a0,800050f4 <_Z11printStringPKc+0x58>
}
    80005110:	01813083          	ld	ra,24(sp)
    80005114:	01013403          	ld	s0,16(sp)
    80005118:	00813483          	ld	s1,8(sp)
    8000511c:	02010113          	addi	sp,sp,32
    80005120:	00008067          	ret

0000000080005124 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005124:	fd010113          	addi	sp,sp,-48
    80005128:	02113423          	sd	ra,40(sp)
    8000512c:	02813023          	sd	s0,32(sp)
    80005130:	00913c23          	sd	s1,24(sp)
    80005134:	01213823          	sd	s2,16(sp)
    80005138:	01313423          	sd	s3,8(sp)
    8000513c:	01413023          	sd	s4,0(sp)
    80005140:	03010413          	addi	s0,sp,48
    80005144:	00050993          	mv	s3,a0
    80005148:	00058a13          	mv	s4,a1
    LOCK();
    8000514c:	00100613          	li	a2,1
    80005150:	00000593          	li	a1,0
    80005154:	00006517          	auipc	a0,0x6
    80005158:	6b450513          	addi	a0,a0,1716 # 8000b808 <lockPrint>
    8000515c:	ffffc097          	auipc	ra,0xffffc
    80005160:	220080e7          	jalr	544(ra) # 8000137c <copy_and_swap>
    80005164:	00050863          	beqz	a0,80005174 <_Z9getStringPci+0x50>
    80005168:	ffffc097          	auipc	ra,0xffffc
    8000516c:	34c080e7          	jalr	844(ra) # 800014b4 <_Z15thread_dispatchv>
    80005170:	fddff06f          	j	8000514c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005174:	00000913          	li	s2,0
    80005178:	00090493          	mv	s1,s2
    8000517c:	0019091b          	addiw	s2,s2,1
    80005180:	03495a63          	bge	s2,s4,800051b4 <_Z9getStringPci+0x90>
        cc = getc();
    80005184:	ffffc097          	auipc	ra,0xffffc
    80005188:	430080e7          	jalr	1072(ra) # 800015b4 <_Z4getcv>
        if(cc < 1)
    8000518c:	02050463          	beqz	a0,800051b4 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005190:	009984b3          	add	s1,s3,s1
    80005194:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005198:	00a00793          	li	a5,10
    8000519c:	00f50a63          	beq	a0,a5,800051b0 <_Z9getStringPci+0x8c>
    800051a0:	00d00793          	li	a5,13
    800051a4:	fcf51ae3          	bne	a0,a5,80005178 <_Z9getStringPci+0x54>
        buf[i++] = c;
    800051a8:	00090493          	mv	s1,s2
    800051ac:	0080006f          	j	800051b4 <_Z9getStringPci+0x90>
    800051b0:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800051b4:	009984b3          	add	s1,s3,s1
    800051b8:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800051bc:	00000613          	li	a2,0
    800051c0:	00100593          	li	a1,1
    800051c4:	00006517          	auipc	a0,0x6
    800051c8:	64450513          	addi	a0,a0,1604 # 8000b808 <lockPrint>
    800051cc:	ffffc097          	auipc	ra,0xffffc
    800051d0:	1b0080e7          	jalr	432(ra) # 8000137c <copy_and_swap>
    800051d4:	fe0514e3          	bnez	a0,800051bc <_Z9getStringPci+0x98>
    return buf;
}
    800051d8:	00098513          	mv	a0,s3
    800051dc:	02813083          	ld	ra,40(sp)
    800051e0:	02013403          	ld	s0,32(sp)
    800051e4:	01813483          	ld	s1,24(sp)
    800051e8:	01013903          	ld	s2,16(sp)
    800051ec:	00813983          	ld	s3,8(sp)
    800051f0:	00013a03          	ld	s4,0(sp)
    800051f4:	03010113          	addi	sp,sp,48
    800051f8:	00008067          	ret

00000000800051fc <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800051fc:	ff010113          	addi	sp,sp,-16
    80005200:	00813423          	sd	s0,8(sp)
    80005204:	01010413          	addi	s0,sp,16
    80005208:	00050693          	mv	a3,a0
    int n;

    n = 0;
    8000520c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005210:	0006c603          	lbu	a2,0(a3)
    80005214:	fd06071b          	addiw	a4,a2,-48
    80005218:	0ff77713          	andi	a4,a4,255
    8000521c:	00900793          	li	a5,9
    80005220:	02e7e063          	bltu	a5,a4,80005240 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005224:	0025179b          	slliw	a5,a0,0x2
    80005228:	00a787bb          	addw	a5,a5,a0
    8000522c:	0017979b          	slliw	a5,a5,0x1
    80005230:	00168693          	addi	a3,a3,1
    80005234:	00c787bb          	addw	a5,a5,a2
    80005238:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    8000523c:	fd5ff06f          	j	80005210 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005240:	00813403          	ld	s0,8(sp)
    80005244:	01010113          	addi	sp,sp,16
    80005248:	00008067          	ret

000000008000524c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    8000524c:	fc010113          	addi	sp,sp,-64
    80005250:	02113c23          	sd	ra,56(sp)
    80005254:	02813823          	sd	s0,48(sp)
    80005258:	02913423          	sd	s1,40(sp)
    8000525c:	03213023          	sd	s2,32(sp)
    80005260:	01313c23          	sd	s3,24(sp)
    80005264:	04010413          	addi	s0,sp,64
    80005268:	00050493          	mv	s1,a0
    8000526c:	00058913          	mv	s2,a1
    80005270:	00060993          	mv	s3,a2
    LOCK();
    80005274:	00100613          	li	a2,1
    80005278:	00000593          	li	a1,0
    8000527c:	00006517          	auipc	a0,0x6
    80005280:	58c50513          	addi	a0,a0,1420 # 8000b808 <lockPrint>
    80005284:	ffffc097          	auipc	ra,0xffffc
    80005288:	0f8080e7          	jalr	248(ra) # 8000137c <copy_and_swap>
    8000528c:	00050863          	beqz	a0,8000529c <_Z8printIntiii+0x50>
    80005290:	ffffc097          	auipc	ra,0xffffc
    80005294:	224080e7          	jalr	548(ra) # 800014b4 <_Z15thread_dispatchv>
    80005298:	fddff06f          	j	80005274 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000529c:	00098463          	beqz	s3,800052a4 <_Z8printIntiii+0x58>
    800052a0:	0804c463          	bltz	s1,80005328 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800052a4:	0004851b          	sext.w	a0,s1
    neg = 0;
    800052a8:	00000593          	li	a1,0
    }

    i = 0;
    800052ac:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800052b0:	0009079b          	sext.w	a5,s2
    800052b4:	0325773b          	remuw	a4,a0,s2
    800052b8:	00048613          	mv	a2,s1
    800052bc:	0014849b          	addiw	s1,s1,1
    800052c0:	02071693          	slli	a3,a4,0x20
    800052c4:	0206d693          	srli	a3,a3,0x20
    800052c8:	00006717          	auipc	a4,0x6
    800052cc:	42870713          	addi	a4,a4,1064 # 8000b6f0 <digits>
    800052d0:	00d70733          	add	a4,a4,a3
    800052d4:	00074683          	lbu	a3,0(a4)
    800052d8:	fd040713          	addi	a4,s0,-48
    800052dc:	00c70733          	add	a4,a4,a2
    800052e0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800052e4:	0005071b          	sext.w	a4,a0
    800052e8:	0325553b          	divuw	a0,a0,s2
    800052ec:	fcf772e3          	bgeu	a4,a5,800052b0 <_Z8printIntiii+0x64>
    if(neg)
    800052f0:	00058c63          	beqz	a1,80005308 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800052f4:	fd040793          	addi	a5,s0,-48
    800052f8:	009784b3          	add	s1,a5,s1
    800052fc:	02d00793          	li	a5,45
    80005300:	fef48823          	sb	a5,-16(s1)
    80005304:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005308:	fff4849b          	addiw	s1,s1,-1
    8000530c:	0204c463          	bltz	s1,80005334 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005310:	fd040793          	addi	a5,s0,-48
    80005314:	009787b3          	add	a5,a5,s1
    80005318:	ff07c503          	lbu	a0,-16(a5)
    8000531c:	ffffc097          	auipc	ra,0xffffc
    80005320:	2c0080e7          	jalr	704(ra) # 800015dc <_Z4putcc>
    80005324:	fe5ff06f          	j	80005308 <_Z8printIntiii+0xbc>
        x = -xx;
    80005328:	4090053b          	negw	a0,s1
        neg = 1;
    8000532c:	00100593          	li	a1,1
        x = -xx;
    80005330:	f7dff06f          	j	800052ac <_Z8printIntiii+0x60>

    UNLOCK();
    80005334:	00000613          	li	a2,0
    80005338:	00100593          	li	a1,1
    8000533c:	00006517          	auipc	a0,0x6
    80005340:	4cc50513          	addi	a0,a0,1228 # 8000b808 <lockPrint>
    80005344:	ffffc097          	auipc	ra,0xffffc
    80005348:	038080e7          	jalr	56(ra) # 8000137c <copy_and_swap>
    8000534c:	fe0514e3          	bnez	a0,80005334 <_Z8printIntiii+0xe8>
    80005350:	03813083          	ld	ra,56(sp)
    80005354:	03013403          	ld	s0,48(sp)
    80005358:	02813483          	ld	s1,40(sp)
    8000535c:	02013903          	ld	s2,32(sp)
    80005360:	01813983          	ld	s3,24(sp)
    80005364:	04010113          	addi	sp,sp,64
    80005368:	00008067          	ret

000000008000536c <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000536c:	fd010113          	addi	sp,sp,-48
    80005370:	02113423          	sd	ra,40(sp)
    80005374:	02813023          	sd	s0,32(sp)
    80005378:	00913c23          	sd	s1,24(sp)
    8000537c:	01213823          	sd	s2,16(sp)
    80005380:	01313423          	sd	s3,8(sp)
    80005384:	03010413          	addi	s0,sp,48
    80005388:	00050493          	mv	s1,a0
    8000538c:	00058913          	mv	s2,a1
    80005390:	0015879b          	addiw	a5,a1,1
    80005394:	0007851b          	sext.w	a0,a5
    80005398:	00f4a023          	sw	a5,0(s1)
    8000539c:	0004a823          	sw	zero,16(s1)
    800053a0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800053a4:	00251513          	slli	a0,a0,0x2
    800053a8:	ffffc097          	auipc	ra,0xffffc
    800053ac:	ff4080e7          	jalr	-12(ra) # 8000139c <_Z9mem_allocm>
    800053b0:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800053b4:	01000513          	li	a0,16
    800053b8:	ffffc097          	auipc	ra,0xffffc
    800053bc:	2cc080e7          	jalr	716(ra) # 80001684 <_Znwm>
    800053c0:	00050993          	mv	s3,a0
    800053c4:	00000593          	li	a1,0
    800053c8:	ffffd097          	auipc	ra,0xffffd
    800053cc:	cb4080e7          	jalr	-844(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    800053d0:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800053d4:	01000513          	li	a0,16
    800053d8:	ffffc097          	auipc	ra,0xffffc
    800053dc:	2ac080e7          	jalr	684(ra) # 80001684 <_Znwm>
    800053e0:	00050993          	mv	s3,a0
    800053e4:	00090593          	mv	a1,s2
    800053e8:	ffffd097          	auipc	ra,0xffffd
    800053ec:	c94080e7          	jalr	-876(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    800053f0:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800053f4:	01000513          	li	a0,16
    800053f8:	ffffc097          	auipc	ra,0xffffc
    800053fc:	28c080e7          	jalr	652(ra) # 80001684 <_Znwm>
    80005400:	00050913          	mv	s2,a0
    80005404:	00100593          	li	a1,1
    80005408:	ffffd097          	auipc	ra,0xffffd
    8000540c:	c74080e7          	jalr	-908(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    80005410:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005414:	01000513          	li	a0,16
    80005418:	ffffc097          	auipc	ra,0xffffc
    8000541c:	26c080e7          	jalr	620(ra) # 80001684 <_Znwm>
    80005420:	00050913          	mv	s2,a0
    80005424:	00100593          	li	a1,1
    80005428:	ffffd097          	auipc	ra,0xffffd
    8000542c:	c54080e7          	jalr	-940(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    80005430:	0324b823          	sd	s2,48(s1)
}
    80005434:	02813083          	ld	ra,40(sp)
    80005438:	02013403          	ld	s0,32(sp)
    8000543c:	01813483          	ld	s1,24(sp)
    80005440:	01013903          	ld	s2,16(sp)
    80005444:	00813983          	ld	s3,8(sp)
    80005448:	03010113          	addi	sp,sp,48
    8000544c:	00008067          	ret
    80005450:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005454:	00098513          	mv	a0,s3
    80005458:	ffffc097          	auipc	ra,0xffffc
    8000545c:	27c080e7          	jalr	636(ra) # 800016d4 <_ZdlPv>
    80005460:	00048513          	mv	a0,s1
    80005464:	00007097          	auipc	ra,0x7
    80005468:	484080e7          	jalr	1156(ra) # 8000c8e8 <_Unwind_Resume>
    8000546c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005470:	00098513          	mv	a0,s3
    80005474:	ffffc097          	auipc	ra,0xffffc
    80005478:	260080e7          	jalr	608(ra) # 800016d4 <_ZdlPv>
    8000547c:	00048513          	mv	a0,s1
    80005480:	00007097          	auipc	ra,0x7
    80005484:	468080e7          	jalr	1128(ra) # 8000c8e8 <_Unwind_Resume>
    80005488:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    8000548c:	00090513          	mv	a0,s2
    80005490:	ffffc097          	auipc	ra,0xffffc
    80005494:	244080e7          	jalr	580(ra) # 800016d4 <_ZdlPv>
    80005498:	00048513          	mv	a0,s1
    8000549c:	00007097          	auipc	ra,0x7
    800054a0:	44c080e7          	jalr	1100(ra) # 8000c8e8 <_Unwind_Resume>
    800054a4:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800054a8:	00090513          	mv	a0,s2
    800054ac:	ffffc097          	auipc	ra,0xffffc
    800054b0:	228080e7          	jalr	552(ra) # 800016d4 <_ZdlPv>
    800054b4:	00048513          	mv	a0,s1
    800054b8:	00007097          	auipc	ra,0x7
    800054bc:	430080e7          	jalr	1072(ra) # 8000c8e8 <_Unwind_Resume>

00000000800054c0 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800054c0:	fe010113          	addi	sp,sp,-32
    800054c4:	00113c23          	sd	ra,24(sp)
    800054c8:	00813823          	sd	s0,16(sp)
    800054cc:	00913423          	sd	s1,8(sp)
    800054d0:	01213023          	sd	s2,0(sp)
    800054d4:	02010413          	addi	s0,sp,32
    800054d8:	00050493          	mv	s1,a0
    800054dc:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800054e0:	01853503          	ld	a0,24(a0)
    800054e4:	ffffd097          	auipc	ra,0xffffd
    800054e8:	bd0080e7          	jalr	-1072(ra) # 800020b4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800054ec:	0304b503          	ld	a0,48(s1)
    800054f0:	ffffd097          	auipc	ra,0xffffd
    800054f4:	bc4080e7          	jalr	-1084(ra) # 800020b4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800054f8:	0084b783          	ld	a5,8(s1)
    800054fc:	0144a703          	lw	a4,20(s1)
    80005500:	00271713          	slli	a4,a4,0x2
    80005504:	00e787b3          	add	a5,a5,a4
    80005508:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000550c:	0144a783          	lw	a5,20(s1)
    80005510:	0017879b          	addiw	a5,a5,1
    80005514:	0004a703          	lw	a4,0(s1)
    80005518:	02e7e7bb          	remw	a5,a5,a4
    8000551c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005520:	0304b503          	ld	a0,48(s1)
    80005524:	ffffd097          	auipc	ra,0xffffd
    80005528:	bbc080e7          	jalr	-1092(ra) # 800020e0 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    8000552c:	0204b503          	ld	a0,32(s1)
    80005530:	ffffd097          	auipc	ra,0xffffd
    80005534:	bb0080e7          	jalr	-1104(ra) # 800020e0 <_ZN9Semaphore6signalEv>

}
    80005538:	01813083          	ld	ra,24(sp)
    8000553c:	01013403          	ld	s0,16(sp)
    80005540:	00813483          	ld	s1,8(sp)
    80005544:	00013903          	ld	s2,0(sp)
    80005548:	02010113          	addi	sp,sp,32
    8000554c:	00008067          	ret

0000000080005550 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005550:	fe010113          	addi	sp,sp,-32
    80005554:	00113c23          	sd	ra,24(sp)
    80005558:	00813823          	sd	s0,16(sp)
    8000555c:	00913423          	sd	s1,8(sp)
    80005560:	01213023          	sd	s2,0(sp)
    80005564:	02010413          	addi	s0,sp,32
    80005568:	00050493          	mv	s1,a0
    itemAvailable->wait();
    8000556c:	02053503          	ld	a0,32(a0)
    80005570:	ffffd097          	auipc	ra,0xffffd
    80005574:	b44080e7          	jalr	-1212(ra) # 800020b4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005578:	0284b503          	ld	a0,40(s1)
    8000557c:	ffffd097          	auipc	ra,0xffffd
    80005580:	b38080e7          	jalr	-1224(ra) # 800020b4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005584:	0084b703          	ld	a4,8(s1)
    80005588:	0104a783          	lw	a5,16(s1)
    8000558c:	00279693          	slli	a3,a5,0x2
    80005590:	00d70733          	add	a4,a4,a3
    80005594:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005598:	0017879b          	addiw	a5,a5,1
    8000559c:	0004a703          	lw	a4,0(s1)
    800055a0:	02e7e7bb          	remw	a5,a5,a4
    800055a4:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800055a8:	0284b503          	ld	a0,40(s1)
    800055ac:	ffffd097          	auipc	ra,0xffffd
    800055b0:	b34080e7          	jalr	-1228(ra) # 800020e0 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800055b4:	0184b503          	ld	a0,24(s1)
    800055b8:	ffffd097          	auipc	ra,0xffffd
    800055bc:	b28080e7          	jalr	-1240(ra) # 800020e0 <_ZN9Semaphore6signalEv>

    return ret;
}
    800055c0:	00090513          	mv	a0,s2
    800055c4:	01813083          	ld	ra,24(sp)
    800055c8:	01013403          	ld	s0,16(sp)
    800055cc:	00813483          	ld	s1,8(sp)
    800055d0:	00013903          	ld	s2,0(sp)
    800055d4:	02010113          	addi	sp,sp,32
    800055d8:	00008067          	ret

00000000800055dc <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800055dc:	fe010113          	addi	sp,sp,-32
    800055e0:	00113c23          	sd	ra,24(sp)
    800055e4:	00813823          	sd	s0,16(sp)
    800055e8:	00913423          	sd	s1,8(sp)
    800055ec:	01213023          	sd	s2,0(sp)
    800055f0:	02010413          	addi	s0,sp,32
    800055f4:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800055f8:	02853503          	ld	a0,40(a0)
    800055fc:	ffffd097          	auipc	ra,0xffffd
    80005600:	ab8080e7          	jalr	-1352(ra) # 800020b4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005604:	0304b503          	ld	a0,48(s1)
    80005608:	ffffd097          	auipc	ra,0xffffd
    8000560c:	aac080e7          	jalr	-1364(ra) # 800020b4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005610:	0144a783          	lw	a5,20(s1)
    80005614:	0104a903          	lw	s2,16(s1)
    80005618:	0327ce63          	blt	a5,s2,80005654 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    8000561c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005620:	0304b503          	ld	a0,48(s1)
    80005624:	ffffd097          	auipc	ra,0xffffd
    80005628:	abc080e7          	jalr	-1348(ra) # 800020e0 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    8000562c:	0284b503          	ld	a0,40(s1)
    80005630:	ffffd097          	auipc	ra,0xffffd
    80005634:	ab0080e7          	jalr	-1360(ra) # 800020e0 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005638:	00090513          	mv	a0,s2
    8000563c:	01813083          	ld	ra,24(sp)
    80005640:	01013403          	ld	s0,16(sp)
    80005644:	00813483          	ld	s1,8(sp)
    80005648:	00013903          	ld	s2,0(sp)
    8000564c:	02010113          	addi	sp,sp,32
    80005650:	00008067          	ret
        ret = cap - head + tail;
    80005654:	0004a703          	lw	a4,0(s1)
    80005658:	4127093b          	subw	s2,a4,s2
    8000565c:	00f9093b          	addw	s2,s2,a5
    80005660:	fc1ff06f          	j	80005620 <_ZN9BufferCPP6getCntEv+0x44>

0000000080005664 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005664:	fe010113          	addi	sp,sp,-32
    80005668:	00113c23          	sd	ra,24(sp)
    8000566c:	00813823          	sd	s0,16(sp)
    80005670:	00913423          	sd	s1,8(sp)
    80005674:	02010413          	addi	s0,sp,32
    80005678:	00050493          	mv	s1,a0
    Console::putc('\n');
    8000567c:	00a00513          	li	a0,10
    80005680:	ffffd097          	auipc	ra,0xffffd
    80005684:	ad4080e7          	jalr	-1324(ra) # 80002154 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80005688:	00004517          	auipc	a0,0x4
    8000568c:	d6050513          	addi	a0,a0,-672 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80005690:	00000097          	auipc	ra,0x0
    80005694:	a0c080e7          	jalr	-1524(ra) # 8000509c <_Z11printStringPKc>
    while (getCnt()) {
    80005698:	00048513          	mv	a0,s1
    8000569c:	00000097          	auipc	ra,0x0
    800056a0:	f40080e7          	jalr	-192(ra) # 800055dc <_ZN9BufferCPP6getCntEv>
    800056a4:	02050c63          	beqz	a0,800056dc <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800056a8:	0084b783          	ld	a5,8(s1)
    800056ac:	0104a703          	lw	a4,16(s1)
    800056b0:	00271713          	slli	a4,a4,0x2
    800056b4:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800056b8:	0007c503          	lbu	a0,0(a5)
    800056bc:	ffffd097          	auipc	ra,0xffffd
    800056c0:	a98080e7          	jalr	-1384(ra) # 80002154 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800056c4:	0104a783          	lw	a5,16(s1)
    800056c8:	0017879b          	addiw	a5,a5,1
    800056cc:	0004a703          	lw	a4,0(s1)
    800056d0:	02e7e7bb          	remw	a5,a5,a4
    800056d4:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800056d8:	fc1ff06f          	j	80005698 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800056dc:	02100513          	li	a0,33
    800056e0:	ffffd097          	auipc	ra,0xffffd
    800056e4:	a74080e7          	jalr	-1420(ra) # 80002154 <_ZN7Console4putcEc>
    Console::putc('\n');
    800056e8:	00a00513          	li	a0,10
    800056ec:	ffffd097          	auipc	ra,0xffffd
    800056f0:	a68080e7          	jalr	-1432(ra) # 80002154 <_ZN7Console4putcEc>
    mem_free(buffer);
    800056f4:	0084b503          	ld	a0,8(s1)
    800056f8:	ffffc097          	auipc	ra,0xffffc
    800056fc:	cdc080e7          	jalr	-804(ra) # 800013d4 <_Z8mem_freePv>
    delete itemAvailable;
    80005700:	0204b503          	ld	a0,32(s1)
    80005704:	00050863          	beqz	a0,80005714 <_ZN9BufferCPPD1Ev+0xb0>
    80005708:	00053783          	ld	a5,0(a0)
    8000570c:	0087b783          	ld	a5,8(a5)
    80005710:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005714:	0184b503          	ld	a0,24(s1)
    80005718:	00050863          	beqz	a0,80005728 <_ZN9BufferCPPD1Ev+0xc4>
    8000571c:	00053783          	ld	a5,0(a0)
    80005720:	0087b783          	ld	a5,8(a5)
    80005724:	000780e7          	jalr	a5
    delete mutexTail;
    80005728:	0304b503          	ld	a0,48(s1)
    8000572c:	00050863          	beqz	a0,8000573c <_ZN9BufferCPPD1Ev+0xd8>
    80005730:	00053783          	ld	a5,0(a0)
    80005734:	0087b783          	ld	a5,8(a5)
    80005738:	000780e7          	jalr	a5
    delete mutexHead;
    8000573c:	0284b503          	ld	a0,40(s1)
    80005740:	00050863          	beqz	a0,80005750 <_ZN9BufferCPPD1Ev+0xec>
    80005744:	00053783          	ld	a5,0(a0)
    80005748:	0087b783          	ld	a5,8(a5)
    8000574c:	000780e7          	jalr	a5
}
    80005750:	01813083          	ld	ra,24(sp)
    80005754:	01013403          	ld	s0,16(sp)
    80005758:	00813483          	ld	s1,8(sp)
    8000575c:	02010113          	addi	sp,sp,32
    80005760:	00008067          	ret

0000000080005764 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80005764:	fe010113          	addi	sp,sp,-32
    80005768:	00113c23          	sd	ra,24(sp)
    8000576c:	00813823          	sd	s0,16(sp)
    80005770:	00913423          	sd	s1,8(sp)
    80005774:	01213023          	sd	s2,0(sp)
    80005778:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-8]\n");
    8000577c:	00004517          	auipc	a0,0x4
    80005780:	c8450513          	addi	a0,a0,-892 # 80009400 <CONSOLE_STATUS+0x3f0>
    80005784:	00000097          	auipc	ra,0x0
    80005788:	918080e7          	jalr	-1768(ra) # 8000509c <_Z11printStringPKc>
    int test = getc() - '0';
    8000578c:	ffffc097          	auipc	ra,0xffffc
    80005790:	e28080e7          	jalr	-472(ra) # 800015b4 <_Z4getcv>
    80005794:	00050913          	mv	s2,a0
    80005798:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    8000579c:	ffffc097          	auipc	ra,0xffffc
    800057a0:	e18080e7          	jalr	-488(ra) # 800015b4 <_Z4getcv>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
            return;
        }
    }

    if (test >= 5 && test <= 6) {
    800057a4:	fcb9091b          	addiw	s2,s2,-53
    800057a8:	00100793          	li	a5,1
    800057ac:	0327f463          	bgeu	a5,s2,800057d4 <_Z8userMainv+0x70>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800057b0:	00800793          	li	a5,8
    800057b4:	1097e063          	bltu	a5,s1,800058b4 <_Z8userMainv+0x150>
    800057b8:	00249493          	slli	s1,s1,0x2
    800057bc:	00004717          	auipc	a4,0x4
    800057c0:	e8470713          	addi	a4,a4,-380 # 80009640 <CONSOLE_STATUS+0x630>
    800057c4:	00e484b3          	add	s1,s1,a4
    800057c8:	0004a783          	lw	a5,0(s1)
    800057cc:	00e787b3          	add	a5,a5,a4
    800057d0:	00078067          	jr	a5
            printString("Nije navedeno da je zadatak 4 implementiran\n");
    800057d4:	00004517          	auipc	a0,0x4
    800057d8:	c4c50513          	addi	a0,a0,-948 # 80009420 <CONSOLE_STATUS+0x410>
    800057dc:	00000097          	auipc	ra,0x0
    800057e0:	8c0080e7          	jalr	-1856(ra) # 8000509c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800057e4:	01813083          	ld	ra,24(sp)
    800057e8:	01013403          	ld	s0,16(sp)
    800057ec:	00813483          	ld	s1,8(sp)
    800057f0:	00013903          	ld	s2,0(sp)
    800057f4:	02010113          	addi	sp,sp,32
    800057f8:	00008067          	ret
            Threads_C_API_test();
    800057fc:	fffff097          	auipc	ra,0xfffff
    80005800:	f18080e7          	jalr	-232(ra) # 80004714 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80005804:	00004517          	auipc	a0,0x4
    80005808:	c4c50513          	addi	a0,a0,-948 # 80009450 <CONSOLE_STATUS+0x440>
    8000580c:	00000097          	auipc	ra,0x0
    80005810:	890080e7          	jalr	-1904(ra) # 8000509c <_Z11printStringPKc>
            break;
    80005814:	fd1ff06f          	j	800057e4 <_Z8userMainv+0x80>
            Threads_CPP_API_test();
    80005818:	ffffe097          	auipc	ra,0xffffe
    8000581c:	ddc080e7          	jalr	-548(ra) # 800035f4 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80005820:	00004517          	auipc	a0,0x4
    80005824:	c7050513          	addi	a0,a0,-912 # 80009490 <CONSOLE_STATUS+0x480>
    80005828:	00000097          	auipc	ra,0x0
    8000582c:	874080e7          	jalr	-1932(ra) # 8000509c <_Z11printStringPKc>
            break;
    80005830:	fb5ff06f          	j	800057e4 <_Z8userMainv+0x80>
            producerConsumer_C_API();
    80005834:	ffffd097          	auipc	ra,0xffffd
    80005838:	614080e7          	jalr	1556(ra) # 80002e48 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    8000583c:	00004517          	auipc	a0,0x4
    80005840:	c9450513          	addi	a0,a0,-876 # 800094d0 <CONSOLE_STATUS+0x4c0>
    80005844:	00000097          	auipc	ra,0x0
    80005848:	858080e7          	jalr	-1960(ra) # 8000509c <_Z11printStringPKc>
            break;
    8000584c:	f99ff06f          	j	800057e4 <_Z8userMainv+0x80>
            producerConsumer_CPP_Sync_API();
    80005850:	fffff097          	auipc	ra,0xfffff
    80005854:	208080e7          	jalr	520(ra) # 80004a58 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80005858:	00004517          	auipc	a0,0x4
    8000585c:	cc850513          	addi	a0,a0,-824 # 80009520 <CONSOLE_STATUS+0x510>
    80005860:	00000097          	auipc	ra,0x0
    80005864:	83c080e7          	jalr	-1988(ra) # 8000509c <_Z11printStringPKc>
    80005868:	f7dff06f          	j	800057e4 <_Z8userMainv+0x80>
            System_Mode_test();
    8000586c:	00000097          	auipc	ra,0x0
    80005870:	674080e7          	jalr	1652(ra) # 80005ee0 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80005874:	00004517          	auipc	a0,0x4
    80005878:	d0450513          	addi	a0,a0,-764 # 80009578 <CONSOLE_STATUS+0x568>
    8000587c:	00000097          	auipc	ra,0x0
    80005880:	820080e7          	jalr	-2016(ra) # 8000509c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80005884:	00004517          	auipc	a0,0x4
    80005888:	d1450513          	addi	a0,a0,-748 # 80009598 <CONSOLE_STATUS+0x588>
    8000588c:	00000097          	auipc	ra,0x0
    80005890:	810080e7          	jalr	-2032(ra) # 8000509c <_Z11printStringPKc>
            break;
    80005894:	f51ff06f          	j	800057e4 <_Z8userMainv+0x80>
            modFunc();
    80005898:	ffffd097          	auipc	ra,0xffffd
    8000589c:	06c080e7          	jalr	108(ra) # 80002904 <_Z7modFuncv>
            printString("TEST 8 (modifikacija kompletna)\n");
    800058a0:	00004517          	auipc	a0,0x4
    800058a4:	d5050513          	addi	a0,a0,-688 # 800095f0 <CONSOLE_STATUS+0x5e0>
    800058a8:	fffff097          	auipc	ra,0xfffff
    800058ac:	7f4080e7          	jalr	2036(ra) # 8000509c <_Z11printStringPKc>
            break;
    800058b0:	f35ff06f          	j	800057e4 <_Z8userMainv+0x80>
            printString("Niste uneli odgovarajuci broj za test\n");
    800058b4:	00004517          	auipc	a0,0x4
    800058b8:	d6450513          	addi	a0,a0,-668 # 80009618 <CONSOLE_STATUS+0x608>
    800058bc:	fffff097          	auipc	ra,0xfffff
    800058c0:	7e0080e7          	jalr	2016(ra) # 8000509c <_Z11printStringPKc>
    800058c4:	f21ff06f          	j	800057e4 <_Z8userMainv+0x80>

00000000800058c8 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800058c8:	fe010113          	addi	sp,sp,-32
    800058cc:	00113c23          	sd	ra,24(sp)
    800058d0:	00813823          	sd	s0,16(sp)
    800058d4:	00913423          	sd	s1,8(sp)
    800058d8:	01213023          	sd	s2,0(sp)
    800058dc:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800058e0:	00053903          	ld	s2,0(a0)
    int i = 6;
    800058e4:	00600493          	li	s1,6
    while (--i > 0) {
    800058e8:	fff4849b          	addiw	s1,s1,-1
    800058ec:	04905463          	blez	s1,80005934 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800058f0:	00004517          	auipc	a0,0x4
    800058f4:	d7850513          	addi	a0,a0,-648 # 80009668 <CONSOLE_STATUS+0x658>
    800058f8:	fffff097          	auipc	ra,0xfffff
    800058fc:	7a4080e7          	jalr	1956(ra) # 8000509c <_Z11printStringPKc>
        printInt(sleep_time);
    80005900:	00000613          	li	a2,0
    80005904:	00a00593          	li	a1,10
    80005908:	0009051b          	sext.w	a0,s2
    8000590c:	00000097          	auipc	ra,0x0
    80005910:	940080e7          	jalr	-1728(ra) # 8000524c <_Z8printIntiii>
        printString(" !\n");
    80005914:	00004517          	auipc	a0,0x4
    80005918:	d5c50513          	addi	a0,a0,-676 # 80009670 <CONSOLE_STATUS+0x660>
    8000591c:	fffff097          	auipc	ra,0xfffff
    80005920:	780080e7          	jalr	1920(ra) # 8000509c <_Z11printStringPKc>
        time_sleep(sleep_time);
    80005924:	00090513          	mv	a0,s2
    80005928:	ffffc097          	auipc	ra,0xffffc
    8000592c:	cd8080e7          	jalr	-808(ra) # 80001600 <_Z10time_sleepm>
    while (--i > 0) {
    80005930:	fb9ff06f          	j	800058e8 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80005934:	00a00793          	li	a5,10
    80005938:	02f95933          	divu	s2,s2,a5
    8000593c:	fff90913          	addi	s2,s2,-1
    80005940:	00006797          	auipc	a5,0x6
    80005944:	ed078793          	addi	a5,a5,-304 # 8000b810 <_ZL8finished>
    80005948:	01278933          	add	s2,a5,s2
    8000594c:	00100793          	li	a5,1
    80005950:	00f90023          	sb	a5,0(s2)
}
    80005954:	01813083          	ld	ra,24(sp)
    80005958:	01013403          	ld	s0,16(sp)
    8000595c:	00813483          	ld	s1,8(sp)
    80005960:	00013903          	ld	s2,0(sp)
    80005964:	02010113          	addi	sp,sp,32
    80005968:	00008067          	ret

000000008000596c <_Z12testSleepingv>:

void testSleeping() {
    8000596c:	fc010113          	addi	sp,sp,-64
    80005970:	02113c23          	sd	ra,56(sp)
    80005974:	02813823          	sd	s0,48(sp)
    80005978:	02913423          	sd	s1,40(sp)
    8000597c:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80005980:	00a00793          	li	a5,10
    80005984:	fcf43823          	sd	a5,-48(s0)
    80005988:	01400793          	li	a5,20
    8000598c:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80005990:	00000493          	li	s1,0
    80005994:	02c0006f          	j	800059c0 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80005998:	00349793          	slli	a5,s1,0x3
    8000599c:	fd040613          	addi	a2,s0,-48
    800059a0:	00f60633          	add	a2,a2,a5
    800059a4:	00000597          	auipc	a1,0x0
    800059a8:	f2458593          	addi	a1,a1,-220 # 800058c8 <_ZL9sleepyRunPv>
    800059ac:	fc040513          	addi	a0,s0,-64
    800059b0:	00f50533          	add	a0,a0,a5
    800059b4:	ffffc097          	auipc	ra,0xffffc
    800059b8:	aa4080e7          	jalr	-1372(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800059bc:	0014849b          	addiw	s1,s1,1
    800059c0:	00100793          	li	a5,1
    800059c4:	fc97dae3          	bge	a5,s1,80005998 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800059c8:	00006797          	auipc	a5,0x6
    800059cc:	e487c783          	lbu	a5,-440(a5) # 8000b810 <_ZL8finished>
    800059d0:	fe078ce3          	beqz	a5,800059c8 <_Z12testSleepingv+0x5c>
    800059d4:	00006797          	auipc	a5,0x6
    800059d8:	e3d7c783          	lbu	a5,-451(a5) # 8000b811 <_ZL8finished+0x1>
    800059dc:	fe0786e3          	beqz	a5,800059c8 <_Z12testSleepingv+0x5c>
}
    800059e0:	03813083          	ld	ra,56(sp)
    800059e4:	03013403          	ld	s0,48(sp)
    800059e8:	02813483          	ld	s1,40(sp)
    800059ec:	04010113          	addi	sp,sp,64
    800059f0:	00008067          	ret

00000000800059f4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800059f4:	fe010113          	addi	sp,sp,-32
    800059f8:	00113c23          	sd	ra,24(sp)
    800059fc:	00813823          	sd	s0,16(sp)
    80005a00:	00913423          	sd	s1,8(sp)
    80005a04:	01213023          	sd	s2,0(sp)
    80005a08:	02010413          	addi	s0,sp,32
    80005a0c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005a10:	00100793          	li	a5,1
    80005a14:	02a7f863          	bgeu	a5,a0,80005a44 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005a18:	00a00793          	li	a5,10
    80005a1c:	02f577b3          	remu	a5,a0,a5
    80005a20:	02078e63          	beqz	a5,80005a5c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005a24:	fff48513          	addi	a0,s1,-1
    80005a28:	00000097          	auipc	ra,0x0
    80005a2c:	fcc080e7          	jalr	-52(ra) # 800059f4 <_ZL9fibonaccim>
    80005a30:	00050913          	mv	s2,a0
    80005a34:	ffe48513          	addi	a0,s1,-2
    80005a38:	00000097          	auipc	ra,0x0
    80005a3c:	fbc080e7          	jalr	-68(ra) # 800059f4 <_ZL9fibonaccim>
    80005a40:	00a90533          	add	a0,s2,a0
}
    80005a44:	01813083          	ld	ra,24(sp)
    80005a48:	01013403          	ld	s0,16(sp)
    80005a4c:	00813483          	ld	s1,8(sp)
    80005a50:	00013903          	ld	s2,0(sp)
    80005a54:	02010113          	addi	sp,sp,32
    80005a58:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005a5c:	ffffc097          	auipc	ra,0xffffc
    80005a60:	a58080e7          	jalr	-1448(ra) # 800014b4 <_Z15thread_dispatchv>
    80005a64:	fc1ff06f          	j	80005a24 <_ZL9fibonaccim+0x30>

0000000080005a68 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005a68:	fe010113          	addi	sp,sp,-32
    80005a6c:	00113c23          	sd	ra,24(sp)
    80005a70:	00813823          	sd	s0,16(sp)
    80005a74:	00913423          	sd	s1,8(sp)
    80005a78:	01213023          	sd	s2,0(sp)
    80005a7c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005a80:	00a00493          	li	s1,10
    80005a84:	0400006f          	j	80005ac4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005a88:	00004517          	auipc	a0,0x4
    80005a8c:	8c850513          	addi	a0,a0,-1848 # 80009350 <CONSOLE_STATUS+0x340>
    80005a90:	fffff097          	auipc	ra,0xfffff
    80005a94:	60c080e7          	jalr	1548(ra) # 8000509c <_Z11printStringPKc>
    80005a98:	00000613          	li	a2,0
    80005a9c:	00a00593          	li	a1,10
    80005aa0:	00048513          	mv	a0,s1
    80005aa4:	fffff097          	auipc	ra,0xfffff
    80005aa8:	7a8080e7          	jalr	1960(ra) # 8000524c <_Z8printIntiii>
    80005aac:	00004517          	auipc	a0,0x4
    80005ab0:	ac450513          	addi	a0,a0,-1340 # 80009570 <CONSOLE_STATUS+0x560>
    80005ab4:	fffff097          	auipc	ra,0xfffff
    80005ab8:	5e8080e7          	jalr	1512(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005abc:	0014849b          	addiw	s1,s1,1
    80005ac0:	0ff4f493          	andi	s1,s1,255
    80005ac4:	00c00793          	li	a5,12
    80005ac8:	fc97f0e3          	bgeu	a5,s1,80005a88 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005acc:	00004517          	auipc	a0,0x4
    80005ad0:	88c50513          	addi	a0,a0,-1908 # 80009358 <CONSOLE_STATUS+0x348>
    80005ad4:	fffff097          	auipc	ra,0xfffff
    80005ad8:	5c8080e7          	jalr	1480(ra) # 8000509c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005adc:	00500313          	li	t1,5
    thread_dispatch();
    80005ae0:	ffffc097          	auipc	ra,0xffffc
    80005ae4:	9d4080e7          	jalr	-1580(ra) # 800014b4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005ae8:	01000513          	li	a0,16
    80005aec:	00000097          	auipc	ra,0x0
    80005af0:	f08080e7          	jalr	-248(ra) # 800059f4 <_ZL9fibonaccim>
    80005af4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005af8:	00004517          	auipc	a0,0x4
    80005afc:	87050513          	addi	a0,a0,-1936 # 80009368 <CONSOLE_STATUS+0x358>
    80005b00:	fffff097          	auipc	ra,0xfffff
    80005b04:	59c080e7          	jalr	1436(ra) # 8000509c <_Z11printStringPKc>
    80005b08:	00000613          	li	a2,0
    80005b0c:	00a00593          	li	a1,10
    80005b10:	0009051b          	sext.w	a0,s2
    80005b14:	fffff097          	auipc	ra,0xfffff
    80005b18:	738080e7          	jalr	1848(ra) # 8000524c <_Z8printIntiii>
    80005b1c:	00004517          	auipc	a0,0x4
    80005b20:	a5450513          	addi	a0,a0,-1452 # 80009570 <CONSOLE_STATUS+0x560>
    80005b24:	fffff097          	auipc	ra,0xfffff
    80005b28:	578080e7          	jalr	1400(ra) # 8000509c <_Z11printStringPKc>
    80005b2c:	0400006f          	j	80005b6c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005b30:	00004517          	auipc	a0,0x4
    80005b34:	82050513          	addi	a0,a0,-2016 # 80009350 <CONSOLE_STATUS+0x340>
    80005b38:	fffff097          	auipc	ra,0xfffff
    80005b3c:	564080e7          	jalr	1380(ra) # 8000509c <_Z11printStringPKc>
    80005b40:	00000613          	li	a2,0
    80005b44:	00a00593          	li	a1,10
    80005b48:	00048513          	mv	a0,s1
    80005b4c:	fffff097          	auipc	ra,0xfffff
    80005b50:	700080e7          	jalr	1792(ra) # 8000524c <_Z8printIntiii>
    80005b54:	00004517          	auipc	a0,0x4
    80005b58:	a1c50513          	addi	a0,a0,-1508 # 80009570 <CONSOLE_STATUS+0x560>
    80005b5c:	fffff097          	auipc	ra,0xfffff
    80005b60:	540080e7          	jalr	1344(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005b64:	0014849b          	addiw	s1,s1,1
    80005b68:	0ff4f493          	andi	s1,s1,255
    80005b6c:	00f00793          	li	a5,15
    80005b70:	fc97f0e3          	bgeu	a5,s1,80005b30 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005b74:	00004517          	auipc	a0,0x4
    80005b78:	80450513          	addi	a0,a0,-2044 # 80009378 <CONSOLE_STATUS+0x368>
    80005b7c:	fffff097          	auipc	ra,0xfffff
    80005b80:	520080e7          	jalr	1312(ra) # 8000509c <_Z11printStringPKc>
    finishedD = true;
    80005b84:	00100793          	li	a5,1
    80005b88:	00006717          	auipc	a4,0x6
    80005b8c:	c8f70523          	sb	a5,-886(a4) # 8000b812 <_ZL9finishedD>
    thread_dispatch();
    80005b90:	ffffc097          	auipc	ra,0xffffc
    80005b94:	924080e7          	jalr	-1756(ra) # 800014b4 <_Z15thread_dispatchv>
}
    80005b98:	01813083          	ld	ra,24(sp)
    80005b9c:	01013403          	ld	s0,16(sp)
    80005ba0:	00813483          	ld	s1,8(sp)
    80005ba4:	00013903          	ld	s2,0(sp)
    80005ba8:	02010113          	addi	sp,sp,32
    80005bac:	00008067          	ret

0000000080005bb0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005bb0:	fe010113          	addi	sp,sp,-32
    80005bb4:	00113c23          	sd	ra,24(sp)
    80005bb8:	00813823          	sd	s0,16(sp)
    80005bbc:	00913423          	sd	s1,8(sp)
    80005bc0:	01213023          	sd	s2,0(sp)
    80005bc4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005bc8:	00000493          	li	s1,0
    80005bcc:	0400006f          	j	80005c0c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005bd0:	00003517          	auipc	a0,0x3
    80005bd4:	74050513          	addi	a0,a0,1856 # 80009310 <CONSOLE_STATUS+0x300>
    80005bd8:	fffff097          	auipc	ra,0xfffff
    80005bdc:	4c4080e7          	jalr	1220(ra) # 8000509c <_Z11printStringPKc>
    80005be0:	00000613          	li	a2,0
    80005be4:	00a00593          	li	a1,10
    80005be8:	00048513          	mv	a0,s1
    80005bec:	fffff097          	auipc	ra,0xfffff
    80005bf0:	660080e7          	jalr	1632(ra) # 8000524c <_Z8printIntiii>
    80005bf4:	00004517          	auipc	a0,0x4
    80005bf8:	97c50513          	addi	a0,a0,-1668 # 80009570 <CONSOLE_STATUS+0x560>
    80005bfc:	fffff097          	auipc	ra,0xfffff
    80005c00:	4a0080e7          	jalr	1184(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005c04:	0014849b          	addiw	s1,s1,1
    80005c08:	0ff4f493          	andi	s1,s1,255
    80005c0c:	00200793          	li	a5,2
    80005c10:	fc97f0e3          	bgeu	a5,s1,80005bd0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005c14:	00003517          	auipc	a0,0x3
    80005c18:	70450513          	addi	a0,a0,1796 # 80009318 <CONSOLE_STATUS+0x308>
    80005c1c:	fffff097          	auipc	ra,0xfffff
    80005c20:	480080e7          	jalr	1152(ra) # 8000509c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005c24:	00700313          	li	t1,7
    thread_dispatch();
    80005c28:	ffffc097          	auipc	ra,0xffffc
    80005c2c:	88c080e7          	jalr	-1908(ra) # 800014b4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005c30:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005c34:	00003517          	auipc	a0,0x3
    80005c38:	6f450513          	addi	a0,a0,1780 # 80009328 <CONSOLE_STATUS+0x318>
    80005c3c:	fffff097          	auipc	ra,0xfffff
    80005c40:	460080e7          	jalr	1120(ra) # 8000509c <_Z11printStringPKc>
    80005c44:	00000613          	li	a2,0
    80005c48:	00a00593          	li	a1,10
    80005c4c:	0009051b          	sext.w	a0,s2
    80005c50:	fffff097          	auipc	ra,0xfffff
    80005c54:	5fc080e7          	jalr	1532(ra) # 8000524c <_Z8printIntiii>
    80005c58:	00004517          	auipc	a0,0x4
    80005c5c:	91850513          	addi	a0,a0,-1768 # 80009570 <CONSOLE_STATUS+0x560>
    80005c60:	fffff097          	auipc	ra,0xfffff
    80005c64:	43c080e7          	jalr	1084(ra) # 8000509c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005c68:	00c00513          	li	a0,12
    80005c6c:	00000097          	auipc	ra,0x0
    80005c70:	d88080e7          	jalr	-632(ra) # 800059f4 <_ZL9fibonaccim>
    80005c74:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005c78:	00003517          	auipc	a0,0x3
    80005c7c:	6b850513          	addi	a0,a0,1720 # 80009330 <CONSOLE_STATUS+0x320>
    80005c80:	fffff097          	auipc	ra,0xfffff
    80005c84:	41c080e7          	jalr	1052(ra) # 8000509c <_Z11printStringPKc>
    80005c88:	00000613          	li	a2,0
    80005c8c:	00a00593          	li	a1,10
    80005c90:	0009051b          	sext.w	a0,s2
    80005c94:	fffff097          	auipc	ra,0xfffff
    80005c98:	5b8080e7          	jalr	1464(ra) # 8000524c <_Z8printIntiii>
    80005c9c:	00004517          	auipc	a0,0x4
    80005ca0:	8d450513          	addi	a0,a0,-1836 # 80009570 <CONSOLE_STATUS+0x560>
    80005ca4:	fffff097          	auipc	ra,0xfffff
    80005ca8:	3f8080e7          	jalr	1016(ra) # 8000509c <_Z11printStringPKc>
    80005cac:	0400006f          	j	80005cec <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005cb0:	00003517          	auipc	a0,0x3
    80005cb4:	66050513          	addi	a0,a0,1632 # 80009310 <CONSOLE_STATUS+0x300>
    80005cb8:	fffff097          	auipc	ra,0xfffff
    80005cbc:	3e4080e7          	jalr	996(ra) # 8000509c <_Z11printStringPKc>
    80005cc0:	00000613          	li	a2,0
    80005cc4:	00a00593          	li	a1,10
    80005cc8:	00048513          	mv	a0,s1
    80005ccc:	fffff097          	auipc	ra,0xfffff
    80005cd0:	580080e7          	jalr	1408(ra) # 8000524c <_Z8printIntiii>
    80005cd4:	00004517          	auipc	a0,0x4
    80005cd8:	89c50513          	addi	a0,a0,-1892 # 80009570 <CONSOLE_STATUS+0x560>
    80005cdc:	fffff097          	auipc	ra,0xfffff
    80005ce0:	3c0080e7          	jalr	960(ra) # 8000509c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005ce4:	0014849b          	addiw	s1,s1,1
    80005ce8:	0ff4f493          	andi	s1,s1,255
    80005cec:	00500793          	li	a5,5
    80005cf0:	fc97f0e3          	bgeu	a5,s1,80005cb0 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80005cf4:	00003517          	auipc	a0,0x3
    80005cf8:	5f450513          	addi	a0,a0,1524 # 800092e8 <CONSOLE_STATUS+0x2d8>
    80005cfc:	fffff097          	auipc	ra,0xfffff
    80005d00:	3a0080e7          	jalr	928(ra) # 8000509c <_Z11printStringPKc>
    finishedC = true;
    80005d04:	00100793          	li	a5,1
    80005d08:	00006717          	auipc	a4,0x6
    80005d0c:	b0f705a3          	sb	a5,-1269(a4) # 8000b813 <_ZL9finishedC>
    thread_dispatch();
    80005d10:	ffffb097          	auipc	ra,0xffffb
    80005d14:	7a4080e7          	jalr	1956(ra) # 800014b4 <_Z15thread_dispatchv>
}
    80005d18:	01813083          	ld	ra,24(sp)
    80005d1c:	01013403          	ld	s0,16(sp)
    80005d20:	00813483          	ld	s1,8(sp)
    80005d24:	00013903          	ld	s2,0(sp)
    80005d28:	02010113          	addi	sp,sp,32
    80005d2c:	00008067          	ret

0000000080005d30 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005d30:	fe010113          	addi	sp,sp,-32
    80005d34:	00113c23          	sd	ra,24(sp)
    80005d38:	00813823          	sd	s0,16(sp)
    80005d3c:	00913423          	sd	s1,8(sp)
    80005d40:	01213023          	sd	s2,0(sp)
    80005d44:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005d48:	00000913          	li	s2,0
    80005d4c:	0400006f          	j	80005d8c <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80005d50:	ffffb097          	auipc	ra,0xffffb
    80005d54:	764080e7          	jalr	1892(ra) # 800014b4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005d58:	00148493          	addi	s1,s1,1
    80005d5c:	000027b7          	lui	a5,0x2
    80005d60:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005d64:	0097ee63          	bltu	a5,s1,80005d80 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005d68:	00000713          	li	a4,0
    80005d6c:	000077b7          	lui	a5,0x7
    80005d70:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005d74:	fce7eee3          	bltu	a5,a4,80005d50 <_ZL11workerBodyBPv+0x20>
    80005d78:	00170713          	addi	a4,a4,1
    80005d7c:	ff1ff06f          	j	80005d6c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80005d80:	00a00793          	li	a5,10
    80005d84:	04f90663          	beq	s2,a5,80005dd0 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80005d88:	00190913          	addi	s2,s2,1
    80005d8c:	00f00793          	li	a5,15
    80005d90:	0527e463          	bltu	a5,s2,80005dd8 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80005d94:	00003517          	auipc	a0,0x3
    80005d98:	56450513          	addi	a0,a0,1380 # 800092f8 <CONSOLE_STATUS+0x2e8>
    80005d9c:	fffff097          	auipc	ra,0xfffff
    80005da0:	300080e7          	jalr	768(ra) # 8000509c <_Z11printStringPKc>
    80005da4:	00000613          	li	a2,0
    80005da8:	00a00593          	li	a1,10
    80005dac:	0009051b          	sext.w	a0,s2
    80005db0:	fffff097          	auipc	ra,0xfffff
    80005db4:	49c080e7          	jalr	1180(ra) # 8000524c <_Z8printIntiii>
    80005db8:	00003517          	auipc	a0,0x3
    80005dbc:	7b850513          	addi	a0,a0,1976 # 80009570 <CONSOLE_STATUS+0x560>
    80005dc0:	fffff097          	auipc	ra,0xfffff
    80005dc4:	2dc080e7          	jalr	732(ra) # 8000509c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005dc8:	00000493          	li	s1,0
    80005dcc:	f91ff06f          	j	80005d5c <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80005dd0:	14102ff3          	csrr	t6,sepc
    80005dd4:	fb5ff06f          	j	80005d88 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80005dd8:	00003517          	auipc	a0,0x3
    80005ddc:	52850513          	addi	a0,a0,1320 # 80009300 <CONSOLE_STATUS+0x2f0>
    80005de0:	fffff097          	auipc	ra,0xfffff
    80005de4:	2bc080e7          	jalr	700(ra) # 8000509c <_Z11printStringPKc>
    finishedB = true;
    80005de8:	00100793          	li	a5,1
    80005dec:	00006717          	auipc	a4,0x6
    80005df0:	a2f70423          	sb	a5,-1496(a4) # 8000b814 <_ZL9finishedB>
    thread_dispatch();
    80005df4:	ffffb097          	auipc	ra,0xffffb
    80005df8:	6c0080e7          	jalr	1728(ra) # 800014b4 <_Z15thread_dispatchv>
}
    80005dfc:	01813083          	ld	ra,24(sp)
    80005e00:	01013403          	ld	s0,16(sp)
    80005e04:	00813483          	ld	s1,8(sp)
    80005e08:	00013903          	ld	s2,0(sp)
    80005e0c:	02010113          	addi	sp,sp,32
    80005e10:	00008067          	ret

0000000080005e14 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005e14:	fe010113          	addi	sp,sp,-32
    80005e18:	00113c23          	sd	ra,24(sp)
    80005e1c:	00813823          	sd	s0,16(sp)
    80005e20:	00913423          	sd	s1,8(sp)
    80005e24:	01213023          	sd	s2,0(sp)
    80005e28:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005e2c:	00000913          	li	s2,0
    80005e30:	0380006f          	j	80005e68 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005e34:	ffffb097          	auipc	ra,0xffffb
    80005e38:	680080e7          	jalr	1664(ra) # 800014b4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005e3c:	00148493          	addi	s1,s1,1
    80005e40:	000027b7          	lui	a5,0x2
    80005e44:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005e48:	0097ee63          	bltu	a5,s1,80005e64 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005e4c:	00000713          	li	a4,0
    80005e50:	000077b7          	lui	a5,0x7
    80005e54:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005e58:	fce7eee3          	bltu	a5,a4,80005e34 <_ZL11workerBodyAPv+0x20>
    80005e5c:	00170713          	addi	a4,a4,1
    80005e60:	ff1ff06f          	j	80005e50 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005e64:	00190913          	addi	s2,s2,1
    80005e68:	00900793          	li	a5,9
    80005e6c:	0527e063          	bltu	a5,s2,80005eac <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005e70:	00003517          	auipc	a0,0x3
    80005e74:	47050513          	addi	a0,a0,1136 # 800092e0 <CONSOLE_STATUS+0x2d0>
    80005e78:	fffff097          	auipc	ra,0xfffff
    80005e7c:	224080e7          	jalr	548(ra) # 8000509c <_Z11printStringPKc>
    80005e80:	00000613          	li	a2,0
    80005e84:	00a00593          	li	a1,10
    80005e88:	0009051b          	sext.w	a0,s2
    80005e8c:	fffff097          	auipc	ra,0xfffff
    80005e90:	3c0080e7          	jalr	960(ra) # 8000524c <_Z8printIntiii>
    80005e94:	00003517          	auipc	a0,0x3
    80005e98:	6dc50513          	addi	a0,a0,1756 # 80009570 <CONSOLE_STATUS+0x560>
    80005e9c:	fffff097          	auipc	ra,0xfffff
    80005ea0:	200080e7          	jalr	512(ra) # 8000509c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005ea4:	00000493          	li	s1,0
    80005ea8:	f99ff06f          	j	80005e40 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005eac:	00003517          	auipc	a0,0x3
    80005eb0:	43c50513          	addi	a0,a0,1084 # 800092e8 <CONSOLE_STATUS+0x2d8>
    80005eb4:	fffff097          	auipc	ra,0xfffff
    80005eb8:	1e8080e7          	jalr	488(ra) # 8000509c <_Z11printStringPKc>
    finishedA = true;
    80005ebc:	00100793          	li	a5,1
    80005ec0:	00006717          	auipc	a4,0x6
    80005ec4:	94f70aa3          	sb	a5,-1707(a4) # 8000b815 <_ZL9finishedA>
}
    80005ec8:	01813083          	ld	ra,24(sp)
    80005ecc:	01013403          	ld	s0,16(sp)
    80005ed0:	00813483          	ld	s1,8(sp)
    80005ed4:	00013903          	ld	s2,0(sp)
    80005ed8:	02010113          	addi	sp,sp,32
    80005edc:	00008067          	ret

0000000080005ee0 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80005ee0:	fd010113          	addi	sp,sp,-48
    80005ee4:	02113423          	sd	ra,40(sp)
    80005ee8:	02813023          	sd	s0,32(sp)
    80005eec:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005ef0:	00000613          	li	a2,0
    80005ef4:	00000597          	auipc	a1,0x0
    80005ef8:	f2058593          	addi	a1,a1,-224 # 80005e14 <_ZL11workerBodyAPv>
    80005efc:	fd040513          	addi	a0,s0,-48
    80005f00:	ffffb097          	auipc	ra,0xffffb
    80005f04:	558080e7          	jalr	1368(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005f08:	00003517          	auipc	a0,0x3
    80005f0c:	48050513          	addi	a0,a0,1152 # 80009388 <CONSOLE_STATUS+0x378>
    80005f10:	fffff097          	auipc	ra,0xfffff
    80005f14:	18c080e7          	jalr	396(ra) # 8000509c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005f18:	00000613          	li	a2,0
    80005f1c:	00000597          	auipc	a1,0x0
    80005f20:	e1458593          	addi	a1,a1,-492 # 80005d30 <_ZL11workerBodyBPv>
    80005f24:	fd840513          	addi	a0,s0,-40
    80005f28:	ffffb097          	auipc	ra,0xffffb
    80005f2c:	530080e7          	jalr	1328(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005f30:	00003517          	auipc	a0,0x3
    80005f34:	47050513          	addi	a0,a0,1136 # 800093a0 <CONSOLE_STATUS+0x390>
    80005f38:	fffff097          	auipc	ra,0xfffff
    80005f3c:	164080e7          	jalr	356(ra) # 8000509c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005f40:	00000613          	li	a2,0
    80005f44:	00000597          	auipc	a1,0x0
    80005f48:	c6c58593          	addi	a1,a1,-916 # 80005bb0 <_ZL11workerBodyCPv>
    80005f4c:	fe040513          	addi	a0,s0,-32
    80005f50:	ffffb097          	auipc	ra,0xffffb
    80005f54:	508080e7          	jalr	1288(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005f58:	00003517          	auipc	a0,0x3
    80005f5c:	46050513          	addi	a0,a0,1120 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80005f60:	fffff097          	auipc	ra,0xfffff
    80005f64:	13c080e7          	jalr	316(ra) # 8000509c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005f68:	00000613          	li	a2,0
    80005f6c:	00000597          	auipc	a1,0x0
    80005f70:	afc58593          	addi	a1,a1,-1284 # 80005a68 <_ZL11workerBodyDPv>
    80005f74:	fe840513          	addi	a0,s0,-24
    80005f78:	ffffb097          	auipc	ra,0xffffb
    80005f7c:	4e0080e7          	jalr	1248(ra) # 80001458 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005f80:	00003517          	auipc	a0,0x3
    80005f84:	45050513          	addi	a0,a0,1104 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80005f88:	fffff097          	auipc	ra,0xfffff
    80005f8c:	114080e7          	jalr	276(ra) # 8000509c <_Z11printStringPKc>
    80005f90:	00c0006f          	j	80005f9c <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005f94:	ffffb097          	auipc	ra,0xffffb
    80005f98:	520080e7          	jalr	1312(ra) # 800014b4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005f9c:	00006797          	auipc	a5,0x6
    80005fa0:	8797c783          	lbu	a5,-1927(a5) # 8000b815 <_ZL9finishedA>
    80005fa4:	fe0788e3          	beqz	a5,80005f94 <_Z16System_Mode_testv+0xb4>
    80005fa8:	00006797          	auipc	a5,0x6
    80005fac:	86c7c783          	lbu	a5,-1940(a5) # 8000b814 <_ZL9finishedB>
    80005fb0:	fe0782e3          	beqz	a5,80005f94 <_Z16System_Mode_testv+0xb4>
    80005fb4:	00006797          	auipc	a5,0x6
    80005fb8:	85f7c783          	lbu	a5,-1953(a5) # 8000b813 <_ZL9finishedC>
    80005fbc:	fc078ce3          	beqz	a5,80005f94 <_Z16System_Mode_testv+0xb4>
    80005fc0:	00006797          	auipc	a5,0x6
    80005fc4:	8527c783          	lbu	a5,-1966(a5) # 8000b812 <_ZL9finishedD>
    80005fc8:	fc0786e3          	beqz	a5,80005f94 <_Z16System_Mode_testv+0xb4>
    }

}
    80005fcc:	02813083          	ld	ra,40(sp)
    80005fd0:	02013403          	ld	s0,32(sp)
    80005fd4:	03010113          	addi	sp,sp,48
    80005fd8:	00008067          	ret

0000000080005fdc <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005fdc:	fe010113          	addi	sp,sp,-32
    80005fe0:	00113c23          	sd	ra,24(sp)
    80005fe4:	00813823          	sd	s0,16(sp)
    80005fe8:	00913423          	sd	s1,8(sp)
    80005fec:	01213023          	sd	s2,0(sp)
    80005ff0:	02010413          	addi	s0,sp,32
    80005ff4:	00050493          	mv	s1,a0
    80005ff8:	00058913          	mv	s2,a1
    80005ffc:	0015879b          	addiw	a5,a1,1
    80006000:	0007851b          	sext.w	a0,a5
    80006004:	00f4a023          	sw	a5,0(s1)
    80006008:	0004a823          	sw	zero,16(s1)
    8000600c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006010:	00251513          	slli	a0,a0,0x2
    80006014:	ffffb097          	auipc	ra,0xffffb
    80006018:	388080e7          	jalr	904(ra) # 8000139c <_Z9mem_allocm>
    8000601c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006020:	00000593          	li	a1,0
    80006024:	02048513          	addi	a0,s1,32
    80006028:	ffffb097          	auipc	ra,0xffffb
    8000602c:	4ac080e7          	jalr	1196(ra) # 800014d4 <_Z8sem_openPP13SyncSemaphorej>
    sem_open(&spaceAvailable, _cap);
    80006030:	00090593          	mv	a1,s2
    80006034:	01848513          	addi	a0,s1,24
    80006038:	ffffb097          	auipc	ra,0xffffb
    8000603c:	49c080e7          	jalr	1180(ra) # 800014d4 <_Z8sem_openPP13SyncSemaphorej>
    sem_open(&mutexHead, 1);
    80006040:	00100593          	li	a1,1
    80006044:	02848513          	addi	a0,s1,40
    80006048:	ffffb097          	auipc	ra,0xffffb
    8000604c:	48c080e7          	jalr	1164(ra) # 800014d4 <_Z8sem_openPP13SyncSemaphorej>
    sem_open(&mutexTail, 1);
    80006050:	00100593          	li	a1,1
    80006054:	03048513          	addi	a0,s1,48
    80006058:	ffffb097          	auipc	ra,0xffffb
    8000605c:	47c080e7          	jalr	1148(ra) # 800014d4 <_Z8sem_openPP13SyncSemaphorej>
}
    80006060:	01813083          	ld	ra,24(sp)
    80006064:	01013403          	ld	s0,16(sp)
    80006068:	00813483          	ld	s1,8(sp)
    8000606c:	00013903          	ld	s2,0(sp)
    80006070:	02010113          	addi	sp,sp,32
    80006074:	00008067          	ret

0000000080006078 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006078:	fe010113          	addi	sp,sp,-32
    8000607c:	00113c23          	sd	ra,24(sp)
    80006080:	00813823          	sd	s0,16(sp)
    80006084:	00913423          	sd	s1,8(sp)
    80006088:	01213023          	sd	s2,0(sp)
    8000608c:	02010413          	addi	s0,sp,32
    80006090:	00050493          	mv	s1,a0
    80006094:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006098:	01853503          	ld	a0,24(a0)
    8000609c:	ffffb097          	auipc	ra,0xffffb
    800060a0:	494080e7          	jalr	1172(ra) # 80001530 <_Z8sem_waitP13SyncSemaphore>

    sem_wait(mutexTail);
    800060a4:	0304b503          	ld	a0,48(s1)
    800060a8:	ffffb097          	auipc	ra,0xffffb
    800060ac:	488080e7          	jalr	1160(ra) # 80001530 <_Z8sem_waitP13SyncSemaphore>
    buffer[tail] = val;
    800060b0:	0084b783          	ld	a5,8(s1)
    800060b4:	0144a703          	lw	a4,20(s1)
    800060b8:	00271713          	slli	a4,a4,0x2
    800060bc:	00e787b3          	add	a5,a5,a4
    800060c0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800060c4:	0144a783          	lw	a5,20(s1)
    800060c8:	0017879b          	addiw	a5,a5,1
    800060cc:	0004a703          	lw	a4,0(s1)
    800060d0:	02e7e7bb          	remw	a5,a5,a4
    800060d4:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800060d8:	0304b503          	ld	a0,48(s1)
    800060dc:	ffffb097          	auipc	ra,0xffffb
    800060e0:	480080e7          	jalr	1152(ra) # 8000155c <_Z10sem_signalP13SyncSemaphore>

    sem_signal(itemAvailable);
    800060e4:	0204b503          	ld	a0,32(s1)
    800060e8:	ffffb097          	auipc	ra,0xffffb
    800060ec:	474080e7          	jalr	1140(ra) # 8000155c <_Z10sem_signalP13SyncSemaphore>

}
    800060f0:	01813083          	ld	ra,24(sp)
    800060f4:	01013403          	ld	s0,16(sp)
    800060f8:	00813483          	ld	s1,8(sp)
    800060fc:	00013903          	ld	s2,0(sp)
    80006100:	02010113          	addi	sp,sp,32
    80006104:	00008067          	ret

0000000080006108 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006108:	fe010113          	addi	sp,sp,-32
    8000610c:	00113c23          	sd	ra,24(sp)
    80006110:	00813823          	sd	s0,16(sp)
    80006114:	00913423          	sd	s1,8(sp)
    80006118:	01213023          	sd	s2,0(sp)
    8000611c:	02010413          	addi	s0,sp,32
    80006120:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006124:	02053503          	ld	a0,32(a0)
    80006128:	ffffb097          	auipc	ra,0xffffb
    8000612c:	408080e7          	jalr	1032(ra) # 80001530 <_Z8sem_waitP13SyncSemaphore>

    sem_wait(mutexHead);
    80006130:	0284b503          	ld	a0,40(s1)
    80006134:	ffffb097          	auipc	ra,0xffffb
    80006138:	3fc080e7          	jalr	1020(ra) # 80001530 <_Z8sem_waitP13SyncSemaphore>

    int ret = buffer[head];
    8000613c:	0084b703          	ld	a4,8(s1)
    80006140:	0104a783          	lw	a5,16(s1)
    80006144:	00279693          	slli	a3,a5,0x2
    80006148:	00d70733          	add	a4,a4,a3
    8000614c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006150:	0017879b          	addiw	a5,a5,1
    80006154:	0004a703          	lw	a4,0(s1)
    80006158:	02e7e7bb          	remw	a5,a5,a4
    8000615c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006160:	0284b503          	ld	a0,40(s1)
    80006164:	ffffb097          	auipc	ra,0xffffb
    80006168:	3f8080e7          	jalr	1016(ra) # 8000155c <_Z10sem_signalP13SyncSemaphore>

    sem_signal(spaceAvailable);
    8000616c:	0184b503          	ld	a0,24(s1)
    80006170:	ffffb097          	auipc	ra,0xffffb
    80006174:	3ec080e7          	jalr	1004(ra) # 8000155c <_Z10sem_signalP13SyncSemaphore>

    return ret;
}
    80006178:	00090513          	mv	a0,s2
    8000617c:	01813083          	ld	ra,24(sp)
    80006180:	01013403          	ld	s0,16(sp)
    80006184:	00813483          	ld	s1,8(sp)
    80006188:	00013903          	ld	s2,0(sp)
    8000618c:	02010113          	addi	sp,sp,32
    80006190:	00008067          	ret

0000000080006194 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006194:	fe010113          	addi	sp,sp,-32
    80006198:	00113c23          	sd	ra,24(sp)
    8000619c:	00813823          	sd	s0,16(sp)
    800061a0:	00913423          	sd	s1,8(sp)
    800061a4:	01213023          	sd	s2,0(sp)
    800061a8:	02010413          	addi	s0,sp,32
    800061ac:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800061b0:	02853503          	ld	a0,40(a0)
    800061b4:	ffffb097          	auipc	ra,0xffffb
    800061b8:	37c080e7          	jalr	892(ra) # 80001530 <_Z8sem_waitP13SyncSemaphore>
    sem_wait(mutexTail);
    800061bc:	0304b503          	ld	a0,48(s1)
    800061c0:	ffffb097          	auipc	ra,0xffffb
    800061c4:	370080e7          	jalr	880(ra) # 80001530 <_Z8sem_waitP13SyncSemaphore>

    if (tail >= head) {
    800061c8:	0144a783          	lw	a5,20(s1)
    800061cc:	0104a903          	lw	s2,16(s1)
    800061d0:	0327ce63          	blt	a5,s2,8000620c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800061d4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800061d8:	0304b503          	ld	a0,48(s1)
    800061dc:	ffffb097          	auipc	ra,0xffffb
    800061e0:	380080e7          	jalr	896(ra) # 8000155c <_Z10sem_signalP13SyncSemaphore>
    sem_signal(mutexHead);
    800061e4:	0284b503          	ld	a0,40(s1)
    800061e8:	ffffb097          	auipc	ra,0xffffb
    800061ec:	374080e7          	jalr	884(ra) # 8000155c <_Z10sem_signalP13SyncSemaphore>

    return ret;
}
    800061f0:	00090513          	mv	a0,s2
    800061f4:	01813083          	ld	ra,24(sp)
    800061f8:	01013403          	ld	s0,16(sp)
    800061fc:	00813483          	ld	s1,8(sp)
    80006200:	00013903          	ld	s2,0(sp)
    80006204:	02010113          	addi	sp,sp,32
    80006208:	00008067          	ret
        ret = cap - head + tail;
    8000620c:	0004a703          	lw	a4,0(s1)
    80006210:	4127093b          	subw	s2,a4,s2
    80006214:	00f9093b          	addw	s2,s2,a5
    80006218:	fc1ff06f          	j	800061d8 <_ZN6Buffer6getCntEv+0x44>

000000008000621c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    8000621c:	fe010113          	addi	sp,sp,-32
    80006220:	00113c23          	sd	ra,24(sp)
    80006224:	00813823          	sd	s0,16(sp)
    80006228:	00913423          	sd	s1,8(sp)
    8000622c:	02010413          	addi	s0,sp,32
    80006230:	00050493          	mv	s1,a0
    putc('\n');
    80006234:	00a00513          	li	a0,10
    80006238:	ffffb097          	auipc	ra,0xffffb
    8000623c:	3a4080e7          	jalr	932(ra) # 800015dc <_Z4putcc>
    printString("Buffer deleted!\n");
    80006240:	00003517          	auipc	a0,0x3
    80006244:	1a850513          	addi	a0,a0,424 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80006248:	fffff097          	auipc	ra,0xfffff
    8000624c:	e54080e7          	jalr	-428(ra) # 8000509c <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006250:	00048513          	mv	a0,s1
    80006254:	00000097          	auipc	ra,0x0
    80006258:	f40080e7          	jalr	-192(ra) # 80006194 <_ZN6Buffer6getCntEv>
    8000625c:	02a05c63          	blez	a0,80006294 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006260:	0084b783          	ld	a5,8(s1)
    80006264:	0104a703          	lw	a4,16(s1)
    80006268:	00271713          	slli	a4,a4,0x2
    8000626c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006270:	0007c503          	lbu	a0,0(a5)
    80006274:	ffffb097          	auipc	ra,0xffffb
    80006278:	368080e7          	jalr	872(ra) # 800015dc <_Z4putcc>
        head = (head + 1) % cap;
    8000627c:	0104a783          	lw	a5,16(s1)
    80006280:	0017879b          	addiw	a5,a5,1
    80006284:	0004a703          	lw	a4,0(s1)
    80006288:	02e7e7bb          	remw	a5,a5,a4
    8000628c:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006290:	fc1ff06f          	j	80006250 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006294:	02100513          	li	a0,33
    80006298:	ffffb097          	auipc	ra,0xffffb
    8000629c:	344080e7          	jalr	836(ra) # 800015dc <_Z4putcc>
    putc('\n');
    800062a0:	00a00513          	li	a0,10
    800062a4:	ffffb097          	auipc	ra,0xffffb
    800062a8:	338080e7          	jalr	824(ra) # 800015dc <_Z4putcc>
    mem_free(buffer);
    800062ac:	0084b503          	ld	a0,8(s1)
    800062b0:	ffffb097          	auipc	ra,0xffffb
    800062b4:	124080e7          	jalr	292(ra) # 800013d4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800062b8:	0204b503          	ld	a0,32(s1)
    800062bc:	ffffb097          	auipc	ra,0xffffb
    800062c0:	248080e7          	jalr	584(ra) # 80001504 <_Z9sem_closeP13SyncSemaphore>
    sem_close(spaceAvailable);
    800062c4:	0184b503          	ld	a0,24(s1)
    800062c8:	ffffb097          	auipc	ra,0xffffb
    800062cc:	23c080e7          	jalr	572(ra) # 80001504 <_Z9sem_closeP13SyncSemaphore>
    sem_close(mutexTail);
    800062d0:	0304b503          	ld	a0,48(s1)
    800062d4:	ffffb097          	auipc	ra,0xffffb
    800062d8:	230080e7          	jalr	560(ra) # 80001504 <_Z9sem_closeP13SyncSemaphore>
    sem_close(mutexHead);
    800062dc:	0284b503          	ld	a0,40(s1)
    800062e0:	ffffb097          	auipc	ra,0xffffb
    800062e4:	224080e7          	jalr	548(ra) # 80001504 <_Z9sem_closeP13SyncSemaphore>
}
    800062e8:	01813083          	ld	ra,24(sp)
    800062ec:	01013403          	ld	s0,16(sp)
    800062f0:	00813483          	ld	s1,8(sp)
    800062f4:	02010113          	addi	sp,sp,32
    800062f8:	00008067          	ret

00000000800062fc <start>:
    800062fc:	ff010113          	addi	sp,sp,-16
    80006300:	00813423          	sd	s0,8(sp)
    80006304:	01010413          	addi	s0,sp,16
    80006308:	300027f3          	csrr	a5,mstatus
    8000630c:	ffffe737          	lui	a4,0xffffe
    80006310:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1d7f>
    80006314:	00e7f7b3          	and	a5,a5,a4
    80006318:	00001737          	lui	a4,0x1
    8000631c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006320:	00e7e7b3          	or	a5,a5,a4
    80006324:	30079073          	csrw	mstatus,a5
    80006328:	00000797          	auipc	a5,0x0
    8000632c:	16078793          	addi	a5,a5,352 # 80006488 <system_main>
    80006330:	34179073          	csrw	mepc,a5
    80006334:	00000793          	li	a5,0
    80006338:	18079073          	csrw	satp,a5
    8000633c:	000107b7          	lui	a5,0x10
    80006340:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006344:	30279073          	csrw	medeleg,a5
    80006348:	30379073          	csrw	mideleg,a5
    8000634c:	104027f3          	csrr	a5,sie
    80006350:	2227e793          	ori	a5,a5,546
    80006354:	10479073          	csrw	sie,a5
    80006358:	fff00793          	li	a5,-1
    8000635c:	00a7d793          	srli	a5,a5,0xa
    80006360:	3b079073          	csrw	pmpaddr0,a5
    80006364:	00f00793          	li	a5,15
    80006368:	3a079073          	csrw	pmpcfg0,a5
    8000636c:	f14027f3          	csrr	a5,mhartid
    80006370:	0200c737          	lui	a4,0x200c
    80006374:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006378:	0007869b          	sext.w	a3,a5
    8000637c:	00269713          	slli	a4,a3,0x2
    80006380:	000f4637          	lui	a2,0xf4
    80006384:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006388:	00d70733          	add	a4,a4,a3
    8000638c:	0037979b          	slliw	a5,a5,0x3
    80006390:	020046b7          	lui	a3,0x2004
    80006394:	00d787b3          	add	a5,a5,a3
    80006398:	00c585b3          	add	a1,a1,a2
    8000639c:	00371693          	slli	a3,a4,0x3
    800063a0:	00005717          	auipc	a4,0x5
    800063a4:	48070713          	addi	a4,a4,1152 # 8000b820 <timer_scratch>
    800063a8:	00b7b023          	sd	a1,0(a5)
    800063ac:	00d70733          	add	a4,a4,a3
    800063b0:	00f73c23          	sd	a5,24(a4)
    800063b4:	02c73023          	sd	a2,32(a4)
    800063b8:	34071073          	csrw	mscratch,a4
    800063bc:	00000797          	auipc	a5,0x0
    800063c0:	6e478793          	addi	a5,a5,1764 # 80006aa0 <timervec>
    800063c4:	30579073          	csrw	mtvec,a5
    800063c8:	300027f3          	csrr	a5,mstatus
    800063cc:	0087e793          	ori	a5,a5,8
    800063d0:	30079073          	csrw	mstatus,a5
    800063d4:	304027f3          	csrr	a5,mie
    800063d8:	0807e793          	ori	a5,a5,128
    800063dc:	30479073          	csrw	mie,a5
    800063e0:	f14027f3          	csrr	a5,mhartid
    800063e4:	0007879b          	sext.w	a5,a5
    800063e8:	00078213          	mv	tp,a5
    800063ec:	30200073          	mret
    800063f0:	00813403          	ld	s0,8(sp)
    800063f4:	01010113          	addi	sp,sp,16
    800063f8:	00008067          	ret

00000000800063fc <timerinit>:
    800063fc:	ff010113          	addi	sp,sp,-16
    80006400:	00813423          	sd	s0,8(sp)
    80006404:	01010413          	addi	s0,sp,16
    80006408:	f14027f3          	csrr	a5,mhartid
    8000640c:	0200c737          	lui	a4,0x200c
    80006410:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006414:	0007869b          	sext.w	a3,a5
    80006418:	00269713          	slli	a4,a3,0x2
    8000641c:	000f4637          	lui	a2,0xf4
    80006420:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006424:	00d70733          	add	a4,a4,a3
    80006428:	0037979b          	slliw	a5,a5,0x3
    8000642c:	020046b7          	lui	a3,0x2004
    80006430:	00d787b3          	add	a5,a5,a3
    80006434:	00c585b3          	add	a1,a1,a2
    80006438:	00371693          	slli	a3,a4,0x3
    8000643c:	00005717          	auipc	a4,0x5
    80006440:	3e470713          	addi	a4,a4,996 # 8000b820 <timer_scratch>
    80006444:	00b7b023          	sd	a1,0(a5)
    80006448:	00d70733          	add	a4,a4,a3
    8000644c:	00f73c23          	sd	a5,24(a4)
    80006450:	02c73023          	sd	a2,32(a4)
    80006454:	34071073          	csrw	mscratch,a4
    80006458:	00000797          	auipc	a5,0x0
    8000645c:	64878793          	addi	a5,a5,1608 # 80006aa0 <timervec>
    80006460:	30579073          	csrw	mtvec,a5
    80006464:	300027f3          	csrr	a5,mstatus
    80006468:	0087e793          	ori	a5,a5,8
    8000646c:	30079073          	csrw	mstatus,a5
    80006470:	304027f3          	csrr	a5,mie
    80006474:	0807e793          	ori	a5,a5,128
    80006478:	30479073          	csrw	mie,a5
    8000647c:	00813403          	ld	s0,8(sp)
    80006480:	01010113          	addi	sp,sp,16
    80006484:	00008067          	ret

0000000080006488 <system_main>:
    80006488:	fe010113          	addi	sp,sp,-32
    8000648c:	00813823          	sd	s0,16(sp)
    80006490:	00913423          	sd	s1,8(sp)
    80006494:	00113c23          	sd	ra,24(sp)
    80006498:	02010413          	addi	s0,sp,32
    8000649c:	00000097          	auipc	ra,0x0
    800064a0:	0c4080e7          	jalr	196(ra) # 80006560 <cpuid>
    800064a4:	00005497          	auipc	s1,0x5
    800064a8:	2cc48493          	addi	s1,s1,716 # 8000b770 <started>
    800064ac:	02050263          	beqz	a0,800064d0 <system_main+0x48>
    800064b0:	0004a783          	lw	a5,0(s1)
    800064b4:	0007879b          	sext.w	a5,a5
    800064b8:	fe078ce3          	beqz	a5,800064b0 <system_main+0x28>
    800064bc:	0ff0000f          	fence
    800064c0:	00003517          	auipc	a0,0x3
    800064c4:	1e850513          	addi	a0,a0,488 # 800096a8 <CONSOLE_STATUS+0x698>
    800064c8:	00001097          	auipc	ra,0x1
    800064cc:	a74080e7          	jalr	-1420(ra) # 80006f3c <panic>
    800064d0:	00001097          	auipc	ra,0x1
    800064d4:	9c8080e7          	jalr	-1592(ra) # 80006e98 <consoleinit>
    800064d8:	00001097          	auipc	ra,0x1
    800064dc:	154080e7          	jalr	340(ra) # 8000762c <printfinit>
    800064e0:	00003517          	auipc	a0,0x3
    800064e4:	09050513          	addi	a0,a0,144 # 80009570 <CONSOLE_STATUS+0x560>
    800064e8:	00001097          	auipc	ra,0x1
    800064ec:	ab0080e7          	jalr	-1360(ra) # 80006f98 <__printf>
    800064f0:	00003517          	auipc	a0,0x3
    800064f4:	18850513          	addi	a0,a0,392 # 80009678 <CONSOLE_STATUS+0x668>
    800064f8:	00001097          	auipc	ra,0x1
    800064fc:	aa0080e7          	jalr	-1376(ra) # 80006f98 <__printf>
    80006500:	00003517          	auipc	a0,0x3
    80006504:	07050513          	addi	a0,a0,112 # 80009570 <CONSOLE_STATUS+0x560>
    80006508:	00001097          	auipc	ra,0x1
    8000650c:	a90080e7          	jalr	-1392(ra) # 80006f98 <__printf>
    80006510:	00001097          	auipc	ra,0x1
    80006514:	4a8080e7          	jalr	1192(ra) # 800079b8 <kinit>
    80006518:	00000097          	auipc	ra,0x0
    8000651c:	148080e7          	jalr	328(ra) # 80006660 <trapinit>
    80006520:	00000097          	auipc	ra,0x0
    80006524:	16c080e7          	jalr	364(ra) # 8000668c <trapinithart>
    80006528:	00000097          	auipc	ra,0x0
    8000652c:	5b8080e7          	jalr	1464(ra) # 80006ae0 <plicinit>
    80006530:	00000097          	auipc	ra,0x0
    80006534:	5d8080e7          	jalr	1496(ra) # 80006b08 <plicinithart>
    80006538:	00000097          	auipc	ra,0x0
    8000653c:	078080e7          	jalr	120(ra) # 800065b0 <userinit>
    80006540:	0ff0000f          	fence
    80006544:	00100793          	li	a5,1
    80006548:	00003517          	auipc	a0,0x3
    8000654c:	14850513          	addi	a0,a0,328 # 80009690 <CONSOLE_STATUS+0x680>
    80006550:	00f4a023          	sw	a5,0(s1)
    80006554:	00001097          	auipc	ra,0x1
    80006558:	a44080e7          	jalr	-1468(ra) # 80006f98 <__printf>
    8000655c:	0000006f          	j	8000655c <system_main+0xd4>

0000000080006560 <cpuid>:
    80006560:	ff010113          	addi	sp,sp,-16
    80006564:	00813423          	sd	s0,8(sp)
    80006568:	01010413          	addi	s0,sp,16
    8000656c:	00020513          	mv	a0,tp
    80006570:	00813403          	ld	s0,8(sp)
    80006574:	0005051b          	sext.w	a0,a0
    80006578:	01010113          	addi	sp,sp,16
    8000657c:	00008067          	ret

0000000080006580 <mycpu>:
    80006580:	ff010113          	addi	sp,sp,-16
    80006584:	00813423          	sd	s0,8(sp)
    80006588:	01010413          	addi	s0,sp,16
    8000658c:	00020793          	mv	a5,tp
    80006590:	00813403          	ld	s0,8(sp)
    80006594:	0007879b          	sext.w	a5,a5
    80006598:	00779793          	slli	a5,a5,0x7
    8000659c:	00006517          	auipc	a0,0x6
    800065a0:	2b450513          	addi	a0,a0,692 # 8000c850 <cpus>
    800065a4:	00f50533          	add	a0,a0,a5
    800065a8:	01010113          	addi	sp,sp,16
    800065ac:	00008067          	ret

00000000800065b0 <userinit>:
    800065b0:	ff010113          	addi	sp,sp,-16
    800065b4:	00813423          	sd	s0,8(sp)
    800065b8:	01010413          	addi	s0,sp,16
    800065bc:	00813403          	ld	s0,8(sp)
    800065c0:	01010113          	addi	sp,sp,16
    800065c4:	ffffb317          	auipc	t1,0xffffb
    800065c8:	16030067          	jr	352(t1) # 80001724 <main>

00000000800065cc <either_copyout>:
    800065cc:	ff010113          	addi	sp,sp,-16
    800065d0:	00813023          	sd	s0,0(sp)
    800065d4:	00113423          	sd	ra,8(sp)
    800065d8:	01010413          	addi	s0,sp,16
    800065dc:	02051663          	bnez	a0,80006608 <either_copyout+0x3c>
    800065e0:	00058513          	mv	a0,a1
    800065e4:	00060593          	mv	a1,a2
    800065e8:	0006861b          	sext.w	a2,a3
    800065ec:	00002097          	auipc	ra,0x2
    800065f0:	c58080e7          	jalr	-936(ra) # 80008244 <__memmove>
    800065f4:	00813083          	ld	ra,8(sp)
    800065f8:	00013403          	ld	s0,0(sp)
    800065fc:	00000513          	li	a0,0
    80006600:	01010113          	addi	sp,sp,16
    80006604:	00008067          	ret
    80006608:	00003517          	auipc	a0,0x3
    8000660c:	0c850513          	addi	a0,a0,200 # 800096d0 <CONSOLE_STATUS+0x6c0>
    80006610:	00001097          	auipc	ra,0x1
    80006614:	92c080e7          	jalr	-1748(ra) # 80006f3c <panic>

0000000080006618 <either_copyin>:
    80006618:	ff010113          	addi	sp,sp,-16
    8000661c:	00813023          	sd	s0,0(sp)
    80006620:	00113423          	sd	ra,8(sp)
    80006624:	01010413          	addi	s0,sp,16
    80006628:	02059463          	bnez	a1,80006650 <either_copyin+0x38>
    8000662c:	00060593          	mv	a1,a2
    80006630:	0006861b          	sext.w	a2,a3
    80006634:	00002097          	auipc	ra,0x2
    80006638:	c10080e7          	jalr	-1008(ra) # 80008244 <__memmove>
    8000663c:	00813083          	ld	ra,8(sp)
    80006640:	00013403          	ld	s0,0(sp)
    80006644:	00000513          	li	a0,0
    80006648:	01010113          	addi	sp,sp,16
    8000664c:	00008067          	ret
    80006650:	00003517          	auipc	a0,0x3
    80006654:	0a850513          	addi	a0,a0,168 # 800096f8 <CONSOLE_STATUS+0x6e8>
    80006658:	00001097          	auipc	ra,0x1
    8000665c:	8e4080e7          	jalr	-1820(ra) # 80006f3c <panic>

0000000080006660 <trapinit>:
    80006660:	ff010113          	addi	sp,sp,-16
    80006664:	00813423          	sd	s0,8(sp)
    80006668:	01010413          	addi	s0,sp,16
    8000666c:	00813403          	ld	s0,8(sp)
    80006670:	00003597          	auipc	a1,0x3
    80006674:	0b058593          	addi	a1,a1,176 # 80009720 <CONSOLE_STATUS+0x710>
    80006678:	00006517          	auipc	a0,0x6
    8000667c:	25850513          	addi	a0,a0,600 # 8000c8d0 <tickslock>
    80006680:	01010113          	addi	sp,sp,16
    80006684:	00001317          	auipc	t1,0x1
    80006688:	5c430067          	jr	1476(t1) # 80007c48 <initlock>

000000008000668c <trapinithart>:
    8000668c:	ff010113          	addi	sp,sp,-16
    80006690:	00813423          	sd	s0,8(sp)
    80006694:	01010413          	addi	s0,sp,16
    80006698:	00000797          	auipc	a5,0x0
    8000669c:	2f878793          	addi	a5,a5,760 # 80006990 <kernelvec>
    800066a0:	10579073          	csrw	stvec,a5
    800066a4:	00813403          	ld	s0,8(sp)
    800066a8:	01010113          	addi	sp,sp,16
    800066ac:	00008067          	ret

00000000800066b0 <usertrap>:
    800066b0:	ff010113          	addi	sp,sp,-16
    800066b4:	00813423          	sd	s0,8(sp)
    800066b8:	01010413          	addi	s0,sp,16
    800066bc:	00813403          	ld	s0,8(sp)
    800066c0:	01010113          	addi	sp,sp,16
    800066c4:	00008067          	ret

00000000800066c8 <usertrapret>:
    800066c8:	ff010113          	addi	sp,sp,-16
    800066cc:	00813423          	sd	s0,8(sp)
    800066d0:	01010413          	addi	s0,sp,16
    800066d4:	00813403          	ld	s0,8(sp)
    800066d8:	01010113          	addi	sp,sp,16
    800066dc:	00008067          	ret

00000000800066e0 <kerneltrap>:
    800066e0:	fe010113          	addi	sp,sp,-32
    800066e4:	00813823          	sd	s0,16(sp)
    800066e8:	00113c23          	sd	ra,24(sp)
    800066ec:	00913423          	sd	s1,8(sp)
    800066f0:	02010413          	addi	s0,sp,32
    800066f4:	142025f3          	csrr	a1,scause
    800066f8:	100027f3          	csrr	a5,sstatus
    800066fc:	0027f793          	andi	a5,a5,2
    80006700:	10079c63          	bnez	a5,80006818 <kerneltrap+0x138>
    80006704:	142027f3          	csrr	a5,scause
    80006708:	0207ce63          	bltz	a5,80006744 <kerneltrap+0x64>
    8000670c:	00003517          	auipc	a0,0x3
    80006710:	05c50513          	addi	a0,a0,92 # 80009768 <CONSOLE_STATUS+0x758>
    80006714:	00001097          	auipc	ra,0x1
    80006718:	884080e7          	jalr	-1916(ra) # 80006f98 <__printf>
    8000671c:	141025f3          	csrr	a1,sepc
    80006720:	14302673          	csrr	a2,stval
    80006724:	00003517          	auipc	a0,0x3
    80006728:	05450513          	addi	a0,a0,84 # 80009778 <CONSOLE_STATUS+0x768>
    8000672c:	00001097          	auipc	ra,0x1
    80006730:	86c080e7          	jalr	-1940(ra) # 80006f98 <__printf>
    80006734:	00003517          	auipc	a0,0x3
    80006738:	05c50513          	addi	a0,a0,92 # 80009790 <CONSOLE_STATUS+0x780>
    8000673c:	00001097          	auipc	ra,0x1
    80006740:	800080e7          	jalr	-2048(ra) # 80006f3c <panic>
    80006744:	0ff7f713          	andi	a4,a5,255
    80006748:	00900693          	li	a3,9
    8000674c:	04d70063          	beq	a4,a3,8000678c <kerneltrap+0xac>
    80006750:	fff00713          	li	a4,-1
    80006754:	03f71713          	slli	a4,a4,0x3f
    80006758:	00170713          	addi	a4,a4,1
    8000675c:	fae798e3          	bne	a5,a4,8000670c <kerneltrap+0x2c>
    80006760:	00000097          	auipc	ra,0x0
    80006764:	e00080e7          	jalr	-512(ra) # 80006560 <cpuid>
    80006768:	06050663          	beqz	a0,800067d4 <kerneltrap+0xf4>
    8000676c:	144027f3          	csrr	a5,sip
    80006770:	ffd7f793          	andi	a5,a5,-3
    80006774:	14479073          	csrw	sip,a5
    80006778:	01813083          	ld	ra,24(sp)
    8000677c:	01013403          	ld	s0,16(sp)
    80006780:	00813483          	ld	s1,8(sp)
    80006784:	02010113          	addi	sp,sp,32
    80006788:	00008067          	ret
    8000678c:	00000097          	auipc	ra,0x0
    80006790:	3c8080e7          	jalr	968(ra) # 80006b54 <plic_claim>
    80006794:	00a00793          	li	a5,10
    80006798:	00050493          	mv	s1,a0
    8000679c:	06f50863          	beq	a0,a5,8000680c <kerneltrap+0x12c>
    800067a0:	fc050ce3          	beqz	a0,80006778 <kerneltrap+0x98>
    800067a4:	00050593          	mv	a1,a0
    800067a8:	00003517          	auipc	a0,0x3
    800067ac:	fa050513          	addi	a0,a0,-96 # 80009748 <CONSOLE_STATUS+0x738>
    800067b0:	00000097          	auipc	ra,0x0
    800067b4:	7e8080e7          	jalr	2024(ra) # 80006f98 <__printf>
    800067b8:	01013403          	ld	s0,16(sp)
    800067bc:	01813083          	ld	ra,24(sp)
    800067c0:	00048513          	mv	a0,s1
    800067c4:	00813483          	ld	s1,8(sp)
    800067c8:	02010113          	addi	sp,sp,32
    800067cc:	00000317          	auipc	t1,0x0
    800067d0:	3c030067          	jr	960(t1) # 80006b8c <plic_complete>
    800067d4:	00006517          	auipc	a0,0x6
    800067d8:	0fc50513          	addi	a0,a0,252 # 8000c8d0 <tickslock>
    800067dc:	00001097          	auipc	ra,0x1
    800067e0:	490080e7          	jalr	1168(ra) # 80007c6c <acquire>
    800067e4:	00005717          	auipc	a4,0x5
    800067e8:	f9070713          	addi	a4,a4,-112 # 8000b774 <ticks>
    800067ec:	00072783          	lw	a5,0(a4)
    800067f0:	00006517          	auipc	a0,0x6
    800067f4:	0e050513          	addi	a0,a0,224 # 8000c8d0 <tickslock>
    800067f8:	0017879b          	addiw	a5,a5,1
    800067fc:	00f72023          	sw	a5,0(a4)
    80006800:	00001097          	auipc	ra,0x1
    80006804:	538080e7          	jalr	1336(ra) # 80007d38 <release>
    80006808:	f65ff06f          	j	8000676c <kerneltrap+0x8c>
    8000680c:	00001097          	auipc	ra,0x1
    80006810:	094080e7          	jalr	148(ra) # 800078a0 <uartintr>
    80006814:	fa5ff06f          	j	800067b8 <kerneltrap+0xd8>
    80006818:	00003517          	auipc	a0,0x3
    8000681c:	f1050513          	addi	a0,a0,-240 # 80009728 <CONSOLE_STATUS+0x718>
    80006820:	00000097          	auipc	ra,0x0
    80006824:	71c080e7          	jalr	1820(ra) # 80006f3c <panic>

0000000080006828 <clockintr>:
    80006828:	fe010113          	addi	sp,sp,-32
    8000682c:	00813823          	sd	s0,16(sp)
    80006830:	00913423          	sd	s1,8(sp)
    80006834:	00113c23          	sd	ra,24(sp)
    80006838:	02010413          	addi	s0,sp,32
    8000683c:	00006497          	auipc	s1,0x6
    80006840:	09448493          	addi	s1,s1,148 # 8000c8d0 <tickslock>
    80006844:	00048513          	mv	a0,s1
    80006848:	00001097          	auipc	ra,0x1
    8000684c:	424080e7          	jalr	1060(ra) # 80007c6c <acquire>
    80006850:	00005717          	auipc	a4,0x5
    80006854:	f2470713          	addi	a4,a4,-220 # 8000b774 <ticks>
    80006858:	00072783          	lw	a5,0(a4)
    8000685c:	01013403          	ld	s0,16(sp)
    80006860:	01813083          	ld	ra,24(sp)
    80006864:	00048513          	mv	a0,s1
    80006868:	0017879b          	addiw	a5,a5,1
    8000686c:	00813483          	ld	s1,8(sp)
    80006870:	00f72023          	sw	a5,0(a4)
    80006874:	02010113          	addi	sp,sp,32
    80006878:	00001317          	auipc	t1,0x1
    8000687c:	4c030067          	jr	1216(t1) # 80007d38 <release>

0000000080006880 <devintr>:
    80006880:	142027f3          	csrr	a5,scause
    80006884:	00000513          	li	a0,0
    80006888:	0007c463          	bltz	a5,80006890 <devintr+0x10>
    8000688c:	00008067          	ret
    80006890:	fe010113          	addi	sp,sp,-32
    80006894:	00813823          	sd	s0,16(sp)
    80006898:	00113c23          	sd	ra,24(sp)
    8000689c:	00913423          	sd	s1,8(sp)
    800068a0:	02010413          	addi	s0,sp,32
    800068a4:	0ff7f713          	andi	a4,a5,255
    800068a8:	00900693          	li	a3,9
    800068ac:	04d70c63          	beq	a4,a3,80006904 <devintr+0x84>
    800068b0:	fff00713          	li	a4,-1
    800068b4:	03f71713          	slli	a4,a4,0x3f
    800068b8:	00170713          	addi	a4,a4,1
    800068bc:	00e78c63          	beq	a5,a4,800068d4 <devintr+0x54>
    800068c0:	01813083          	ld	ra,24(sp)
    800068c4:	01013403          	ld	s0,16(sp)
    800068c8:	00813483          	ld	s1,8(sp)
    800068cc:	02010113          	addi	sp,sp,32
    800068d0:	00008067          	ret
    800068d4:	00000097          	auipc	ra,0x0
    800068d8:	c8c080e7          	jalr	-884(ra) # 80006560 <cpuid>
    800068dc:	06050663          	beqz	a0,80006948 <devintr+0xc8>
    800068e0:	144027f3          	csrr	a5,sip
    800068e4:	ffd7f793          	andi	a5,a5,-3
    800068e8:	14479073          	csrw	sip,a5
    800068ec:	01813083          	ld	ra,24(sp)
    800068f0:	01013403          	ld	s0,16(sp)
    800068f4:	00813483          	ld	s1,8(sp)
    800068f8:	00200513          	li	a0,2
    800068fc:	02010113          	addi	sp,sp,32
    80006900:	00008067          	ret
    80006904:	00000097          	auipc	ra,0x0
    80006908:	250080e7          	jalr	592(ra) # 80006b54 <plic_claim>
    8000690c:	00a00793          	li	a5,10
    80006910:	00050493          	mv	s1,a0
    80006914:	06f50663          	beq	a0,a5,80006980 <devintr+0x100>
    80006918:	00100513          	li	a0,1
    8000691c:	fa0482e3          	beqz	s1,800068c0 <devintr+0x40>
    80006920:	00048593          	mv	a1,s1
    80006924:	00003517          	auipc	a0,0x3
    80006928:	e2450513          	addi	a0,a0,-476 # 80009748 <CONSOLE_STATUS+0x738>
    8000692c:	00000097          	auipc	ra,0x0
    80006930:	66c080e7          	jalr	1644(ra) # 80006f98 <__printf>
    80006934:	00048513          	mv	a0,s1
    80006938:	00000097          	auipc	ra,0x0
    8000693c:	254080e7          	jalr	596(ra) # 80006b8c <plic_complete>
    80006940:	00100513          	li	a0,1
    80006944:	f7dff06f          	j	800068c0 <devintr+0x40>
    80006948:	00006517          	auipc	a0,0x6
    8000694c:	f8850513          	addi	a0,a0,-120 # 8000c8d0 <tickslock>
    80006950:	00001097          	auipc	ra,0x1
    80006954:	31c080e7          	jalr	796(ra) # 80007c6c <acquire>
    80006958:	00005717          	auipc	a4,0x5
    8000695c:	e1c70713          	addi	a4,a4,-484 # 8000b774 <ticks>
    80006960:	00072783          	lw	a5,0(a4)
    80006964:	00006517          	auipc	a0,0x6
    80006968:	f6c50513          	addi	a0,a0,-148 # 8000c8d0 <tickslock>
    8000696c:	0017879b          	addiw	a5,a5,1
    80006970:	00f72023          	sw	a5,0(a4)
    80006974:	00001097          	auipc	ra,0x1
    80006978:	3c4080e7          	jalr	964(ra) # 80007d38 <release>
    8000697c:	f65ff06f          	j	800068e0 <devintr+0x60>
    80006980:	00001097          	auipc	ra,0x1
    80006984:	f20080e7          	jalr	-224(ra) # 800078a0 <uartintr>
    80006988:	fadff06f          	j	80006934 <devintr+0xb4>
    8000698c:	0000                	unimp
	...

0000000080006990 <kernelvec>:
    80006990:	f0010113          	addi	sp,sp,-256
    80006994:	00113023          	sd	ra,0(sp)
    80006998:	00213423          	sd	sp,8(sp)
    8000699c:	00313823          	sd	gp,16(sp)
    800069a0:	00413c23          	sd	tp,24(sp)
    800069a4:	02513023          	sd	t0,32(sp)
    800069a8:	02613423          	sd	t1,40(sp)
    800069ac:	02713823          	sd	t2,48(sp)
    800069b0:	02813c23          	sd	s0,56(sp)
    800069b4:	04913023          	sd	s1,64(sp)
    800069b8:	04a13423          	sd	a0,72(sp)
    800069bc:	04b13823          	sd	a1,80(sp)
    800069c0:	04c13c23          	sd	a2,88(sp)
    800069c4:	06d13023          	sd	a3,96(sp)
    800069c8:	06e13423          	sd	a4,104(sp)
    800069cc:	06f13823          	sd	a5,112(sp)
    800069d0:	07013c23          	sd	a6,120(sp)
    800069d4:	09113023          	sd	a7,128(sp)
    800069d8:	09213423          	sd	s2,136(sp)
    800069dc:	09313823          	sd	s3,144(sp)
    800069e0:	09413c23          	sd	s4,152(sp)
    800069e4:	0b513023          	sd	s5,160(sp)
    800069e8:	0b613423          	sd	s6,168(sp)
    800069ec:	0b713823          	sd	s7,176(sp)
    800069f0:	0b813c23          	sd	s8,184(sp)
    800069f4:	0d913023          	sd	s9,192(sp)
    800069f8:	0da13423          	sd	s10,200(sp)
    800069fc:	0db13823          	sd	s11,208(sp)
    80006a00:	0dc13c23          	sd	t3,216(sp)
    80006a04:	0fd13023          	sd	t4,224(sp)
    80006a08:	0fe13423          	sd	t5,232(sp)
    80006a0c:	0ff13823          	sd	t6,240(sp)
    80006a10:	cd1ff0ef          	jal	ra,800066e0 <kerneltrap>
    80006a14:	00013083          	ld	ra,0(sp)
    80006a18:	00813103          	ld	sp,8(sp)
    80006a1c:	01013183          	ld	gp,16(sp)
    80006a20:	02013283          	ld	t0,32(sp)
    80006a24:	02813303          	ld	t1,40(sp)
    80006a28:	03013383          	ld	t2,48(sp)
    80006a2c:	03813403          	ld	s0,56(sp)
    80006a30:	04013483          	ld	s1,64(sp)
    80006a34:	04813503          	ld	a0,72(sp)
    80006a38:	05013583          	ld	a1,80(sp)
    80006a3c:	05813603          	ld	a2,88(sp)
    80006a40:	06013683          	ld	a3,96(sp)
    80006a44:	06813703          	ld	a4,104(sp)
    80006a48:	07013783          	ld	a5,112(sp)
    80006a4c:	07813803          	ld	a6,120(sp)
    80006a50:	08013883          	ld	a7,128(sp)
    80006a54:	08813903          	ld	s2,136(sp)
    80006a58:	09013983          	ld	s3,144(sp)
    80006a5c:	09813a03          	ld	s4,152(sp)
    80006a60:	0a013a83          	ld	s5,160(sp)
    80006a64:	0a813b03          	ld	s6,168(sp)
    80006a68:	0b013b83          	ld	s7,176(sp)
    80006a6c:	0b813c03          	ld	s8,184(sp)
    80006a70:	0c013c83          	ld	s9,192(sp)
    80006a74:	0c813d03          	ld	s10,200(sp)
    80006a78:	0d013d83          	ld	s11,208(sp)
    80006a7c:	0d813e03          	ld	t3,216(sp)
    80006a80:	0e013e83          	ld	t4,224(sp)
    80006a84:	0e813f03          	ld	t5,232(sp)
    80006a88:	0f013f83          	ld	t6,240(sp)
    80006a8c:	10010113          	addi	sp,sp,256
    80006a90:	10200073          	sret
    80006a94:	00000013          	nop
    80006a98:	00000013          	nop
    80006a9c:	00000013          	nop

0000000080006aa0 <timervec>:
    80006aa0:	34051573          	csrrw	a0,mscratch,a0
    80006aa4:	00b53023          	sd	a1,0(a0)
    80006aa8:	00c53423          	sd	a2,8(a0)
    80006aac:	00d53823          	sd	a3,16(a0)
    80006ab0:	01853583          	ld	a1,24(a0)
    80006ab4:	02053603          	ld	a2,32(a0)
    80006ab8:	0005b683          	ld	a3,0(a1)
    80006abc:	00c686b3          	add	a3,a3,a2
    80006ac0:	00d5b023          	sd	a3,0(a1)
    80006ac4:	00200593          	li	a1,2
    80006ac8:	14459073          	csrw	sip,a1
    80006acc:	01053683          	ld	a3,16(a0)
    80006ad0:	00853603          	ld	a2,8(a0)
    80006ad4:	00053583          	ld	a1,0(a0)
    80006ad8:	34051573          	csrrw	a0,mscratch,a0
    80006adc:	30200073          	mret

0000000080006ae0 <plicinit>:
    80006ae0:	ff010113          	addi	sp,sp,-16
    80006ae4:	00813423          	sd	s0,8(sp)
    80006ae8:	01010413          	addi	s0,sp,16
    80006aec:	00813403          	ld	s0,8(sp)
    80006af0:	0c0007b7          	lui	a5,0xc000
    80006af4:	00100713          	li	a4,1
    80006af8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80006afc:	00e7a223          	sw	a4,4(a5)
    80006b00:	01010113          	addi	sp,sp,16
    80006b04:	00008067          	ret

0000000080006b08 <plicinithart>:
    80006b08:	ff010113          	addi	sp,sp,-16
    80006b0c:	00813023          	sd	s0,0(sp)
    80006b10:	00113423          	sd	ra,8(sp)
    80006b14:	01010413          	addi	s0,sp,16
    80006b18:	00000097          	auipc	ra,0x0
    80006b1c:	a48080e7          	jalr	-1464(ra) # 80006560 <cpuid>
    80006b20:	0085171b          	slliw	a4,a0,0x8
    80006b24:	0c0027b7          	lui	a5,0xc002
    80006b28:	00e787b3          	add	a5,a5,a4
    80006b2c:	40200713          	li	a4,1026
    80006b30:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80006b34:	00813083          	ld	ra,8(sp)
    80006b38:	00013403          	ld	s0,0(sp)
    80006b3c:	00d5151b          	slliw	a0,a0,0xd
    80006b40:	0c2017b7          	lui	a5,0xc201
    80006b44:	00a78533          	add	a0,a5,a0
    80006b48:	00052023          	sw	zero,0(a0)
    80006b4c:	01010113          	addi	sp,sp,16
    80006b50:	00008067          	ret

0000000080006b54 <plic_claim>:
    80006b54:	ff010113          	addi	sp,sp,-16
    80006b58:	00813023          	sd	s0,0(sp)
    80006b5c:	00113423          	sd	ra,8(sp)
    80006b60:	01010413          	addi	s0,sp,16
    80006b64:	00000097          	auipc	ra,0x0
    80006b68:	9fc080e7          	jalr	-1540(ra) # 80006560 <cpuid>
    80006b6c:	00813083          	ld	ra,8(sp)
    80006b70:	00013403          	ld	s0,0(sp)
    80006b74:	00d5151b          	slliw	a0,a0,0xd
    80006b78:	0c2017b7          	lui	a5,0xc201
    80006b7c:	00a78533          	add	a0,a5,a0
    80006b80:	00452503          	lw	a0,4(a0)
    80006b84:	01010113          	addi	sp,sp,16
    80006b88:	00008067          	ret

0000000080006b8c <plic_complete>:
    80006b8c:	fe010113          	addi	sp,sp,-32
    80006b90:	00813823          	sd	s0,16(sp)
    80006b94:	00913423          	sd	s1,8(sp)
    80006b98:	00113c23          	sd	ra,24(sp)
    80006b9c:	02010413          	addi	s0,sp,32
    80006ba0:	00050493          	mv	s1,a0
    80006ba4:	00000097          	auipc	ra,0x0
    80006ba8:	9bc080e7          	jalr	-1604(ra) # 80006560 <cpuid>
    80006bac:	01813083          	ld	ra,24(sp)
    80006bb0:	01013403          	ld	s0,16(sp)
    80006bb4:	00d5179b          	slliw	a5,a0,0xd
    80006bb8:	0c201737          	lui	a4,0xc201
    80006bbc:	00f707b3          	add	a5,a4,a5
    80006bc0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80006bc4:	00813483          	ld	s1,8(sp)
    80006bc8:	02010113          	addi	sp,sp,32
    80006bcc:	00008067          	ret

0000000080006bd0 <consolewrite>:
    80006bd0:	fb010113          	addi	sp,sp,-80
    80006bd4:	04813023          	sd	s0,64(sp)
    80006bd8:	04113423          	sd	ra,72(sp)
    80006bdc:	02913c23          	sd	s1,56(sp)
    80006be0:	03213823          	sd	s2,48(sp)
    80006be4:	03313423          	sd	s3,40(sp)
    80006be8:	03413023          	sd	s4,32(sp)
    80006bec:	01513c23          	sd	s5,24(sp)
    80006bf0:	05010413          	addi	s0,sp,80
    80006bf4:	06c05c63          	blez	a2,80006c6c <consolewrite+0x9c>
    80006bf8:	00060993          	mv	s3,a2
    80006bfc:	00050a13          	mv	s4,a0
    80006c00:	00058493          	mv	s1,a1
    80006c04:	00000913          	li	s2,0
    80006c08:	fff00a93          	li	s5,-1
    80006c0c:	01c0006f          	j	80006c28 <consolewrite+0x58>
    80006c10:	fbf44503          	lbu	a0,-65(s0)
    80006c14:	0019091b          	addiw	s2,s2,1
    80006c18:	00148493          	addi	s1,s1,1
    80006c1c:	00001097          	auipc	ra,0x1
    80006c20:	a9c080e7          	jalr	-1380(ra) # 800076b8 <uartputc>
    80006c24:	03298063          	beq	s3,s2,80006c44 <consolewrite+0x74>
    80006c28:	00048613          	mv	a2,s1
    80006c2c:	00100693          	li	a3,1
    80006c30:	000a0593          	mv	a1,s4
    80006c34:	fbf40513          	addi	a0,s0,-65
    80006c38:	00000097          	auipc	ra,0x0
    80006c3c:	9e0080e7          	jalr	-1568(ra) # 80006618 <either_copyin>
    80006c40:	fd5518e3          	bne	a0,s5,80006c10 <consolewrite+0x40>
    80006c44:	04813083          	ld	ra,72(sp)
    80006c48:	04013403          	ld	s0,64(sp)
    80006c4c:	03813483          	ld	s1,56(sp)
    80006c50:	02813983          	ld	s3,40(sp)
    80006c54:	02013a03          	ld	s4,32(sp)
    80006c58:	01813a83          	ld	s5,24(sp)
    80006c5c:	00090513          	mv	a0,s2
    80006c60:	03013903          	ld	s2,48(sp)
    80006c64:	05010113          	addi	sp,sp,80
    80006c68:	00008067          	ret
    80006c6c:	00000913          	li	s2,0
    80006c70:	fd5ff06f          	j	80006c44 <consolewrite+0x74>

0000000080006c74 <consoleread>:
    80006c74:	f9010113          	addi	sp,sp,-112
    80006c78:	06813023          	sd	s0,96(sp)
    80006c7c:	04913c23          	sd	s1,88(sp)
    80006c80:	05213823          	sd	s2,80(sp)
    80006c84:	05313423          	sd	s3,72(sp)
    80006c88:	05413023          	sd	s4,64(sp)
    80006c8c:	03513c23          	sd	s5,56(sp)
    80006c90:	03613823          	sd	s6,48(sp)
    80006c94:	03713423          	sd	s7,40(sp)
    80006c98:	03813023          	sd	s8,32(sp)
    80006c9c:	06113423          	sd	ra,104(sp)
    80006ca0:	01913c23          	sd	s9,24(sp)
    80006ca4:	07010413          	addi	s0,sp,112
    80006ca8:	00060b93          	mv	s7,a2
    80006cac:	00050913          	mv	s2,a0
    80006cb0:	00058c13          	mv	s8,a1
    80006cb4:	00060b1b          	sext.w	s6,a2
    80006cb8:	00006497          	auipc	s1,0x6
    80006cbc:	c4048493          	addi	s1,s1,-960 # 8000c8f8 <cons>
    80006cc0:	00400993          	li	s3,4
    80006cc4:	fff00a13          	li	s4,-1
    80006cc8:	00a00a93          	li	s5,10
    80006ccc:	05705e63          	blez	s7,80006d28 <consoleread+0xb4>
    80006cd0:	09c4a703          	lw	a4,156(s1)
    80006cd4:	0984a783          	lw	a5,152(s1)
    80006cd8:	0007071b          	sext.w	a4,a4
    80006cdc:	08e78463          	beq	a5,a4,80006d64 <consoleread+0xf0>
    80006ce0:	07f7f713          	andi	a4,a5,127
    80006ce4:	00e48733          	add	a4,s1,a4
    80006ce8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80006cec:	0017869b          	addiw	a3,a5,1
    80006cf0:	08d4ac23          	sw	a3,152(s1)
    80006cf4:	00070c9b          	sext.w	s9,a4
    80006cf8:	0b370663          	beq	a4,s3,80006da4 <consoleread+0x130>
    80006cfc:	00100693          	li	a3,1
    80006d00:	f9f40613          	addi	a2,s0,-97
    80006d04:	000c0593          	mv	a1,s8
    80006d08:	00090513          	mv	a0,s2
    80006d0c:	f8e40fa3          	sb	a4,-97(s0)
    80006d10:	00000097          	auipc	ra,0x0
    80006d14:	8bc080e7          	jalr	-1860(ra) # 800065cc <either_copyout>
    80006d18:	01450863          	beq	a0,s4,80006d28 <consoleread+0xb4>
    80006d1c:	001c0c13          	addi	s8,s8,1
    80006d20:	fffb8b9b          	addiw	s7,s7,-1
    80006d24:	fb5c94e3          	bne	s9,s5,80006ccc <consoleread+0x58>
    80006d28:	000b851b          	sext.w	a0,s7
    80006d2c:	06813083          	ld	ra,104(sp)
    80006d30:	06013403          	ld	s0,96(sp)
    80006d34:	05813483          	ld	s1,88(sp)
    80006d38:	05013903          	ld	s2,80(sp)
    80006d3c:	04813983          	ld	s3,72(sp)
    80006d40:	04013a03          	ld	s4,64(sp)
    80006d44:	03813a83          	ld	s5,56(sp)
    80006d48:	02813b83          	ld	s7,40(sp)
    80006d4c:	02013c03          	ld	s8,32(sp)
    80006d50:	01813c83          	ld	s9,24(sp)
    80006d54:	40ab053b          	subw	a0,s6,a0
    80006d58:	03013b03          	ld	s6,48(sp)
    80006d5c:	07010113          	addi	sp,sp,112
    80006d60:	00008067          	ret
    80006d64:	00001097          	auipc	ra,0x1
    80006d68:	1d8080e7          	jalr	472(ra) # 80007f3c <push_on>
    80006d6c:	0984a703          	lw	a4,152(s1)
    80006d70:	09c4a783          	lw	a5,156(s1)
    80006d74:	0007879b          	sext.w	a5,a5
    80006d78:	fef70ce3          	beq	a4,a5,80006d70 <consoleread+0xfc>
    80006d7c:	00001097          	auipc	ra,0x1
    80006d80:	234080e7          	jalr	564(ra) # 80007fb0 <pop_on>
    80006d84:	0984a783          	lw	a5,152(s1)
    80006d88:	07f7f713          	andi	a4,a5,127
    80006d8c:	00e48733          	add	a4,s1,a4
    80006d90:	01874703          	lbu	a4,24(a4)
    80006d94:	0017869b          	addiw	a3,a5,1
    80006d98:	08d4ac23          	sw	a3,152(s1)
    80006d9c:	00070c9b          	sext.w	s9,a4
    80006da0:	f5371ee3          	bne	a4,s3,80006cfc <consoleread+0x88>
    80006da4:	000b851b          	sext.w	a0,s7
    80006da8:	f96bf2e3          	bgeu	s7,s6,80006d2c <consoleread+0xb8>
    80006dac:	08f4ac23          	sw	a5,152(s1)
    80006db0:	f7dff06f          	j	80006d2c <consoleread+0xb8>

0000000080006db4 <consputc>:
    80006db4:	10000793          	li	a5,256
    80006db8:	00f50663          	beq	a0,a5,80006dc4 <consputc+0x10>
    80006dbc:	00001317          	auipc	t1,0x1
    80006dc0:	9f430067          	jr	-1548(t1) # 800077b0 <uartputc_sync>
    80006dc4:	ff010113          	addi	sp,sp,-16
    80006dc8:	00113423          	sd	ra,8(sp)
    80006dcc:	00813023          	sd	s0,0(sp)
    80006dd0:	01010413          	addi	s0,sp,16
    80006dd4:	00800513          	li	a0,8
    80006dd8:	00001097          	auipc	ra,0x1
    80006ddc:	9d8080e7          	jalr	-1576(ra) # 800077b0 <uartputc_sync>
    80006de0:	02000513          	li	a0,32
    80006de4:	00001097          	auipc	ra,0x1
    80006de8:	9cc080e7          	jalr	-1588(ra) # 800077b0 <uartputc_sync>
    80006dec:	00013403          	ld	s0,0(sp)
    80006df0:	00813083          	ld	ra,8(sp)
    80006df4:	00800513          	li	a0,8
    80006df8:	01010113          	addi	sp,sp,16
    80006dfc:	00001317          	auipc	t1,0x1
    80006e00:	9b430067          	jr	-1612(t1) # 800077b0 <uartputc_sync>

0000000080006e04 <consoleintr>:
    80006e04:	fe010113          	addi	sp,sp,-32
    80006e08:	00813823          	sd	s0,16(sp)
    80006e0c:	00913423          	sd	s1,8(sp)
    80006e10:	01213023          	sd	s2,0(sp)
    80006e14:	00113c23          	sd	ra,24(sp)
    80006e18:	02010413          	addi	s0,sp,32
    80006e1c:	00006917          	auipc	s2,0x6
    80006e20:	adc90913          	addi	s2,s2,-1316 # 8000c8f8 <cons>
    80006e24:	00050493          	mv	s1,a0
    80006e28:	00090513          	mv	a0,s2
    80006e2c:	00001097          	auipc	ra,0x1
    80006e30:	e40080e7          	jalr	-448(ra) # 80007c6c <acquire>
    80006e34:	02048c63          	beqz	s1,80006e6c <consoleintr+0x68>
    80006e38:	0a092783          	lw	a5,160(s2)
    80006e3c:	09892703          	lw	a4,152(s2)
    80006e40:	07f00693          	li	a3,127
    80006e44:	40e7873b          	subw	a4,a5,a4
    80006e48:	02e6e263          	bltu	a3,a4,80006e6c <consoleintr+0x68>
    80006e4c:	00d00713          	li	a4,13
    80006e50:	04e48063          	beq	s1,a4,80006e90 <consoleintr+0x8c>
    80006e54:	07f7f713          	andi	a4,a5,127
    80006e58:	00e90733          	add	a4,s2,a4
    80006e5c:	0017879b          	addiw	a5,a5,1
    80006e60:	0af92023          	sw	a5,160(s2)
    80006e64:	00970c23          	sb	s1,24(a4)
    80006e68:	08f92e23          	sw	a5,156(s2)
    80006e6c:	01013403          	ld	s0,16(sp)
    80006e70:	01813083          	ld	ra,24(sp)
    80006e74:	00813483          	ld	s1,8(sp)
    80006e78:	00013903          	ld	s2,0(sp)
    80006e7c:	00006517          	auipc	a0,0x6
    80006e80:	a7c50513          	addi	a0,a0,-1412 # 8000c8f8 <cons>
    80006e84:	02010113          	addi	sp,sp,32
    80006e88:	00001317          	auipc	t1,0x1
    80006e8c:	eb030067          	jr	-336(t1) # 80007d38 <release>
    80006e90:	00a00493          	li	s1,10
    80006e94:	fc1ff06f          	j	80006e54 <consoleintr+0x50>

0000000080006e98 <consoleinit>:
    80006e98:	fe010113          	addi	sp,sp,-32
    80006e9c:	00113c23          	sd	ra,24(sp)
    80006ea0:	00813823          	sd	s0,16(sp)
    80006ea4:	00913423          	sd	s1,8(sp)
    80006ea8:	02010413          	addi	s0,sp,32
    80006eac:	00006497          	auipc	s1,0x6
    80006eb0:	a4c48493          	addi	s1,s1,-1460 # 8000c8f8 <cons>
    80006eb4:	00048513          	mv	a0,s1
    80006eb8:	00003597          	auipc	a1,0x3
    80006ebc:	8e858593          	addi	a1,a1,-1816 # 800097a0 <CONSOLE_STATUS+0x790>
    80006ec0:	00001097          	auipc	ra,0x1
    80006ec4:	d88080e7          	jalr	-632(ra) # 80007c48 <initlock>
    80006ec8:	00000097          	auipc	ra,0x0
    80006ecc:	7ac080e7          	jalr	1964(ra) # 80007674 <uartinit>
    80006ed0:	01813083          	ld	ra,24(sp)
    80006ed4:	01013403          	ld	s0,16(sp)
    80006ed8:	00000797          	auipc	a5,0x0
    80006edc:	d9c78793          	addi	a5,a5,-612 # 80006c74 <consoleread>
    80006ee0:	0af4bc23          	sd	a5,184(s1)
    80006ee4:	00000797          	auipc	a5,0x0
    80006ee8:	cec78793          	addi	a5,a5,-788 # 80006bd0 <consolewrite>
    80006eec:	0cf4b023          	sd	a5,192(s1)
    80006ef0:	00813483          	ld	s1,8(sp)
    80006ef4:	02010113          	addi	sp,sp,32
    80006ef8:	00008067          	ret

0000000080006efc <console_read>:
    80006efc:	ff010113          	addi	sp,sp,-16
    80006f00:	00813423          	sd	s0,8(sp)
    80006f04:	01010413          	addi	s0,sp,16
    80006f08:	00813403          	ld	s0,8(sp)
    80006f0c:	00006317          	auipc	t1,0x6
    80006f10:	aa433303          	ld	t1,-1372(t1) # 8000c9b0 <devsw+0x10>
    80006f14:	01010113          	addi	sp,sp,16
    80006f18:	00030067          	jr	t1

0000000080006f1c <console_write>:
    80006f1c:	ff010113          	addi	sp,sp,-16
    80006f20:	00813423          	sd	s0,8(sp)
    80006f24:	01010413          	addi	s0,sp,16
    80006f28:	00813403          	ld	s0,8(sp)
    80006f2c:	00006317          	auipc	t1,0x6
    80006f30:	a8c33303          	ld	t1,-1396(t1) # 8000c9b8 <devsw+0x18>
    80006f34:	01010113          	addi	sp,sp,16
    80006f38:	00030067          	jr	t1

0000000080006f3c <panic>:
    80006f3c:	fe010113          	addi	sp,sp,-32
    80006f40:	00113c23          	sd	ra,24(sp)
    80006f44:	00813823          	sd	s0,16(sp)
    80006f48:	00913423          	sd	s1,8(sp)
    80006f4c:	02010413          	addi	s0,sp,32
    80006f50:	00050493          	mv	s1,a0
    80006f54:	00003517          	auipc	a0,0x3
    80006f58:	85450513          	addi	a0,a0,-1964 # 800097a8 <CONSOLE_STATUS+0x798>
    80006f5c:	00006797          	auipc	a5,0x6
    80006f60:	ae07ae23          	sw	zero,-1284(a5) # 8000ca58 <pr+0x18>
    80006f64:	00000097          	auipc	ra,0x0
    80006f68:	034080e7          	jalr	52(ra) # 80006f98 <__printf>
    80006f6c:	00048513          	mv	a0,s1
    80006f70:	00000097          	auipc	ra,0x0
    80006f74:	028080e7          	jalr	40(ra) # 80006f98 <__printf>
    80006f78:	00002517          	auipc	a0,0x2
    80006f7c:	5f850513          	addi	a0,a0,1528 # 80009570 <CONSOLE_STATUS+0x560>
    80006f80:	00000097          	auipc	ra,0x0
    80006f84:	018080e7          	jalr	24(ra) # 80006f98 <__printf>
    80006f88:	00100793          	li	a5,1
    80006f8c:	00004717          	auipc	a4,0x4
    80006f90:	7ef72623          	sw	a5,2028(a4) # 8000b778 <panicked>
    80006f94:	0000006f          	j	80006f94 <panic+0x58>

0000000080006f98 <__printf>:
    80006f98:	f3010113          	addi	sp,sp,-208
    80006f9c:	08813023          	sd	s0,128(sp)
    80006fa0:	07313423          	sd	s3,104(sp)
    80006fa4:	09010413          	addi	s0,sp,144
    80006fa8:	05813023          	sd	s8,64(sp)
    80006fac:	08113423          	sd	ra,136(sp)
    80006fb0:	06913c23          	sd	s1,120(sp)
    80006fb4:	07213823          	sd	s2,112(sp)
    80006fb8:	07413023          	sd	s4,96(sp)
    80006fbc:	05513c23          	sd	s5,88(sp)
    80006fc0:	05613823          	sd	s6,80(sp)
    80006fc4:	05713423          	sd	s7,72(sp)
    80006fc8:	03913c23          	sd	s9,56(sp)
    80006fcc:	03a13823          	sd	s10,48(sp)
    80006fd0:	03b13423          	sd	s11,40(sp)
    80006fd4:	00006317          	auipc	t1,0x6
    80006fd8:	a6c30313          	addi	t1,t1,-1428 # 8000ca40 <pr>
    80006fdc:	01832c03          	lw	s8,24(t1)
    80006fe0:	00b43423          	sd	a1,8(s0)
    80006fe4:	00c43823          	sd	a2,16(s0)
    80006fe8:	00d43c23          	sd	a3,24(s0)
    80006fec:	02e43023          	sd	a4,32(s0)
    80006ff0:	02f43423          	sd	a5,40(s0)
    80006ff4:	03043823          	sd	a6,48(s0)
    80006ff8:	03143c23          	sd	a7,56(s0)
    80006ffc:	00050993          	mv	s3,a0
    80007000:	4a0c1663          	bnez	s8,800074ac <__printf+0x514>
    80007004:	60098c63          	beqz	s3,8000761c <__printf+0x684>
    80007008:	0009c503          	lbu	a0,0(s3)
    8000700c:	00840793          	addi	a5,s0,8
    80007010:	f6f43c23          	sd	a5,-136(s0)
    80007014:	00000493          	li	s1,0
    80007018:	22050063          	beqz	a0,80007238 <__printf+0x2a0>
    8000701c:	00002a37          	lui	s4,0x2
    80007020:	00018ab7          	lui	s5,0x18
    80007024:	000f4b37          	lui	s6,0xf4
    80007028:	00989bb7          	lui	s7,0x989
    8000702c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007030:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007034:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007038:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000703c:	00148c9b          	addiw	s9,s1,1
    80007040:	02500793          	li	a5,37
    80007044:	01998933          	add	s2,s3,s9
    80007048:	38f51263          	bne	a0,a5,800073cc <__printf+0x434>
    8000704c:	00094783          	lbu	a5,0(s2)
    80007050:	00078c9b          	sext.w	s9,a5
    80007054:	1e078263          	beqz	a5,80007238 <__printf+0x2a0>
    80007058:	0024849b          	addiw	s1,s1,2
    8000705c:	07000713          	li	a4,112
    80007060:	00998933          	add	s2,s3,s1
    80007064:	38e78a63          	beq	a5,a4,800073f8 <__printf+0x460>
    80007068:	20f76863          	bltu	a4,a5,80007278 <__printf+0x2e0>
    8000706c:	42a78863          	beq	a5,a0,8000749c <__printf+0x504>
    80007070:	06400713          	li	a4,100
    80007074:	40e79663          	bne	a5,a4,80007480 <__printf+0x4e8>
    80007078:	f7843783          	ld	a5,-136(s0)
    8000707c:	0007a603          	lw	a2,0(a5)
    80007080:	00878793          	addi	a5,a5,8
    80007084:	f6f43c23          	sd	a5,-136(s0)
    80007088:	42064a63          	bltz	a2,800074bc <__printf+0x524>
    8000708c:	00a00713          	li	a4,10
    80007090:	02e677bb          	remuw	a5,a2,a4
    80007094:	00002d97          	auipc	s11,0x2
    80007098:	73cd8d93          	addi	s11,s11,1852 # 800097d0 <digits>
    8000709c:	00900593          	li	a1,9
    800070a0:	0006051b          	sext.w	a0,a2
    800070a4:	00000c93          	li	s9,0
    800070a8:	02079793          	slli	a5,a5,0x20
    800070ac:	0207d793          	srli	a5,a5,0x20
    800070b0:	00fd87b3          	add	a5,s11,a5
    800070b4:	0007c783          	lbu	a5,0(a5)
    800070b8:	02e656bb          	divuw	a3,a2,a4
    800070bc:	f8f40023          	sb	a5,-128(s0)
    800070c0:	14c5d863          	bge	a1,a2,80007210 <__printf+0x278>
    800070c4:	06300593          	li	a1,99
    800070c8:	00100c93          	li	s9,1
    800070cc:	02e6f7bb          	remuw	a5,a3,a4
    800070d0:	02079793          	slli	a5,a5,0x20
    800070d4:	0207d793          	srli	a5,a5,0x20
    800070d8:	00fd87b3          	add	a5,s11,a5
    800070dc:	0007c783          	lbu	a5,0(a5)
    800070e0:	02e6d73b          	divuw	a4,a3,a4
    800070e4:	f8f400a3          	sb	a5,-127(s0)
    800070e8:	12a5f463          	bgeu	a1,a0,80007210 <__printf+0x278>
    800070ec:	00a00693          	li	a3,10
    800070f0:	00900593          	li	a1,9
    800070f4:	02d777bb          	remuw	a5,a4,a3
    800070f8:	02079793          	slli	a5,a5,0x20
    800070fc:	0207d793          	srli	a5,a5,0x20
    80007100:	00fd87b3          	add	a5,s11,a5
    80007104:	0007c503          	lbu	a0,0(a5)
    80007108:	02d757bb          	divuw	a5,a4,a3
    8000710c:	f8a40123          	sb	a0,-126(s0)
    80007110:	48e5f263          	bgeu	a1,a4,80007594 <__printf+0x5fc>
    80007114:	06300513          	li	a0,99
    80007118:	02d7f5bb          	remuw	a1,a5,a3
    8000711c:	02059593          	slli	a1,a1,0x20
    80007120:	0205d593          	srli	a1,a1,0x20
    80007124:	00bd85b3          	add	a1,s11,a1
    80007128:	0005c583          	lbu	a1,0(a1)
    8000712c:	02d7d7bb          	divuw	a5,a5,a3
    80007130:	f8b401a3          	sb	a1,-125(s0)
    80007134:	48e57263          	bgeu	a0,a4,800075b8 <__printf+0x620>
    80007138:	3e700513          	li	a0,999
    8000713c:	02d7f5bb          	remuw	a1,a5,a3
    80007140:	02059593          	slli	a1,a1,0x20
    80007144:	0205d593          	srli	a1,a1,0x20
    80007148:	00bd85b3          	add	a1,s11,a1
    8000714c:	0005c583          	lbu	a1,0(a1)
    80007150:	02d7d7bb          	divuw	a5,a5,a3
    80007154:	f8b40223          	sb	a1,-124(s0)
    80007158:	46e57663          	bgeu	a0,a4,800075c4 <__printf+0x62c>
    8000715c:	02d7f5bb          	remuw	a1,a5,a3
    80007160:	02059593          	slli	a1,a1,0x20
    80007164:	0205d593          	srli	a1,a1,0x20
    80007168:	00bd85b3          	add	a1,s11,a1
    8000716c:	0005c583          	lbu	a1,0(a1)
    80007170:	02d7d7bb          	divuw	a5,a5,a3
    80007174:	f8b402a3          	sb	a1,-123(s0)
    80007178:	46ea7863          	bgeu	s4,a4,800075e8 <__printf+0x650>
    8000717c:	02d7f5bb          	remuw	a1,a5,a3
    80007180:	02059593          	slli	a1,a1,0x20
    80007184:	0205d593          	srli	a1,a1,0x20
    80007188:	00bd85b3          	add	a1,s11,a1
    8000718c:	0005c583          	lbu	a1,0(a1)
    80007190:	02d7d7bb          	divuw	a5,a5,a3
    80007194:	f8b40323          	sb	a1,-122(s0)
    80007198:	3eeaf863          	bgeu	s5,a4,80007588 <__printf+0x5f0>
    8000719c:	02d7f5bb          	remuw	a1,a5,a3
    800071a0:	02059593          	slli	a1,a1,0x20
    800071a4:	0205d593          	srli	a1,a1,0x20
    800071a8:	00bd85b3          	add	a1,s11,a1
    800071ac:	0005c583          	lbu	a1,0(a1)
    800071b0:	02d7d7bb          	divuw	a5,a5,a3
    800071b4:	f8b403a3          	sb	a1,-121(s0)
    800071b8:	42eb7e63          	bgeu	s6,a4,800075f4 <__printf+0x65c>
    800071bc:	02d7f5bb          	remuw	a1,a5,a3
    800071c0:	02059593          	slli	a1,a1,0x20
    800071c4:	0205d593          	srli	a1,a1,0x20
    800071c8:	00bd85b3          	add	a1,s11,a1
    800071cc:	0005c583          	lbu	a1,0(a1)
    800071d0:	02d7d7bb          	divuw	a5,a5,a3
    800071d4:	f8b40423          	sb	a1,-120(s0)
    800071d8:	42ebfc63          	bgeu	s7,a4,80007610 <__printf+0x678>
    800071dc:	02079793          	slli	a5,a5,0x20
    800071e0:	0207d793          	srli	a5,a5,0x20
    800071e4:	00fd8db3          	add	s11,s11,a5
    800071e8:	000dc703          	lbu	a4,0(s11)
    800071ec:	00a00793          	li	a5,10
    800071f0:	00900c93          	li	s9,9
    800071f4:	f8e404a3          	sb	a4,-119(s0)
    800071f8:	00065c63          	bgez	a2,80007210 <__printf+0x278>
    800071fc:	f9040713          	addi	a4,s0,-112
    80007200:	00f70733          	add	a4,a4,a5
    80007204:	02d00693          	li	a3,45
    80007208:	fed70823          	sb	a3,-16(a4)
    8000720c:	00078c93          	mv	s9,a5
    80007210:	f8040793          	addi	a5,s0,-128
    80007214:	01978cb3          	add	s9,a5,s9
    80007218:	f7f40d13          	addi	s10,s0,-129
    8000721c:	000cc503          	lbu	a0,0(s9)
    80007220:	fffc8c93          	addi	s9,s9,-1
    80007224:	00000097          	auipc	ra,0x0
    80007228:	b90080e7          	jalr	-1136(ra) # 80006db4 <consputc>
    8000722c:	ffac98e3          	bne	s9,s10,8000721c <__printf+0x284>
    80007230:	00094503          	lbu	a0,0(s2)
    80007234:	e00514e3          	bnez	a0,8000703c <__printf+0xa4>
    80007238:	1a0c1663          	bnez	s8,800073e4 <__printf+0x44c>
    8000723c:	08813083          	ld	ra,136(sp)
    80007240:	08013403          	ld	s0,128(sp)
    80007244:	07813483          	ld	s1,120(sp)
    80007248:	07013903          	ld	s2,112(sp)
    8000724c:	06813983          	ld	s3,104(sp)
    80007250:	06013a03          	ld	s4,96(sp)
    80007254:	05813a83          	ld	s5,88(sp)
    80007258:	05013b03          	ld	s6,80(sp)
    8000725c:	04813b83          	ld	s7,72(sp)
    80007260:	04013c03          	ld	s8,64(sp)
    80007264:	03813c83          	ld	s9,56(sp)
    80007268:	03013d03          	ld	s10,48(sp)
    8000726c:	02813d83          	ld	s11,40(sp)
    80007270:	0d010113          	addi	sp,sp,208
    80007274:	00008067          	ret
    80007278:	07300713          	li	a4,115
    8000727c:	1ce78a63          	beq	a5,a4,80007450 <__printf+0x4b8>
    80007280:	07800713          	li	a4,120
    80007284:	1ee79e63          	bne	a5,a4,80007480 <__printf+0x4e8>
    80007288:	f7843783          	ld	a5,-136(s0)
    8000728c:	0007a703          	lw	a4,0(a5)
    80007290:	00878793          	addi	a5,a5,8
    80007294:	f6f43c23          	sd	a5,-136(s0)
    80007298:	28074263          	bltz	a4,8000751c <__printf+0x584>
    8000729c:	00002d97          	auipc	s11,0x2
    800072a0:	534d8d93          	addi	s11,s11,1332 # 800097d0 <digits>
    800072a4:	00f77793          	andi	a5,a4,15
    800072a8:	00fd87b3          	add	a5,s11,a5
    800072ac:	0007c683          	lbu	a3,0(a5)
    800072b0:	00f00613          	li	a2,15
    800072b4:	0007079b          	sext.w	a5,a4
    800072b8:	f8d40023          	sb	a3,-128(s0)
    800072bc:	0047559b          	srliw	a1,a4,0x4
    800072c0:	0047569b          	srliw	a3,a4,0x4
    800072c4:	00000c93          	li	s9,0
    800072c8:	0ee65063          	bge	a2,a4,800073a8 <__printf+0x410>
    800072cc:	00f6f693          	andi	a3,a3,15
    800072d0:	00dd86b3          	add	a3,s11,a3
    800072d4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800072d8:	0087d79b          	srliw	a5,a5,0x8
    800072dc:	00100c93          	li	s9,1
    800072e0:	f8d400a3          	sb	a3,-127(s0)
    800072e4:	0cb67263          	bgeu	a2,a1,800073a8 <__printf+0x410>
    800072e8:	00f7f693          	andi	a3,a5,15
    800072ec:	00dd86b3          	add	a3,s11,a3
    800072f0:	0006c583          	lbu	a1,0(a3)
    800072f4:	00f00613          	li	a2,15
    800072f8:	0047d69b          	srliw	a3,a5,0x4
    800072fc:	f8b40123          	sb	a1,-126(s0)
    80007300:	0047d593          	srli	a1,a5,0x4
    80007304:	28f67e63          	bgeu	a2,a5,800075a0 <__printf+0x608>
    80007308:	00f6f693          	andi	a3,a3,15
    8000730c:	00dd86b3          	add	a3,s11,a3
    80007310:	0006c503          	lbu	a0,0(a3)
    80007314:	0087d813          	srli	a6,a5,0x8
    80007318:	0087d69b          	srliw	a3,a5,0x8
    8000731c:	f8a401a3          	sb	a0,-125(s0)
    80007320:	28b67663          	bgeu	a2,a1,800075ac <__printf+0x614>
    80007324:	00f6f693          	andi	a3,a3,15
    80007328:	00dd86b3          	add	a3,s11,a3
    8000732c:	0006c583          	lbu	a1,0(a3)
    80007330:	00c7d513          	srli	a0,a5,0xc
    80007334:	00c7d69b          	srliw	a3,a5,0xc
    80007338:	f8b40223          	sb	a1,-124(s0)
    8000733c:	29067a63          	bgeu	a2,a6,800075d0 <__printf+0x638>
    80007340:	00f6f693          	andi	a3,a3,15
    80007344:	00dd86b3          	add	a3,s11,a3
    80007348:	0006c583          	lbu	a1,0(a3)
    8000734c:	0107d813          	srli	a6,a5,0x10
    80007350:	0107d69b          	srliw	a3,a5,0x10
    80007354:	f8b402a3          	sb	a1,-123(s0)
    80007358:	28a67263          	bgeu	a2,a0,800075dc <__printf+0x644>
    8000735c:	00f6f693          	andi	a3,a3,15
    80007360:	00dd86b3          	add	a3,s11,a3
    80007364:	0006c683          	lbu	a3,0(a3)
    80007368:	0147d79b          	srliw	a5,a5,0x14
    8000736c:	f8d40323          	sb	a3,-122(s0)
    80007370:	21067663          	bgeu	a2,a6,8000757c <__printf+0x5e4>
    80007374:	02079793          	slli	a5,a5,0x20
    80007378:	0207d793          	srli	a5,a5,0x20
    8000737c:	00fd8db3          	add	s11,s11,a5
    80007380:	000dc683          	lbu	a3,0(s11)
    80007384:	00800793          	li	a5,8
    80007388:	00700c93          	li	s9,7
    8000738c:	f8d403a3          	sb	a3,-121(s0)
    80007390:	00075c63          	bgez	a4,800073a8 <__printf+0x410>
    80007394:	f9040713          	addi	a4,s0,-112
    80007398:	00f70733          	add	a4,a4,a5
    8000739c:	02d00693          	li	a3,45
    800073a0:	fed70823          	sb	a3,-16(a4)
    800073a4:	00078c93          	mv	s9,a5
    800073a8:	f8040793          	addi	a5,s0,-128
    800073ac:	01978cb3          	add	s9,a5,s9
    800073b0:	f7f40d13          	addi	s10,s0,-129
    800073b4:	000cc503          	lbu	a0,0(s9)
    800073b8:	fffc8c93          	addi	s9,s9,-1
    800073bc:	00000097          	auipc	ra,0x0
    800073c0:	9f8080e7          	jalr	-1544(ra) # 80006db4 <consputc>
    800073c4:	ff9d18e3          	bne	s10,s9,800073b4 <__printf+0x41c>
    800073c8:	0100006f          	j	800073d8 <__printf+0x440>
    800073cc:	00000097          	auipc	ra,0x0
    800073d0:	9e8080e7          	jalr	-1560(ra) # 80006db4 <consputc>
    800073d4:	000c8493          	mv	s1,s9
    800073d8:	00094503          	lbu	a0,0(s2)
    800073dc:	c60510e3          	bnez	a0,8000703c <__printf+0xa4>
    800073e0:	e40c0ee3          	beqz	s8,8000723c <__printf+0x2a4>
    800073e4:	00005517          	auipc	a0,0x5
    800073e8:	65c50513          	addi	a0,a0,1628 # 8000ca40 <pr>
    800073ec:	00001097          	auipc	ra,0x1
    800073f0:	94c080e7          	jalr	-1716(ra) # 80007d38 <release>
    800073f4:	e49ff06f          	j	8000723c <__printf+0x2a4>
    800073f8:	f7843783          	ld	a5,-136(s0)
    800073fc:	03000513          	li	a0,48
    80007400:	01000d13          	li	s10,16
    80007404:	00878713          	addi	a4,a5,8
    80007408:	0007bc83          	ld	s9,0(a5)
    8000740c:	f6e43c23          	sd	a4,-136(s0)
    80007410:	00000097          	auipc	ra,0x0
    80007414:	9a4080e7          	jalr	-1628(ra) # 80006db4 <consputc>
    80007418:	07800513          	li	a0,120
    8000741c:	00000097          	auipc	ra,0x0
    80007420:	998080e7          	jalr	-1640(ra) # 80006db4 <consputc>
    80007424:	00002d97          	auipc	s11,0x2
    80007428:	3acd8d93          	addi	s11,s11,940 # 800097d0 <digits>
    8000742c:	03ccd793          	srli	a5,s9,0x3c
    80007430:	00fd87b3          	add	a5,s11,a5
    80007434:	0007c503          	lbu	a0,0(a5)
    80007438:	fffd0d1b          	addiw	s10,s10,-1
    8000743c:	004c9c93          	slli	s9,s9,0x4
    80007440:	00000097          	auipc	ra,0x0
    80007444:	974080e7          	jalr	-1676(ra) # 80006db4 <consputc>
    80007448:	fe0d12e3          	bnez	s10,8000742c <__printf+0x494>
    8000744c:	f8dff06f          	j	800073d8 <__printf+0x440>
    80007450:	f7843783          	ld	a5,-136(s0)
    80007454:	0007bc83          	ld	s9,0(a5)
    80007458:	00878793          	addi	a5,a5,8
    8000745c:	f6f43c23          	sd	a5,-136(s0)
    80007460:	000c9a63          	bnez	s9,80007474 <__printf+0x4dc>
    80007464:	1080006f          	j	8000756c <__printf+0x5d4>
    80007468:	001c8c93          	addi	s9,s9,1
    8000746c:	00000097          	auipc	ra,0x0
    80007470:	948080e7          	jalr	-1720(ra) # 80006db4 <consputc>
    80007474:	000cc503          	lbu	a0,0(s9)
    80007478:	fe0518e3          	bnez	a0,80007468 <__printf+0x4d0>
    8000747c:	f5dff06f          	j	800073d8 <__printf+0x440>
    80007480:	02500513          	li	a0,37
    80007484:	00000097          	auipc	ra,0x0
    80007488:	930080e7          	jalr	-1744(ra) # 80006db4 <consputc>
    8000748c:	000c8513          	mv	a0,s9
    80007490:	00000097          	auipc	ra,0x0
    80007494:	924080e7          	jalr	-1756(ra) # 80006db4 <consputc>
    80007498:	f41ff06f          	j	800073d8 <__printf+0x440>
    8000749c:	02500513          	li	a0,37
    800074a0:	00000097          	auipc	ra,0x0
    800074a4:	914080e7          	jalr	-1772(ra) # 80006db4 <consputc>
    800074a8:	f31ff06f          	j	800073d8 <__printf+0x440>
    800074ac:	00030513          	mv	a0,t1
    800074b0:	00000097          	auipc	ra,0x0
    800074b4:	7bc080e7          	jalr	1980(ra) # 80007c6c <acquire>
    800074b8:	b4dff06f          	j	80007004 <__printf+0x6c>
    800074bc:	40c0053b          	negw	a0,a2
    800074c0:	00a00713          	li	a4,10
    800074c4:	02e576bb          	remuw	a3,a0,a4
    800074c8:	00002d97          	auipc	s11,0x2
    800074cc:	308d8d93          	addi	s11,s11,776 # 800097d0 <digits>
    800074d0:	ff700593          	li	a1,-9
    800074d4:	02069693          	slli	a3,a3,0x20
    800074d8:	0206d693          	srli	a3,a3,0x20
    800074dc:	00dd86b3          	add	a3,s11,a3
    800074e0:	0006c683          	lbu	a3,0(a3)
    800074e4:	02e557bb          	divuw	a5,a0,a4
    800074e8:	f8d40023          	sb	a3,-128(s0)
    800074ec:	10b65e63          	bge	a2,a1,80007608 <__printf+0x670>
    800074f0:	06300593          	li	a1,99
    800074f4:	02e7f6bb          	remuw	a3,a5,a4
    800074f8:	02069693          	slli	a3,a3,0x20
    800074fc:	0206d693          	srli	a3,a3,0x20
    80007500:	00dd86b3          	add	a3,s11,a3
    80007504:	0006c683          	lbu	a3,0(a3)
    80007508:	02e7d73b          	divuw	a4,a5,a4
    8000750c:	00200793          	li	a5,2
    80007510:	f8d400a3          	sb	a3,-127(s0)
    80007514:	bca5ece3          	bltu	a1,a0,800070ec <__printf+0x154>
    80007518:	ce5ff06f          	j	800071fc <__printf+0x264>
    8000751c:	40e007bb          	negw	a5,a4
    80007520:	00002d97          	auipc	s11,0x2
    80007524:	2b0d8d93          	addi	s11,s11,688 # 800097d0 <digits>
    80007528:	00f7f693          	andi	a3,a5,15
    8000752c:	00dd86b3          	add	a3,s11,a3
    80007530:	0006c583          	lbu	a1,0(a3)
    80007534:	ff100613          	li	a2,-15
    80007538:	0047d69b          	srliw	a3,a5,0x4
    8000753c:	f8b40023          	sb	a1,-128(s0)
    80007540:	0047d59b          	srliw	a1,a5,0x4
    80007544:	0ac75e63          	bge	a4,a2,80007600 <__printf+0x668>
    80007548:	00f6f693          	andi	a3,a3,15
    8000754c:	00dd86b3          	add	a3,s11,a3
    80007550:	0006c603          	lbu	a2,0(a3)
    80007554:	00f00693          	li	a3,15
    80007558:	0087d79b          	srliw	a5,a5,0x8
    8000755c:	f8c400a3          	sb	a2,-127(s0)
    80007560:	d8b6e4e3          	bltu	a3,a1,800072e8 <__printf+0x350>
    80007564:	00200793          	li	a5,2
    80007568:	e2dff06f          	j	80007394 <__printf+0x3fc>
    8000756c:	00002c97          	auipc	s9,0x2
    80007570:	244c8c93          	addi	s9,s9,580 # 800097b0 <CONSOLE_STATUS+0x7a0>
    80007574:	02800513          	li	a0,40
    80007578:	ef1ff06f          	j	80007468 <__printf+0x4d0>
    8000757c:	00700793          	li	a5,7
    80007580:	00600c93          	li	s9,6
    80007584:	e0dff06f          	j	80007390 <__printf+0x3f8>
    80007588:	00700793          	li	a5,7
    8000758c:	00600c93          	li	s9,6
    80007590:	c69ff06f          	j	800071f8 <__printf+0x260>
    80007594:	00300793          	li	a5,3
    80007598:	00200c93          	li	s9,2
    8000759c:	c5dff06f          	j	800071f8 <__printf+0x260>
    800075a0:	00300793          	li	a5,3
    800075a4:	00200c93          	li	s9,2
    800075a8:	de9ff06f          	j	80007390 <__printf+0x3f8>
    800075ac:	00400793          	li	a5,4
    800075b0:	00300c93          	li	s9,3
    800075b4:	dddff06f          	j	80007390 <__printf+0x3f8>
    800075b8:	00400793          	li	a5,4
    800075bc:	00300c93          	li	s9,3
    800075c0:	c39ff06f          	j	800071f8 <__printf+0x260>
    800075c4:	00500793          	li	a5,5
    800075c8:	00400c93          	li	s9,4
    800075cc:	c2dff06f          	j	800071f8 <__printf+0x260>
    800075d0:	00500793          	li	a5,5
    800075d4:	00400c93          	li	s9,4
    800075d8:	db9ff06f          	j	80007390 <__printf+0x3f8>
    800075dc:	00600793          	li	a5,6
    800075e0:	00500c93          	li	s9,5
    800075e4:	dadff06f          	j	80007390 <__printf+0x3f8>
    800075e8:	00600793          	li	a5,6
    800075ec:	00500c93          	li	s9,5
    800075f0:	c09ff06f          	j	800071f8 <__printf+0x260>
    800075f4:	00800793          	li	a5,8
    800075f8:	00700c93          	li	s9,7
    800075fc:	bfdff06f          	j	800071f8 <__printf+0x260>
    80007600:	00100793          	li	a5,1
    80007604:	d91ff06f          	j	80007394 <__printf+0x3fc>
    80007608:	00100793          	li	a5,1
    8000760c:	bf1ff06f          	j	800071fc <__printf+0x264>
    80007610:	00900793          	li	a5,9
    80007614:	00800c93          	li	s9,8
    80007618:	be1ff06f          	j	800071f8 <__printf+0x260>
    8000761c:	00002517          	auipc	a0,0x2
    80007620:	19c50513          	addi	a0,a0,412 # 800097b8 <CONSOLE_STATUS+0x7a8>
    80007624:	00000097          	auipc	ra,0x0
    80007628:	918080e7          	jalr	-1768(ra) # 80006f3c <panic>

000000008000762c <printfinit>:
    8000762c:	fe010113          	addi	sp,sp,-32
    80007630:	00813823          	sd	s0,16(sp)
    80007634:	00913423          	sd	s1,8(sp)
    80007638:	00113c23          	sd	ra,24(sp)
    8000763c:	02010413          	addi	s0,sp,32
    80007640:	00005497          	auipc	s1,0x5
    80007644:	40048493          	addi	s1,s1,1024 # 8000ca40 <pr>
    80007648:	00048513          	mv	a0,s1
    8000764c:	00002597          	auipc	a1,0x2
    80007650:	17c58593          	addi	a1,a1,380 # 800097c8 <CONSOLE_STATUS+0x7b8>
    80007654:	00000097          	auipc	ra,0x0
    80007658:	5f4080e7          	jalr	1524(ra) # 80007c48 <initlock>
    8000765c:	01813083          	ld	ra,24(sp)
    80007660:	01013403          	ld	s0,16(sp)
    80007664:	0004ac23          	sw	zero,24(s1)
    80007668:	00813483          	ld	s1,8(sp)
    8000766c:	02010113          	addi	sp,sp,32
    80007670:	00008067          	ret

0000000080007674 <uartinit>:
    80007674:	ff010113          	addi	sp,sp,-16
    80007678:	00813423          	sd	s0,8(sp)
    8000767c:	01010413          	addi	s0,sp,16
    80007680:	100007b7          	lui	a5,0x10000
    80007684:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007688:	f8000713          	li	a4,-128
    8000768c:	00e781a3          	sb	a4,3(a5)
    80007690:	00300713          	li	a4,3
    80007694:	00e78023          	sb	a4,0(a5)
    80007698:	000780a3          	sb	zero,1(a5)
    8000769c:	00e781a3          	sb	a4,3(a5)
    800076a0:	00700693          	li	a3,7
    800076a4:	00d78123          	sb	a3,2(a5)
    800076a8:	00e780a3          	sb	a4,1(a5)
    800076ac:	00813403          	ld	s0,8(sp)
    800076b0:	01010113          	addi	sp,sp,16
    800076b4:	00008067          	ret

00000000800076b8 <uartputc>:
    800076b8:	00004797          	auipc	a5,0x4
    800076bc:	0c07a783          	lw	a5,192(a5) # 8000b778 <panicked>
    800076c0:	00078463          	beqz	a5,800076c8 <uartputc+0x10>
    800076c4:	0000006f          	j	800076c4 <uartputc+0xc>
    800076c8:	fd010113          	addi	sp,sp,-48
    800076cc:	02813023          	sd	s0,32(sp)
    800076d0:	00913c23          	sd	s1,24(sp)
    800076d4:	01213823          	sd	s2,16(sp)
    800076d8:	01313423          	sd	s3,8(sp)
    800076dc:	02113423          	sd	ra,40(sp)
    800076e0:	03010413          	addi	s0,sp,48
    800076e4:	00004917          	auipc	s2,0x4
    800076e8:	09c90913          	addi	s2,s2,156 # 8000b780 <uart_tx_r>
    800076ec:	00093783          	ld	a5,0(s2)
    800076f0:	00004497          	auipc	s1,0x4
    800076f4:	09848493          	addi	s1,s1,152 # 8000b788 <uart_tx_w>
    800076f8:	0004b703          	ld	a4,0(s1)
    800076fc:	02078693          	addi	a3,a5,32
    80007700:	00050993          	mv	s3,a0
    80007704:	02e69c63          	bne	a3,a4,8000773c <uartputc+0x84>
    80007708:	00001097          	auipc	ra,0x1
    8000770c:	834080e7          	jalr	-1996(ra) # 80007f3c <push_on>
    80007710:	00093783          	ld	a5,0(s2)
    80007714:	0004b703          	ld	a4,0(s1)
    80007718:	02078793          	addi	a5,a5,32
    8000771c:	00e79463          	bne	a5,a4,80007724 <uartputc+0x6c>
    80007720:	0000006f          	j	80007720 <uartputc+0x68>
    80007724:	00001097          	auipc	ra,0x1
    80007728:	88c080e7          	jalr	-1908(ra) # 80007fb0 <pop_on>
    8000772c:	00093783          	ld	a5,0(s2)
    80007730:	0004b703          	ld	a4,0(s1)
    80007734:	02078693          	addi	a3,a5,32
    80007738:	fce688e3          	beq	a3,a4,80007708 <uartputc+0x50>
    8000773c:	01f77693          	andi	a3,a4,31
    80007740:	00005597          	auipc	a1,0x5
    80007744:	32058593          	addi	a1,a1,800 # 8000ca60 <uart_tx_buf>
    80007748:	00d586b3          	add	a3,a1,a3
    8000774c:	00170713          	addi	a4,a4,1
    80007750:	01368023          	sb	s3,0(a3)
    80007754:	00e4b023          	sd	a4,0(s1)
    80007758:	10000637          	lui	a2,0x10000
    8000775c:	02f71063          	bne	a4,a5,8000777c <uartputc+0xc4>
    80007760:	0340006f          	j	80007794 <uartputc+0xdc>
    80007764:	00074703          	lbu	a4,0(a4)
    80007768:	00f93023          	sd	a5,0(s2)
    8000776c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007770:	00093783          	ld	a5,0(s2)
    80007774:	0004b703          	ld	a4,0(s1)
    80007778:	00f70e63          	beq	a4,a5,80007794 <uartputc+0xdc>
    8000777c:	00564683          	lbu	a3,5(a2)
    80007780:	01f7f713          	andi	a4,a5,31
    80007784:	00e58733          	add	a4,a1,a4
    80007788:	0206f693          	andi	a3,a3,32
    8000778c:	00178793          	addi	a5,a5,1
    80007790:	fc069ae3          	bnez	a3,80007764 <uartputc+0xac>
    80007794:	02813083          	ld	ra,40(sp)
    80007798:	02013403          	ld	s0,32(sp)
    8000779c:	01813483          	ld	s1,24(sp)
    800077a0:	01013903          	ld	s2,16(sp)
    800077a4:	00813983          	ld	s3,8(sp)
    800077a8:	03010113          	addi	sp,sp,48
    800077ac:	00008067          	ret

00000000800077b0 <uartputc_sync>:
    800077b0:	ff010113          	addi	sp,sp,-16
    800077b4:	00813423          	sd	s0,8(sp)
    800077b8:	01010413          	addi	s0,sp,16
    800077bc:	00004717          	auipc	a4,0x4
    800077c0:	fbc72703          	lw	a4,-68(a4) # 8000b778 <panicked>
    800077c4:	02071663          	bnez	a4,800077f0 <uartputc_sync+0x40>
    800077c8:	00050793          	mv	a5,a0
    800077cc:	100006b7          	lui	a3,0x10000
    800077d0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800077d4:	02077713          	andi	a4,a4,32
    800077d8:	fe070ce3          	beqz	a4,800077d0 <uartputc_sync+0x20>
    800077dc:	0ff7f793          	andi	a5,a5,255
    800077e0:	00f68023          	sb	a5,0(a3)
    800077e4:	00813403          	ld	s0,8(sp)
    800077e8:	01010113          	addi	sp,sp,16
    800077ec:	00008067          	ret
    800077f0:	0000006f          	j	800077f0 <uartputc_sync+0x40>

00000000800077f4 <uartstart>:
    800077f4:	ff010113          	addi	sp,sp,-16
    800077f8:	00813423          	sd	s0,8(sp)
    800077fc:	01010413          	addi	s0,sp,16
    80007800:	00004617          	auipc	a2,0x4
    80007804:	f8060613          	addi	a2,a2,-128 # 8000b780 <uart_tx_r>
    80007808:	00004517          	auipc	a0,0x4
    8000780c:	f8050513          	addi	a0,a0,-128 # 8000b788 <uart_tx_w>
    80007810:	00063783          	ld	a5,0(a2)
    80007814:	00053703          	ld	a4,0(a0)
    80007818:	04f70263          	beq	a4,a5,8000785c <uartstart+0x68>
    8000781c:	100005b7          	lui	a1,0x10000
    80007820:	00005817          	auipc	a6,0x5
    80007824:	24080813          	addi	a6,a6,576 # 8000ca60 <uart_tx_buf>
    80007828:	01c0006f          	j	80007844 <uartstart+0x50>
    8000782c:	0006c703          	lbu	a4,0(a3)
    80007830:	00f63023          	sd	a5,0(a2)
    80007834:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007838:	00063783          	ld	a5,0(a2)
    8000783c:	00053703          	ld	a4,0(a0)
    80007840:	00f70e63          	beq	a4,a5,8000785c <uartstart+0x68>
    80007844:	01f7f713          	andi	a4,a5,31
    80007848:	00e806b3          	add	a3,a6,a4
    8000784c:	0055c703          	lbu	a4,5(a1)
    80007850:	00178793          	addi	a5,a5,1
    80007854:	02077713          	andi	a4,a4,32
    80007858:	fc071ae3          	bnez	a4,8000782c <uartstart+0x38>
    8000785c:	00813403          	ld	s0,8(sp)
    80007860:	01010113          	addi	sp,sp,16
    80007864:	00008067          	ret

0000000080007868 <uartgetc>:
    80007868:	ff010113          	addi	sp,sp,-16
    8000786c:	00813423          	sd	s0,8(sp)
    80007870:	01010413          	addi	s0,sp,16
    80007874:	10000737          	lui	a4,0x10000
    80007878:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000787c:	0017f793          	andi	a5,a5,1
    80007880:	00078c63          	beqz	a5,80007898 <uartgetc+0x30>
    80007884:	00074503          	lbu	a0,0(a4)
    80007888:	0ff57513          	andi	a0,a0,255
    8000788c:	00813403          	ld	s0,8(sp)
    80007890:	01010113          	addi	sp,sp,16
    80007894:	00008067          	ret
    80007898:	fff00513          	li	a0,-1
    8000789c:	ff1ff06f          	j	8000788c <uartgetc+0x24>

00000000800078a0 <uartintr>:
    800078a0:	100007b7          	lui	a5,0x10000
    800078a4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800078a8:	0017f793          	andi	a5,a5,1
    800078ac:	0a078463          	beqz	a5,80007954 <uartintr+0xb4>
    800078b0:	fe010113          	addi	sp,sp,-32
    800078b4:	00813823          	sd	s0,16(sp)
    800078b8:	00913423          	sd	s1,8(sp)
    800078bc:	00113c23          	sd	ra,24(sp)
    800078c0:	02010413          	addi	s0,sp,32
    800078c4:	100004b7          	lui	s1,0x10000
    800078c8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800078cc:	0ff57513          	andi	a0,a0,255
    800078d0:	fffff097          	auipc	ra,0xfffff
    800078d4:	534080e7          	jalr	1332(ra) # 80006e04 <consoleintr>
    800078d8:	0054c783          	lbu	a5,5(s1)
    800078dc:	0017f793          	andi	a5,a5,1
    800078e0:	fe0794e3          	bnez	a5,800078c8 <uartintr+0x28>
    800078e4:	00004617          	auipc	a2,0x4
    800078e8:	e9c60613          	addi	a2,a2,-356 # 8000b780 <uart_tx_r>
    800078ec:	00004517          	auipc	a0,0x4
    800078f0:	e9c50513          	addi	a0,a0,-356 # 8000b788 <uart_tx_w>
    800078f4:	00063783          	ld	a5,0(a2)
    800078f8:	00053703          	ld	a4,0(a0)
    800078fc:	04f70263          	beq	a4,a5,80007940 <uartintr+0xa0>
    80007900:	100005b7          	lui	a1,0x10000
    80007904:	00005817          	auipc	a6,0x5
    80007908:	15c80813          	addi	a6,a6,348 # 8000ca60 <uart_tx_buf>
    8000790c:	01c0006f          	j	80007928 <uartintr+0x88>
    80007910:	0006c703          	lbu	a4,0(a3)
    80007914:	00f63023          	sd	a5,0(a2)
    80007918:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000791c:	00063783          	ld	a5,0(a2)
    80007920:	00053703          	ld	a4,0(a0)
    80007924:	00f70e63          	beq	a4,a5,80007940 <uartintr+0xa0>
    80007928:	01f7f713          	andi	a4,a5,31
    8000792c:	00e806b3          	add	a3,a6,a4
    80007930:	0055c703          	lbu	a4,5(a1)
    80007934:	00178793          	addi	a5,a5,1
    80007938:	02077713          	andi	a4,a4,32
    8000793c:	fc071ae3          	bnez	a4,80007910 <uartintr+0x70>
    80007940:	01813083          	ld	ra,24(sp)
    80007944:	01013403          	ld	s0,16(sp)
    80007948:	00813483          	ld	s1,8(sp)
    8000794c:	02010113          	addi	sp,sp,32
    80007950:	00008067          	ret
    80007954:	00004617          	auipc	a2,0x4
    80007958:	e2c60613          	addi	a2,a2,-468 # 8000b780 <uart_tx_r>
    8000795c:	00004517          	auipc	a0,0x4
    80007960:	e2c50513          	addi	a0,a0,-468 # 8000b788 <uart_tx_w>
    80007964:	00063783          	ld	a5,0(a2)
    80007968:	00053703          	ld	a4,0(a0)
    8000796c:	04f70263          	beq	a4,a5,800079b0 <uartintr+0x110>
    80007970:	100005b7          	lui	a1,0x10000
    80007974:	00005817          	auipc	a6,0x5
    80007978:	0ec80813          	addi	a6,a6,236 # 8000ca60 <uart_tx_buf>
    8000797c:	01c0006f          	j	80007998 <uartintr+0xf8>
    80007980:	0006c703          	lbu	a4,0(a3)
    80007984:	00f63023          	sd	a5,0(a2)
    80007988:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000798c:	00063783          	ld	a5,0(a2)
    80007990:	00053703          	ld	a4,0(a0)
    80007994:	02f70063          	beq	a4,a5,800079b4 <uartintr+0x114>
    80007998:	01f7f713          	andi	a4,a5,31
    8000799c:	00e806b3          	add	a3,a6,a4
    800079a0:	0055c703          	lbu	a4,5(a1)
    800079a4:	00178793          	addi	a5,a5,1
    800079a8:	02077713          	andi	a4,a4,32
    800079ac:	fc071ae3          	bnez	a4,80007980 <uartintr+0xe0>
    800079b0:	00008067          	ret
    800079b4:	00008067          	ret

00000000800079b8 <kinit>:
    800079b8:	fc010113          	addi	sp,sp,-64
    800079bc:	02913423          	sd	s1,40(sp)
    800079c0:	fffff7b7          	lui	a5,0xfffff
    800079c4:	00006497          	auipc	s1,0x6
    800079c8:	0bb48493          	addi	s1,s1,187 # 8000da7f <end+0xfff>
    800079cc:	02813823          	sd	s0,48(sp)
    800079d0:	01313c23          	sd	s3,24(sp)
    800079d4:	00f4f4b3          	and	s1,s1,a5
    800079d8:	02113c23          	sd	ra,56(sp)
    800079dc:	03213023          	sd	s2,32(sp)
    800079e0:	01413823          	sd	s4,16(sp)
    800079e4:	01513423          	sd	s5,8(sp)
    800079e8:	04010413          	addi	s0,sp,64
    800079ec:	000017b7          	lui	a5,0x1
    800079f0:	01100993          	li	s3,17
    800079f4:	00f487b3          	add	a5,s1,a5
    800079f8:	01b99993          	slli	s3,s3,0x1b
    800079fc:	06f9e063          	bltu	s3,a5,80007a5c <kinit+0xa4>
    80007a00:	00005a97          	auipc	s5,0x5
    80007a04:	080a8a93          	addi	s5,s5,128 # 8000ca80 <end>
    80007a08:	0754ec63          	bltu	s1,s5,80007a80 <kinit+0xc8>
    80007a0c:	0734fa63          	bgeu	s1,s3,80007a80 <kinit+0xc8>
    80007a10:	00088a37          	lui	s4,0x88
    80007a14:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80007a18:	00004917          	auipc	s2,0x4
    80007a1c:	d7890913          	addi	s2,s2,-648 # 8000b790 <kmem>
    80007a20:	00ca1a13          	slli	s4,s4,0xc
    80007a24:	0140006f          	j	80007a38 <kinit+0x80>
    80007a28:	000017b7          	lui	a5,0x1
    80007a2c:	00f484b3          	add	s1,s1,a5
    80007a30:	0554e863          	bltu	s1,s5,80007a80 <kinit+0xc8>
    80007a34:	0534f663          	bgeu	s1,s3,80007a80 <kinit+0xc8>
    80007a38:	00001637          	lui	a2,0x1
    80007a3c:	00100593          	li	a1,1
    80007a40:	00048513          	mv	a0,s1
    80007a44:	00000097          	auipc	ra,0x0
    80007a48:	5e4080e7          	jalr	1508(ra) # 80008028 <__memset>
    80007a4c:	00093783          	ld	a5,0(s2)
    80007a50:	00f4b023          	sd	a5,0(s1)
    80007a54:	00993023          	sd	s1,0(s2)
    80007a58:	fd4498e3          	bne	s1,s4,80007a28 <kinit+0x70>
    80007a5c:	03813083          	ld	ra,56(sp)
    80007a60:	03013403          	ld	s0,48(sp)
    80007a64:	02813483          	ld	s1,40(sp)
    80007a68:	02013903          	ld	s2,32(sp)
    80007a6c:	01813983          	ld	s3,24(sp)
    80007a70:	01013a03          	ld	s4,16(sp)
    80007a74:	00813a83          	ld	s5,8(sp)
    80007a78:	04010113          	addi	sp,sp,64
    80007a7c:	00008067          	ret
    80007a80:	00002517          	auipc	a0,0x2
    80007a84:	d6850513          	addi	a0,a0,-664 # 800097e8 <digits+0x18>
    80007a88:	fffff097          	auipc	ra,0xfffff
    80007a8c:	4b4080e7          	jalr	1204(ra) # 80006f3c <panic>

0000000080007a90 <freerange>:
    80007a90:	fc010113          	addi	sp,sp,-64
    80007a94:	000017b7          	lui	a5,0x1
    80007a98:	02913423          	sd	s1,40(sp)
    80007a9c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80007aa0:	009504b3          	add	s1,a0,s1
    80007aa4:	fffff537          	lui	a0,0xfffff
    80007aa8:	02813823          	sd	s0,48(sp)
    80007aac:	02113c23          	sd	ra,56(sp)
    80007ab0:	03213023          	sd	s2,32(sp)
    80007ab4:	01313c23          	sd	s3,24(sp)
    80007ab8:	01413823          	sd	s4,16(sp)
    80007abc:	01513423          	sd	s5,8(sp)
    80007ac0:	01613023          	sd	s6,0(sp)
    80007ac4:	04010413          	addi	s0,sp,64
    80007ac8:	00a4f4b3          	and	s1,s1,a0
    80007acc:	00f487b3          	add	a5,s1,a5
    80007ad0:	06f5e463          	bltu	a1,a5,80007b38 <freerange+0xa8>
    80007ad4:	00005a97          	auipc	s5,0x5
    80007ad8:	faca8a93          	addi	s5,s5,-84 # 8000ca80 <end>
    80007adc:	0954e263          	bltu	s1,s5,80007b60 <freerange+0xd0>
    80007ae0:	01100993          	li	s3,17
    80007ae4:	01b99993          	slli	s3,s3,0x1b
    80007ae8:	0734fc63          	bgeu	s1,s3,80007b60 <freerange+0xd0>
    80007aec:	00058a13          	mv	s4,a1
    80007af0:	00004917          	auipc	s2,0x4
    80007af4:	ca090913          	addi	s2,s2,-864 # 8000b790 <kmem>
    80007af8:	00002b37          	lui	s6,0x2
    80007afc:	0140006f          	j	80007b10 <freerange+0x80>
    80007b00:	000017b7          	lui	a5,0x1
    80007b04:	00f484b3          	add	s1,s1,a5
    80007b08:	0554ec63          	bltu	s1,s5,80007b60 <freerange+0xd0>
    80007b0c:	0534fa63          	bgeu	s1,s3,80007b60 <freerange+0xd0>
    80007b10:	00001637          	lui	a2,0x1
    80007b14:	00100593          	li	a1,1
    80007b18:	00048513          	mv	a0,s1
    80007b1c:	00000097          	auipc	ra,0x0
    80007b20:	50c080e7          	jalr	1292(ra) # 80008028 <__memset>
    80007b24:	00093703          	ld	a4,0(s2)
    80007b28:	016487b3          	add	a5,s1,s6
    80007b2c:	00e4b023          	sd	a4,0(s1)
    80007b30:	00993023          	sd	s1,0(s2)
    80007b34:	fcfa76e3          	bgeu	s4,a5,80007b00 <freerange+0x70>
    80007b38:	03813083          	ld	ra,56(sp)
    80007b3c:	03013403          	ld	s0,48(sp)
    80007b40:	02813483          	ld	s1,40(sp)
    80007b44:	02013903          	ld	s2,32(sp)
    80007b48:	01813983          	ld	s3,24(sp)
    80007b4c:	01013a03          	ld	s4,16(sp)
    80007b50:	00813a83          	ld	s5,8(sp)
    80007b54:	00013b03          	ld	s6,0(sp)
    80007b58:	04010113          	addi	sp,sp,64
    80007b5c:	00008067          	ret
    80007b60:	00002517          	auipc	a0,0x2
    80007b64:	c8850513          	addi	a0,a0,-888 # 800097e8 <digits+0x18>
    80007b68:	fffff097          	auipc	ra,0xfffff
    80007b6c:	3d4080e7          	jalr	980(ra) # 80006f3c <panic>

0000000080007b70 <kfree>:
    80007b70:	fe010113          	addi	sp,sp,-32
    80007b74:	00813823          	sd	s0,16(sp)
    80007b78:	00113c23          	sd	ra,24(sp)
    80007b7c:	00913423          	sd	s1,8(sp)
    80007b80:	02010413          	addi	s0,sp,32
    80007b84:	03451793          	slli	a5,a0,0x34
    80007b88:	04079c63          	bnez	a5,80007be0 <kfree+0x70>
    80007b8c:	00005797          	auipc	a5,0x5
    80007b90:	ef478793          	addi	a5,a5,-268 # 8000ca80 <end>
    80007b94:	00050493          	mv	s1,a0
    80007b98:	04f56463          	bltu	a0,a5,80007be0 <kfree+0x70>
    80007b9c:	01100793          	li	a5,17
    80007ba0:	01b79793          	slli	a5,a5,0x1b
    80007ba4:	02f57e63          	bgeu	a0,a5,80007be0 <kfree+0x70>
    80007ba8:	00001637          	lui	a2,0x1
    80007bac:	00100593          	li	a1,1
    80007bb0:	00000097          	auipc	ra,0x0
    80007bb4:	478080e7          	jalr	1144(ra) # 80008028 <__memset>
    80007bb8:	00004797          	auipc	a5,0x4
    80007bbc:	bd878793          	addi	a5,a5,-1064 # 8000b790 <kmem>
    80007bc0:	0007b703          	ld	a4,0(a5)
    80007bc4:	01813083          	ld	ra,24(sp)
    80007bc8:	01013403          	ld	s0,16(sp)
    80007bcc:	00e4b023          	sd	a4,0(s1)
    80007bd0:	0097b023          	sd	s1,0(a5)
    80007bd4:	00813483          	ld	s1,8(sp)
    80007bd8:	02010113          	addi	sp,sp,32
    80007bdc:	00008067          	ret
    80007be0:	00002517          	auipc	a0,0x2
    80007be4:	c0850513          	addi	a0,a0,-1016 # 800097e8 <digits+0x18>
    80007be8:	fffff097          	auipc	ra,0xfffff
    80007bec:	354080e7          	jalr	852(ra) # 80006f3c <panic>

0000000080007bf0 <kalloc>:
    80007bf0:	fe010113          	addi	sp,sp,-32
    80007bf4:	00813823          	sd	s0,16(sp)
    80007bf8:	00913423          	sd	s1,8(sp)
    80007bfc:	00113c23          	sd	ra,24(sp)
    80007c00:	02010413          	addi	s0,sp,32
    80007c04:	00004797          	auipc	a5,0x4
    80007c08:	b8c78793          	addi	a5,a5,-1140 # 8000b790 <kmem>
    80007c0c:	0007b483          	ld	s1,0(a5)
    80007c10:	02048063          	beqz	s1,80007c30 <kalloc+0x40>
    80007c14:	0004b703          	ld	a4,0(s1)
    80007c18:	00001637          	lui	a2,0x1
    80007c1c:	00500593          	li	a1,5
    80007c20:	00048513          	mv	a0,s1
    80007c24:	00e7b023          	sd	a4,0(a5)
    80007c28:	00000097          	auipc	ra,0x0
    80007c2c:	400080e7          	jalr	1024(ra) # 80008028 <__memset>
    80007c30:	01813083          	ld	ra,24(sp)
    80007c34:	01013403          	ld	s0,16(sp)
    80007c38:	00048513          	mv	a0,s1
    80007c3c:	00813483          	ld	s1,8(sp)
    80007c40:	02010113          	addi	sp,sp,32
    80007c44:	00008067          	ret

0000000080007c48 <initlock>:
    80007c48:	ff010113          	addi	sp,sp,-16
    80007c4c:	00813423          	sd	s0,8(sp)
    80007c50:	01010413          	addi	s0,sp,16
    80007c54:	00813403          	ld	s0,8(sp)
    80007c58:	00b53423          	sd	a1,8(a0)
    80007c5c:	00052023          	sw	zero,0(a0)
    80007c60:	00053823          	sd	zero,16(a0)
    80007c64:	01010113          	addi	sp,sp,16
    80007c68:	00008067          	ret

0000000080007c6c <acquire>:
    80007c6c:	fe010113          	addi	sp,sp,-32
    80007c70:	00813823          	sd	s0,16(sp)
    80007c74:	00913423          	sd	s1,8(sp)
    80007c78:	00113c23          	sd	ra,24(sp)
    80007c7c:	01213023          	sd	s2,0(sp)
    80007c80:	02010413          	addi	s0,sp,32
    80007c84:	00050493          	mv	s1,a0
    80007c88:	10002973          	csrr	s2,sstatus
    80007c8c:	100027f3          	csrr	a5,sstatus
    80007c90:	ffd7f793          	andi	a5,a5,-3
    80007c94:	10079073          	csrw	sstatus,a5
    80007c98:	fffff097          	auipc	ra,0xfffff
    80007c9c:	8e8080e7          	jalr	-1816(ra) # 80006580 <mycpu>
    80007ca0:	07852783          	lw	a5,120(a0)
    80007ca4:	06078e63          	beqz	a5,80007d20 <acquire+0xb4>
    80007ca8:	fffff097          	auipc	ra,0xfffff
    80007cac:	8d8080e7          	jalr	-1832(ra) # 80006580 <mycpu>
    80007cb0:	07852783          	lw	a5,120(a0)
    80007cb4:	0004a703          	lw	a4,0(s1)
    80007cb8:	0017879b          	addiw	a5,a5,1
    80007cbc:	06f52c23          	sw	a5,120(a0)
    80007cc0:	04071063          	bnez	a4,80007d00 <acquire+0x94>
    80007cc4:	00100713          	li	a4,1
    80007cc8:	00070793          	mv	a5,a4
    80007ccc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80007cd0:	0007879b          	sext.w	a5,a5
    80007cd4:	fe079ae3          	bnez	a5,80007cc8 <acquire+0x5c>
    80007cd8:	0ff0000f          	fence
    80007cdc:	fffff097          	auipc	ra,0xfffff
    80007ce0:	8a4080e7          	jalr	-1884(ra) # 80006580 <mycpu>
    80007ce4:	01813083          	ld	ra,24(sp)
    80007ce8:	01013403          	ld	s0,16(sp)
    80007cec:	00a4b823          	sd	a0,16(s1)
    80007cf0:	00013903          	ld	s2,0(sp)
    80007cf4:	00813483          	ld	s1,8(sp)
    80007cf8:	02010113          	addi	sp,sp,32
    80007cfc:	00008067          	ret
    80007d00:	0104b903          	ld	s2,16(s1)
    80007d04:	fffff097          	auipc	ra,0xfffff
    80007d08:	87c080e7          	jalr	-1924(ra) # 80006580 <mycpu>
    80007d0c:	faa91ce3          	bne	s2,a0,80007cc4 <acquire+0x58>
    80007d10:	00002517          	auipc	a0,0x2
    80007d14:	ae050513          	addi	a0,a0,-1312 # 800097f0 <digits+0x20>
    80007d18:	fffff097          	auipc	ra,0xfffff
    80007d1c:	224080e7          	jalr	548(ra) # 80006f3c <panic>
    80007d20:	00195913          	srli	s2,s2,0x1
    80007d24:	fffff097          	auipc	ra,0xfffff
    80007d28:	85c080e7          	jalr	-1956(ra) # 80006580 <mycpu>
    80007d2c:	00197913          	andi	s2,s2,1
    80007d30:	07252e23          	sw	s2,124(a0)
    80007d34:	f75ff06f          	j	80007ca8 <acquire+0x3c>

0000000080007d38 <release>:
    80007d38:	fe010113          	addi	sp,sp,-32
    80007d3c:	00813823          	sd	s0,16(sp)
    80007d40:	00113c23          	sd	ra,24(sp)
    80007d44:	00913423          	sd	s1,8(sp)
    80007d48:	01213023          	sd	s2,0(sp)
    80007d4c:	02010413          	addi	s0,sp,32
    80007d50:	00052783          	lw	a5,0(a0)
    80007d54:	00079a63          	bnez	a5,80007d68 <release+0x30>
    80007d58:	00002517          	auipc	a0,0x2
    80007d5c:	aa050513          	addi	a0,a0,-1376 # 800097f8 <digits+0x28>
    80007d60:	fffff097          	auipc	ra,0xfffff
    80007d64:	1dc080e7          	jalr	476(ra) # 80006f3c <panic>
    80007d68:	01053903          	ld	s2,16(a0)
    80007d6c:	00050493          	mv	s1,a0
    80007d70:	fffff097          	auipc	ra,0xfffff
    80007d74:	810080e7          	jalr	-2032(ra) # 80006580 <mycpu>
    80007d78:	fea910e3          	bne	s2,a0,80007d58 <release+0x20>
    80007d7c:	0004b823          	sd	zero,16(s1)
    80007d80:	0ff0000f          	fence
    80007d84:	0f50000f          	fence	iorw,ow
    80007d88:	0804a02f          	amoswap.w	zero,zero,(s1)
    80007d8c:	ffffe097          	auipc	ra,0xffffe
    80007d90:	7f4080e7          	jalr	2036(ra) # 80006580 <mycpu>
    80007d94:	100027f3          	csrr	a5,sstatus
    80007d98:	0027f793          	andi	a5,a5,2
    80007d9c:	04079a63          	bnez	a5,80007df0 <release+0xb8>
    80007da0:	07852783          	lw	a5,120(a0)
    80007da4:	02f05e63          	blez	a5,80007de0 <release+0xa8>
    80007da8:	fff7871b          	addiw	a4,a5,-1
    80007dac:	06e52c23          	sw	a4,120(a0)
    80007db0:	00071c63          	bnez	a4,80007dc8 <release+0x90>
    80007db4:	07c52783          	lw	a5,124(a0)
    80007db8:	00078863          	beqz	a5,80007dc8 <release+0x90>
    80007dbc:	100027f3          	csrr	a5,sstatus
    80007dc0:	0027e793          	ori	a5,a5,2
    80007dc4:	10079073          	csrw	sstatus,a5
    80007dc8:	01813083          	ld	ra,24(sp)
    80007dcc:	01013403          	ld	s0,16(sp)
    80007dd0:	00813483          	ld	s1,8(sp)
    80007dd4:	00013903          	ld	s2,0(sp)
    80007dd8:	02010113          	addi	sp,sp,32
    80007ddc:	00008067          	ret
    80007de0:	00002517          	auipc	a0,0x2
    80007de4:	a3850513          	addi	a0,a0,-1480 # 80009818 <digits+0x48>
    80007de8:	fffff097          	auipc	ra,0xfffff
    80007dec:	154080e7          	jalr	340(ra) # 80006f3c <panic>
    80007df0:	00002517          	auipc	a0,0x2
    80007df4:	a1050513          	addi	a0,a0,-1520 # 80009800 <digits+0x30>
    80007df8:	fffff097          	auipc	ra,0xfffff
    80007dfc:	144080e7          	jalr	324(ra) # 80006f3c <panic>

0000000080007e00 <holding>:
    80007e00:	00052783          	lw	a5,0(a0)
    80007e04:	00079663          	bnez	a5,80007e10 <holding+0x10>
    80007e08:	00000513          	li	a0,0
    80007e0c:	00008067          	ret
    80007e10:	fe010113          	addi	sp,sp,-32
    80007e14:	00813823          	sd	s0,16(sp)
    80007e18:	00913423          	sd	s1,8(sp)
    80007e1c:	00113c23          	sd	ra,24(sp)
    80007e20:	02010413          	addi	s0,sp,32
    80007e24:	01053483          	ld	s1,16(a0)
    80007e28:	ffffe097          	auipc	ra,0xffffe
    80007e2c:	758080e7          	jalr	1880(ra) # 80006580 <mycpu>
    80007e30:	01813083          	ld	ra,24(sp)
    80007e34:	01013403          	ld	s0,16(sp)
    80007e38:	40a48533          	sub	a0,s1,a0
    80007e3c:	00153513          	seqz	a0,a0
    80007e40:	00813483          	ld	s1,8(sp)
    80007e44:	02010113          	addi	sp,sp,32
    80007e48:	00008067          	ret

0000000080007e4c <push_off>:
    80007e4c:	fe010113          	addi	sp,sp,-32
    80007e50:	00813823          	sd	s0,16(sp)
    80007e54:	00113c23          	sd	ra,24(sp)
    80007e58:	00913423          	sd	s1,8(sp)
    80007e5c:	02010413          	addi	s0,sp,32
    80007e60:	100024f3          	csrr	s1,sstatus
    80007e64:	100027f3          	csrr	a5,sstatus
    80007e68:	ffd7f793          	andi	a5,a5,-3
    80007e6c:	10079073          	csrw	sstatus,a5
    80007e70:	ffffe097          	auipc	ra,0xffffe
    80007e74:	710080e7          	jalr	1808(ra) # 80006580 <mycpu>
    80007e78:	07852783          	lw	a5,120(a0)
    80007e7c:	02078663          	beqz	a5,80007ea8 <push_off+0x5c>
    80007e80:	ffffe097          	auipc	ra,0xffffe
    80007e84:	700080e7          	jalr	1792(ra) # 80006580 <mycpu>
    80007e88:	07852783          	lw	a5,120(a0)
    80007e8c:	01813083          	ld	ra,24(sp)
    80007e90:	01013403          	ld	s0,16(sp)
    80007e94:	0017879b          	addiw	a5,a5,1
    80007e98:	06f52c23          	sw	a5,120(a0)
    80007e9c:	00813483          	ld	s1,8(sp)
    80007ea0:	02010113          	addi	sp,sp,32
    80007ea4:	00008067          	ret
    80007ea8:	0014d493          	srli	s1,s1,0x1
    80007eac:	ffffe097          	auipc	ra,0xffffe
    80007eb0:	6d4080e7          	jalr	1748(ra) # 80006580 <mycpu>
    80007eb4:	0014f493          	andi	s1,s1,1
    80007eb8:	06952e23          	sw	s1,124(a0)
    80007ebc:	fc5ff06f          	j	80007e80 <push_off+0x34>

0000000080007ec0 <pop_off>:
    80007ec0:	ff010113          	addi	sp,sp,-16
    80007ec4:	00813023          	sd	s0,0(sp)
    80007ec8:	00113423          	sd	ra,8(sp)
    80007ecc:	01010413          	addi	s0,sp,16
    80007ed0:	ffffe097          	auipc	ra,0xffffe
    80007ed4:	6b0080e7          	jalr	1712(ra) # 80006580 <mycpu>
    80007ed8:	100027f3          	csrr	a5,sstatus
    80007edc:	0027f793          	andi	a5,a5,2
    80007ee0:	04079663          	bnez	a5,80007f2c <pop_off+0x6c>
    80007ee4:	07852783          	lw	a5,120(a0)
    80007ee8:	02f05a63          	blez	a5,80007f1c <pop_off+0x5c>
    80007eec:	fff7871b          	addiw	a4,a5,-1
    80007ef0:	06e52c23          	sw	a4,120(a0)
    80007ef4:	00071c63          	bnez	a4,80007f0c <pop_off+0x4c>
    80007ef8:	07c52783          	lw	a5,124(a0)
    80007efc:	00078863          	beqz	a5,80007f0c <pop_off+0x4c>
    80007f00:	100027f3          	csrr	a5,sstatus
    80007f04:	0027e793          	ori	a5,a5,2
    80007f08:	10079073          	csrw	sstatus,a5
    80007f0c:	00813083          	ld	ra,8(sp)
    80007f10:	00013403          	ld	s0,0(sp)
    80007f14:	01010113          	addi	sp,sp,16
    80007f18:	00008067          	ret
    80007f1c:	00002517          	auipc	a0,0x2
    80007f20:	8fc50513          	addi	a0,a0,-1796 # 80009818 <digits+0x48>
    80007f24:	fffff097          	auipc	ra,0xfffff
    80007f28:	018080e7          	jalr	24(ra) # 80006f3c <panic>
    80007f2c:	00002517          	auipc	a0,0x2
    80007f30:	8d450513          	addi	a0,a0,-1836 # 80009800 <digits+0x30>
    80007f34:	fffff097          	auipc	ra,0xfffff
    80007f38:	008080e7          	jalr	8(ra) # 80006f3c <panic>

0000000080007f3c <push_on>:
    80007f3c:	fe010113          	addi	sp,sp,-32
    80007f40:	00813823          	sd	s0,16(sp)
    80007f44:	00113c23          	sd	ra,24(sp)
    80007f48:	00913423          	sd	s1,8(sp)
    80007f4c:	02010413          	addi	s0,sp,32
    80007f50:	100024f3          	csrr	s1,sstatus
    80007f54:	100027f3          	csrr	a5,sstatus
    80007f58:	0027e793          	ori	a5,a5,2
    80007f5c:	10079073          	csrw	sstatus,a5
    80007f60:	ffffe097          	auipc	ra,0xffffe
    80007f64:	620080e7          	jalr	1568(ra) # 80006580 <mycpu>
    80007f68:	07852783          	lw	a5,120(a0)
    80007f6c:	02078663          	beqz	a5,80007f98 <push_on+0x5c>
    80007f70:	ffffe097          	auipc	ra,0xffffe
    80007f74:	610080e7          	jalr	1552(ra) # 80006580 <mycpu>
    80007f78:	07852783          	lw	a5,120(a0)
    80007f7c:	01813083          	ld	ra,24(sp)
    80007f80:	01013403          	ld	s0,16(sp)
    80007f84:	0017879b          	addiw	a5,a5,1
    80007f88:	06f52c23          	sw	a5,120(a0)
    80007f8c:	00813483          	ld	s1,8(sp)
    80007f90:	02010113          	addi	sp,sp,32
    80007f94:	00008067          	ret
    80007f98:	0014d493          	srli	s1,s1,0x1
    80007f9c:	ffffe097          	auipc	ra,0xffffe
    80007fa0:	5e4080e7          	jalr	1508(ra) # 80006580 <mycpu>
    80007fa4:	0014f493          	andi	s1,s1,1
    80007fa8:	06952e23          	sw	s1,124(a0)
    80007fac:	fc5ff06f          	j	80007f70 <push_on+0x34>

0000000080007fb0 <pop_on>:
    80007fb0:	ff010113          	addi	sp,sp,-16
    80007fb4:	00813023          	sd	s0,0(sp)
    80007fb8:	00113423          	sd	ra,8(sp)
    80007fbc:	01010413          	addi	s0,sp,16
    80007fc0:	ffffe097          	auipc	ra,0xffffe
    80007fc4:	5c0080e7          	jalr	1472(ra) # 80006580 <mycpu>
    80007fc8:	100027f3          	csrr	a5,sstatus
    80007fcc:	0027f793          	andi	a5,a5,2
    80007fd0:	04078463          	beqz	a5,80008018 <pop_on+0x68>
    80007fd4:	07852783          	lw	a5,120(a0)
    80007fd8:	02f05863          	blez	a5,80008008 <pop_on+0x58>
    80007fdc:	fff7879b          	addiw	a5,a5,-1
    80007fe0:	06f52c23          	sw	a5,120(a0)
    80007fe4:	07853783          	ld	a5,120(a0)
    80007fe8:	00079863          	bnez	a5,80007ff8 <pop_on+0x48>
    80007fec:	100027f3          	csrr	a5,sstatus
    80007ff0:	ffd7f793          	andi	a5,a5,-3
    80007ff4:	10079073          	csrw	sstatus,a5
    80007ff8:	00813083          	ld	ra,8(sp)
    80007ffc:	00013403          	ld	s0,0(sp)
    80008000:	01010113          	addi	sp,sp,16
    80008004:	00008067          	ret
    80008008:	00002517          	auipc	a0,0x2
    8000800c:	83850513          	addi	a0,a0,-1992 # 80009840 <digits+0x70>
    80008010:	fffff097          	auipc	ra,0xfffff
    80008014:	f2c080e7          	jalr	-212(ra) # 80006f3c <panic>
    80008018:	00002517          	auipc	a0,0x2
    8000801c:	80850513          	addi	a0,a0,-2040 # 80009820 <digits+0x50>
    80008020:	fffff097          	auipc	ra,0xfffff
    80008024:	f1c080e7          	jalr	-228(ra) # 80006f3c <panic>

0000000080008028 <__memset>:
    80008028:	ff010113          	addi	sp,sp,-16
    8000802c:	00813423          	sd	s0,8(sp)
    80008030:	01010413          	addi	s0,sp,16
    80008034:	1a060e63          	beqz	a2,800081f0 <__memset+0x1c8>
    80008038:	40a007b3          	neg	a5,a0
    8000803c:	0077f793          	andi	a5,a5,7
    80008040:	00778693          	addi	a3,a5,7
    80008044:	00b00813          	li	a6,11
    80008048:	0ff5f593          	andi	a1,a1,255
    8000804c:	fff6071b          	addiw	a4,a2,-1
    80008050:	1b06e663          	bltu	a3,a6,800081fc <__memset+0x1d4>
    80008054:	1cd76463          	bltu	a4,a3,8000821c <__memset+0x1f4>
    80008058:	1a078e63          	beqz	a5,80008214 <__memset+0x1ec>
    8000805c:	00b50023          	sb	a1,0(a0)
    80008060:	00100713          	li	a4,1
    80008064:	1ae78463          	beq	a5,a4,8000820c <__memset+0x1e4>
    80008068:	00b500a3          	sb	a1,1(a0)
    8000806c:	00200713          	li	a4,2
    80008070:	1ae78a63          	beq	a5,a4,80008224 <__memset+0x1fc>
    80008074:	00b50123          	sb	a1,2(a0)
    80008078:	00300713          	li	a4,3
    8000807c:	18e78463          	beq	a5,a4,80008204 <__memset+0x1dc>
    80008080:	00b501a3          	sb	a1,3(a0)
    80008084:	00400713          	li	a4,4
    80008088:	1ae78263          	beq	a5,a4,8000822c <__memset+0x204>
    8000808c:	00b50223          	sb	a1,4(a0)
    80008090:	00500713          	li	a4,5
    80008094:	1ae78063          	beq	a5,a4,80008234 <__memset+0x20c>
    80008098:	00b502a3          	sb	a1,5(a0)
    8000809c:	00700713          	li	a4,7
    800080a0:	18e79e63          	bne	a5,a4,8000823c <__memset+0x214>
    800080a4:	00b50323          	sb	a1,6(a0)
    800080a8:	00700e93          	li	t4,7
    800080ac:	00859713          	slli	a4,a1,0x8
    800080b0:	00e5e733          	or	a4,a1,a4
    800080b4:	01059e13          	slli	t3,a1,0x10
    800080b8:	01c76e33          	or	t3,a4,t3
    800080bc:	01859313          	slli	t1,a1,0x18
    800080c0:	006e6333          	or	t1,t3,t1
    800080c4:	02059893          	slli	a7,a1,0x20
    800080c8:	40f60e3b          	subw	t3,a2,a5
    800080cc:	011368b3          	or	a7,t1,a7
    800080d0:	02859813          	slli	a6,a1,0x28
    800080d4:	0108e833          	or	a6,a7,a6
    800080d8:	03059693          	slli	a3,a1,0x30
    800080dc:	003e589b          	srliw	a7,t3,0x3
    800080e0:	00d866b3          	or	a3,a6,a3
    800080e4:	03859713          	slli	a4,a1,0x38
    800080e8:	00389813          	slli	a6,a7,0x3
    800080ec:	00f507b3          	add	a5,a0,a5
    800080f0:	00e6e733          	or	a4,a3,a4
    800080f4:	000e089b          	sext.w	a7,t3
    800080f8:	00f806b3          	add	a3,a6,a5
    800080fc:	00e7b023          	sd	a4,0(a5)
    80008100:	00878793          	addi	a5,a5,8
    80008104:	fed79ce3          	bne	a5,a3,800080fc <__memset+0xd4>
    80008108:	ff8e7793          	andi	a5,t3,-8
    8000810c:	0007871b          	sext.w	a4,a5
    80008110:	01d787bb          	addw	a5,a5,t4
    80008114:	0ce88e63          	beq	a7,a4,800081f0 <__memset+0x1c8>
    80008118:	00f50733          	add	a4,a0,a5
    8000811c:	00b70023          	sb	a1,0(a4)
    80008120:	0017871b          	addiw	a4,a5,1
    80008124:	0cc77663          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    80008128:	00e50733          	add	a4,a0,a4
    8000812c:	00b70023          	sb	a1,0(a4)
    80008130:	0027871b          	addiw	a4,a5,2
    80008134:	0ac77e63          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    80008138:	00e50733          	add	a4,a0,a4
    8000813c:	00b70023          	sb	a1,0(a4)
    80008140:	0037871b          	addiw	a4,a5,3
    80008144:	0ac77663          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    80008148:	00e50733          	add	a4,a0,a4
    8000814c:	00b70023          	sb	a1,0(a4)
    80008150:	0047871b          	addiw	a4,a5,4
    80008154:	08c77e63          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    80008158:	00e50733          	add	a4,a0,a4
    8000815c:	00b70023          	sb	a1,0(a4)
    80008160:	0057871b          	addiw	a4,a5,5
    80008164:	08c77663          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    80008168:	00e50733          	add	a4,a0,a4
    8000816c:	00b70023          	sb	a1,0(a4)
    80008170:	0067871b          	addiw	a4,a5,6
    80008174:	06c77e63          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    80008178:	00e50733          	add	a4,a0,a4
    8000817c:	00b70023          	sb	a1,0(a4)
    80008180:	0077871b          	addiw	a4,a5,7
    80008184:	06c77663          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    80008188:	00e50733          	add	a4,a0,a4
    8000818c:	00b70023          	sb	a1,0(a4)
    80008190:	0087871b          	addiw	a4,a5,8
    80008194:	04c77e63          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    80008198:	00e50733          	add	a4,a0,a4
    8000819c:	00b70023          	sb	a1,0(a4)
    800081a0:	0097871b          	addiw	a4,a5,9
    800081a4:	04c77663          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    800081a8:	00e50733          	add	a4,a0,a4
    800081ac:	00b70023          	sb	a1,0(a4)
    800081b0:	00a7871b          	addiw	a4,a5,10
    800081b4:	02c77e63          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    800081b8:	00e50733          	add	a4,a0,a4
    800081bc:	00b70023          	sb	a1,0(a4)
    800081c0:	00b7871b          	addiw	a4,a5,11
    800081c4:	02c77663          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    800081c8:	00e50733          	add	a4,a0,a4
    800081cc:	00b70023          	sb	a1,0(a4)
    800081d0:	00c7871b          	addiw	a4,a5,12
    800081d4:	00c77e63          	bgeu	a4,a2,800081f0 <__memset+0x1c8>
    800081d8:	00e50733          	add	a4,a0,a4
    800081dc:	00b70023          	sb	a1,0(a4)
    800081e0:	00d7879b          	addiw	a5,a5,13
    800081e4:	00c7f663          	bgeu	a5,a2,800081f0 <__memset+0x1c8>
    800081e8:	00f507b3          	add	a5,a0,a5
    800081ec:	00b78023          	sb	a1,0(a5)
    800081f0:	00813403          	ld	s0,8(sp)
    800081f4:	01010113          	addi	sp,sp,16
    800081f8:	00008067          	ret
    800081fc:	00b00693          	li	a3,11
    80008200:	e55ff06f          	j	80008054 <__memset+0x2c>
    80008204:	00300e93          	li	t4,3
    80008208:	ea5ff06f          	j	800080ac <__memset+0x84>
    8000820c:	00100e93          	li	t4,1
    80008210:	e9dff06f          	j	800080ac <__memset+0x84>
    80008214:	00000e93          	li	t4,0
    80008218:	e95ff06f          	j	800080ac <__memset+0x84>
    8000821c:	00000793          	li	a5,0
    80008220:	ef9ff06f          	j	80008118 <__memset+0xf0>
    80008224:	00200e93          	li	t4,2
    80008228:	e85ff06f          	j	800080ac <__memset+0x84>
    8000822c:	00400e93          	li	t4,4
    80008230:	e7dff06f          	j	800080ac <__memset+0x84>
    80008234:	00500e93          	li	t4,5
    80008238:	e75ff06f          	j	800080ac <__memset+0x84>
    8000823c:	00600e93          	li	t4,6
    80008240:	e6dff06f          	j	800080ac <__memset+0x84>

0000000080008244 <__memmove>:
    80008244:	ff010113          	addi	sp,sp,-16
    80008248:	00813423          	sd	s0,8(sp)
    8000824c:	01010413          	addi	s0,sp,16
    80008250:	0e060863          	beqz	a2,80008340 <__memmove+0xfc>
    80008254:	fff6069b          	addiw	a3,a2,-1
    80008258:	0006881b          	sext.w	a6,a3
    8000825c:	0ea5e863          	bltu	a1,a0,8000834c <__memmove+0x108>
    80008260:	00758713          	addi	a4,a1,7
    80008264:	00a5e7b3          	or	a5,a1,a0
    80008268:	40a70733          	sub	a4,a4,a0
    8000826c:	0077f793          	andi	a5,a5,7
    80008270:	00f73713          	sltiu	a4,a4,15
    80008274:	00174713          	xori	a4,a4,1
    80008278:	0017b793          	seqz	a5,a5
    8000827c:	00e7f7b3          	and	a5,a5,a4
    80008280:	10078863          	beqz	a5,80008390 <__memmove+0x14c>
    80008284:	00900793          	li	a5,9
    80008288:	1107f463          	bgeu	a5,a6,80008390 <__memmove+0x14c>
    8000828c:	0036581b          	srliw	a6,a2,0x3
    80008290:	fff8081b          	addiw	a6,a6,-1
    80008294:	02081813          	slli	a6,a6,0x20
    80008298:	01d85893          	srli	a7,a6,0x1d
    8000829c:	00858813          	addi	a6,a1,8
    800082a0:	00058793          	mv	a5,a1
    800082a4:	00050713          	mv	a4,a0
    800082a8:	01088833          	add	a6,a7,a6
    800082ac:	0007b883          	ld	a7,0(a5)
    800082b0:	00878793          	addi	a5,a5,8
    800082b4:	00870713          	addi	a4,a4,8
    800082b8:	ff173c23          	sd	a7,-8(a4)
    800082bc:	ff0798e3          	bne	a5,a6,800082ac <__memmove+0x68>
    800082c0:	ff867713          	andi	a4,a2,-8
    800082c4:	02071793          	slli	a5,a4,0x20
    800082c8:	0207d793          	srli	a5,a5,0x20
    800082cc:	00f585b3          	add	a1,a1,a5
    800082d0:	40e686bb          	subw	a3,a3,a4
    800082d4:	00f507b3          	add	a5,a0,a5
    800082d8:	06e60463          	beq	a2,a4,80008340 <__memmove+0xfc>
    800082dc:	0005c703          	lbu	a4,0(a1)
    800082e0:	00e78023          	sb	a4,0(a5)
    800082e4:	04068e63          	beqz	a3,80008340 <__memmove+0xfc>
    800082e8:	0015c603          	lbu	a2,1(a1)
    800082ec:	00100713          	li	a4,1
    800082f0:	00c780a3          	sb	a2,1(a5)
    800082f4:	04e68663          	beq	a3,a4,80008340 <__memmove+0xfc>
    800082f8:	0025c603          	lbu	a2,2(a1)
    800082fc:	00200713          	li	a4,2
    80008300:	00c78123          	sb	a2,2(a5)
    80008304:	02e68e63          	beq	a3,a4,80008340 <__memmove+0xfc>
    80008308:	0035c603          	lbu	a2,3(a1)
    8000830c:	00300713          	li	a4,3
    80008310:	00c781a3          	sb	a2,3(a5)
    80008314:	02e68663          	beq	a3,a4,80008340 <__memmove+0xfc>
    80008318:	0045c603          	lbu	a2,4(a1)
    8000831c:	00400713          	li	a4,4
    80008320:	00c78223          	sb	a2,4(a5)
    80008324:	00e68e63          	beq	a3,a4,80008340 <__memmove+0xfc>
    80008328:	0055c603          	lbu	a2,5(a1)
    8000832c:	00500713          	li	a4,5
    80008330:	00c782a3          	sb	a2,5(a5)
    80008334:	00e68663          	beq	a3,a4,80008340 <__memmove+0xfc>
    80008338:	0065c703          	lbu	a4,6(a1)
    8000833c:	00e78323          	sb	a4,6(a5)
    80008340:	00813403          	ld	s0,8(sp)
    80008344:	01010113          	addi	sp,sp,16
    80008348:	00008067          	ret
    8000834c:	02061713          	slli	a4,a2,0x20
    80008350:	02075713          	srli	a4,a4,0x20
    80008354:	00e587b3          	add	a5,a1,a4
    80008358:	f0f574e3          	bgeu	a0,a5,80008260 <__memmove+0x1c>
    8000835c:	02069613          	slli	a2,a3,0x20
    80008360:	02065613          	srli	a2,a2,0x20
    80008364:	fff64613          	not	a2,a2
    80008368:	00e50733          	add	a4,a0,a4
    8000836c:	00c78633          	add	a2,a5,a2
    80008370:	fff7c683          	lbu	a3,-1(a5)
    80008374:	fff78793          	addi	a5,a5,-1
    80008378:	fff70713          	addi	a4,a4,-1
    8000837c:	00d70023          	sb	a3,0(a4)
    80008380:	fec798e3          	bne	a5,a2,80008370 <__memmove+0x12c>
    80008384:	00813403          	ld	s0,8(sp)
    80008388:	01010113          	addi	sp,sp,16
    8000838c:	00008067          	ret
    80008390:	02069713          	slli	a4,a3,0x20
    80008394:	02075713          	srli	a4,a4,0x20
    80008398:	00170713          	addi	a4,a4,1
    8000839c:	00e50733          	add	a4,a0,a4
    800083a0:	00050793          	mv	a5,a0
    800083a4:	0005c683          	lbu	a3,0(a1)
    800083a8:	00178793          	addi	a5,a5,1
    800083ac:	00158593          	addi	a1,a1,1
    800083b0:	fed78fa3          	sb	a3,-1(a5)
    800083b4:	fee798e3          	bne	a5,a4,800083a4 <__memmove+0x160>
    800083b8:	f89ff06f          	j	80008340 <__memmove+0xfc>

00000000800083bc <__putc>:
    800083bc:	fe010113          	addi	sp,sp,-32
    800083c0:	00813823          	sd	s0,16(sp)
    800083c4:	00113c23          	sd	ra,24(sp)
    800083c8:	02010413          	addi	s0,sp,32
    800083cc:	00050793          	mv	a5,a0
    800083d0:	fef40593          	addi	a1,s0,-17
    800083d4:	00100613          	li	a2,1
    800083d8:	00000513          	li	a0,0
    800083dc:	fef407a3          	sb	a5,-17(s0)
    800083e0:	fffff097          	auipc	ra,0xfffff
    800083e4:	b3c080e7          	jalr	-1220(ra) # 80006f1c <console_write>
    800083e8:	01813083          	ld	ra,24(sp)
    800083ec:	01013403          	ld	s0,16(sp)
    800083f0:	02010113          	addi	sp,sp,32
    800083f4:	00008067          	ret

00000000800083f8 <__getc>:
    800083f8:	fe010113          	addi	sp,sp,-32
    800083fc:	00813823          	sd	s0,16(sp)
    80008400:	00113c23          	sd	ra,24(sp)
    80008404:	02010413          	addi	s0,sp,32
    80008408:	fe840593          	addi	a1,s0,-24
    8000840c:	00100613          	li	a2,1
    80008410:	00000513          	li	a0,0
    80008414:	fffff097          	auipc	ra,0xfffff
    80008418:	ae8080e7          	jalr	-1304(ra) # 80006efc <console_read>
    8000841c:	fe844503          	lbu	a0,-24(s0)
    80008420:	01813083          	ld	ra,24(sp)
    80008424:	01013403          	ld	s0,16(sp)
    80008428:	02010113          	addi	sp,sp,32
    8000842c:	00008067          	ret

0000000080008430 <console_handler>:
    80008430:	fe010113          	addi	sp,sp,-32
    80008434:	00813823          	sd	s0,16(sp)
    80008438:	00113c23          	sd	ra,24(sp)
    8000843c:	00913423          	sd	s1,8(sp)
    80008440:	02010413          	addi	s0,sp,32
    80008444:	14202773          	csrr	a4,scause
    80008448:	100027f3          	csrr	a5,sstatus
    8000844c:	0027f793          	andi	a5,a5,2
    80008450:	06079e63          	bnez	a5,800084cc <console_handler+0x9c>
    80008454:	00074c63          	bltz	a4,8000846c <console_handler+0x3c>
    80008458:	01813083          	ld	ra,24(sp)
    8000845c:	01013403          	ld	s0,16(sp)
    80008460:	00813483          	ld	s1,8(sp)
    80008464:	02010113          	addi	sp,sp,32
    80008468:	00008067          	ret
    8000846c:	0ff77713          	andi	a4,a4,255
    80008470:	00900793          	li	a5,9
    80008474:	fef712e3          	bne	a4,a5,80008458 <console_handler+0x28>
    80008478:	ffffe097          	auipc	ra,0xffffe
    8000847c:	6dc080e7          	jalr	1756(ra) # 80006b54 <plic_claim>
    80008480:	00a00793          	li	a5,10
    80008484:	00050493          	mv	s1,a0
    80008488:	02f50c63          	beq	a0,a5,800084c0 <console_handler+0x90>
    8000848c:	fc0506e3          	beqz	a0,80008458 <console_handler+0x28>
    80008490:	00050593          	mv	a1,a0
    80008494:	00001517          	auipc	a0,0x1
    80008498:	2b450513          	addi	a0,a0,692 # 80009748 <CONSOLE_STATUS+0x738>
    8000849c:	fffff097          	auipc	ra,0xfffff
    800084a0:	afc080e7          	jalr	-1284(ra) # 80006f98 <__printf>
    800084a4:	01013403          	ld	s0,16(sp)
    800084a8:	01813083          	ld	ra,24(sp)
    800084ac:	00048513          	mv	a0,s1
    800084b0:	00813483          	ld	s1,8(sp)
    800084b4:	02010113          	addi	sp,sp,32
    800084b8:	ffffe317          	auipc	t1,0xffffe
    800084bc:	6d430067          	jr	1748(t1) # 80006b8c <plic_complete>
    800084c0:	fffff097          	auipc	ra,0xfffff
    800084c4:	3e0080e7          	jalr	992(ra) # 800078a0 <uartintr>
    800084c8:	fddff06f          	j	800084a4 <console_handler+0x74>
    800084cc:	00001517          	auipc	a0,0x1
    800084d0:	37c50513          	addi	a0,a0,892 # 80009848 <digits+0x78>
    800084d4:	fffff097          	auipc	ra,0xfffff
    800084d8:	a68080e7          	jalr	-1432(ra) # 80006f3c <panic>
	...
