	.text
	.file	"bc.a.bc"
	.globl	TimerB1_ISR
	.align	2
	.type	TimerB1_ISR,@function
TimerB1_ISR:                            ; @TimerB1_ISR
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r12
	mov.w	&0x03C0, r12
	and.w	#-3, r12
	mov.w	r12, &0x03C0
	mov.w	&0x03C0, r12
	cmp.w	#0, r12
	jeq	.LBB0_2
	jmp	.LBB0_1
.LBB0_1:                                ; %if.then
	mov.w	&overflow, r12
	add.w	#1, r12
	mov.w	r12, &overflow
	mov.w	&0x03C0, r12
	bis.w	#4, r12
	mov.w	r12, &0x03C0
	mov.w	&0x03C0, r12
	bis.w	#2, r12
	mov.w	r12, &0x03C0
	mov.w	&0x03C0, r12
	and.w	#-2, r12
	mov.w	r12, &0x03C0
	jmp	.LBB0_2
.LBB0_2:                                ; %if.end
	pop.w	r12
	pop.w	r4
	reti
.Lfunc_end0:
	.size	TimerB1_ISR, .Lfunc_end0-TimerB1_ISR

	.globl	init
	.align	2
	.type	init,@function
init:                                   ; @init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	mov.w	&timer, r12
	mov.w	0(r12), r13
	and.w	#-6401, r13
	mov.w	r13, 0(r12)
	mov.w	&timer, r12
	mov.w	0(r12), r13
	bis.w	#512, r13
	mov.w	r13, 0(r12)
	mov.w	&timer, r12
	mov.w	0(r12), r13
	bis.w	#192, r13
	mov.w	r13, 0(r12)
	mov.w	&timer, r12
	mov.w	0(r12), r13
	and.w	#-17, r13
	mov.w	r13, 0(r12)
	mov.w	&timer, r12
	mov.w	0(r12), r13
	bis.w	#32, r13
	mov.w	r13, 0(r12)
	mov.w	&timer, r12
	mov.w	0(r12), r13
	bis.w	#2, r13
	mov.w	r13, 0(r12)
	call	#init_hw
	call	#mspconsole_init
	;APP
	eint { nop
	;NO_APP
	mov.w	&curctx, r12
	mov.w	0(r12), r12
	mov.w	2(r12), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end1:
	.size	init, .Lfunc_end1-init

	.globl	task_init
	.align	2
	.type	task_init,@function
task_init:                              ; @task_init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.1, 0(r14)
	call	#printf
	mov.w	#0, &_global_func
	mov.w	#0, &_global_n_0
	mov.w	#0, &_global_n_1
	mov.w	#0, &_global_n_2
	mov.w	#0, &_global_n_3
	mov.w	#0, &_global_n_4
	mov.w	#0, &_global_n_5
	mov.w	#0, &_global_n_6
	mov.w	#_task_task_select_func, r12
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	mov.w	r12, r15
	call	#transition_to
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end2:
	.size	task_init, .Lfunc_end2-task_init

	.globl	task_select_func
	.align	2
	.type	task_select_func,@function
task_select_func:                       ; @task_select_func
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	&_global_func, r12
	mov.w	r12, &_global_func_bak
	mov.w	#0, &_global_seed+2
	mov.w	#4, &_global_seed
	mov.w	#0, &_global_iter
	mov.w	&_global_func_bak, r12
	cmp.w	#0, r12
	jne	.LBB3_2
	jmp	.LBB3_1
.LBB3_1:                                ; %if.then
	mov.w	#_global_func_bak, r15
	mov.w	&_global_func_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_func_bak
	mov.w	#_global_func, r14
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_bit_count, r15
	call	#transition_to
	jmp	.LBB3_21
.LBB3_2:                                ; %if.else
	mov.w	&_global_func_bak, r12
	cmp.w	#1, r12
	jne	.LBB3_4
	jmp	.LBB3_3
.LBB3_3:                                ; %if.then.2
	mov.w	#_global_func_bak, r15
	mov.w	&_global_func_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_func_bak
	mov.w	#_global_func, r14
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_bitcount, r15
	call	#transition_to
	jmp	.LBB3_20
.LBB3_4:                                ; %if.else.4
	mov.w	&_global_func_bak, r12
	cmp.w	#2, r12
	jne	.LBB3_6
	jmp	.LBB3_5
.LBB3_5:                                ; %if.then.6
	mov.w	#_global_func_bak, r15
	mov.w	&_global_func_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_func_bak
	mov.w	#_global_func, r14
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_ntbl_bitcnt, r15
	call	#transition_to
	jmp	.LBB3_19
.LBB3_6:                                ; %if.else.8
	mov.w	&_global_func_bak, r12
	cmp.w	#3, r12
	jne	.LBB3_8
	jmp	.LBB3_7
.LBB3_7:                                ; %if.then.10
	mov.w	#_global_func_bak, r15
	mov.w	&_global_func_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_func_bak
	mov.w	#_global_func, r14
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_ntbl_bitcount, r15
	call	#transition_to
	jmp	.LBB3_18
.LBB3_8:                                ; %if.else.12
	mov.w	&_global_func_bak, r12
	cmp.w	#4, r12
	jne	.LBB3_10
	jmp	.LBB3_9
.LBB3_9:                                ; %if.then.14
	mov.w	#_global_func_bak, r15
	mov.w	&_global_func_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_func_bak
	mov.w	#_global_func, r14
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_BW_btbl_bitcount, r15
	call	#transition_to
	jmp	.LBB3_17
.LBB3_10:                               ; %if.else.16
	mov.w	&_global_func_bak, r12
	cmp.w	#5, r12
	jne	.LBB3_12
	jmp	.LBB3_11
.LBB3_11:                               ; %if.then.18
	mov.w	#_global_func_bak, r15
	mov.w	&_global_func_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_func_bak
	mov.w	#_global_func, r14
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_AR_btbl_bitcount, r15
	call	#transition_to
	jmp	.LBB3_16
.LBB3_12:                               ; %if.else.20
	mov.w	&_global_func_bak, r12
	cmp.w	#6, r12
	jne	.LBB3_14
	jmp	.LBB3_13
.LBB3_13:                               ; %if.then.22
	mov.w	#_global_func_bak, r15
	mov.w	&_global_func_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_func_bak
	mov.w	#_global_func, r14
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_bit_shifter, r15
	call	#transition_to
	jmp	.LBB3_15
.LBB3_14:                               ; %if.else.24
	mov.w	#_global_func, r14
	mov.w	#_global_func_bak, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_end, r15
	call	#transition_to
	jmp	.LBB3_15
.LBB3_15:                               ; %if.end
	jmp	.LBB3_16
.LBB3_16:                               ; %if.end.25
	jmp	.LBB3_17
.LBB3_17:                               ; %if.end.26
	jmp	.LBB3_18
.LBB3_18:                               ; %if.end.27
	jmp	.LBB3_19
.LBB3_19:                               ; %if.end.28
	jmp	.LBB3_20
.LBB3_20:                               ; %if.end.29
	jmp	.LBB3_21
.LBB3_21:                               ; %if.end.30
	pop.w	r4
	ret
.Lfunc_end3:
	.size	task_select_func, .Lfunc_end3-task_select_func

	.globl	task_bit_count
	.align	2
	.type	task_bit_count,@function
task_bit_count:                         ; @task_bit_count
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	mov.w	&_global_iter, r12
	mov.w	r12, &_global_iter_bak
	mov.w	&_global_n_0, r12
	mov.w	r12, &_global_n_0_bak
	mov.w	&_global_seed, r12
	mov.w	&_global_seed+2, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	r13, -2(r4)
	mov.w	r12, -4(r4)
	mov.w	&_global_seed_bak, r12
	mov.w	&_global_seed_bak+2, r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	#0, -6(r4)
	mov.w	-2(r4), r12
	mov.w	-4(r4), r13
	bis.w	r12, r13
	cmp.w	#0, r13
	jeq	.LBB4_5
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	jmp	.LBB4_2
.LBB4_2:                                ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB4_3
.LBB4_3:                                ; %do.cond
                                        ;   in Loop: Header=BB4_2 Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	mov.w	r12, r14
	add.w	#-1, r14
	mov.w	r13, r15
	addc.w	#-1, r15
	and.w	r14, r12
	and.w	r15, r13
	mov.w	r13, -2(r4)
	mov.w	r12, -4(r4)
	bis.w	r13, r12
	cmp.w	#0, r12
	jne	.LBB4_2
	jmp	.LBB4_4
.LBB4_4:                                ; %do.end
	jmp	.LBB4_5
.LBB4_5:                                ; %if.end
	mov.w	-6(r4), r12
	mov.w	&_global_n_0_bak, r13
	add.w	r12, r13
	mov.w	r13, &_global_n_0_bak
	mov.w	r1, r12
	mov.w	r13, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#printf
	mov.w	&_global_iter_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_iter_bak
	cmp.w	#100, r12
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	jhs	.LBB4_7
	jmp	.LBB4_6
.LBB4_6:                                ; %if.then.4
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_0, r14
	mov.w	#_global_n_0_bak, r15
	mov.w	-10(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_bit_count, r15
	call	#transition_to
	jmp	.LBB4_8
.LBB4_7:                                ; %if.else
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_0, r14
	mov.w	#_global_n_0_bak, r15
	mov.w	-12(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_select_func, r15
	call	#transition_to
	jmp	.LBB4_8
.LBB4_8:                                ; %if.end.5
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end4:
	.size	task_bit_count, .Lfunc_end4-task_bit_count

	.globl	task_bitcount
	.align	2
	.type	task_bitcount,@function
task_bitcount:                          ; @task_bitcount
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	mov.w	&_global_iter, r12
	mov.w	r12, &_global_iter_bak
	mov.w	&_global_n_1, r12
	mov.w	r12, &_global_n_1_bak
	mov.w	&_global_seed, r12
	mov.w	&_global_seed+2, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	r13, -2(r4)
	mov.w	r12, -4(r4)
	mov.w	&_global_seed_bak, r12
	mov.w	&_global_seed_bak+2, r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	mov.w	r13, r14
	and.w	#-21846, r14
	mov.w	r12, r15
	and.w	#-21846, r15
	clrc
	rrc.w	r15
	clrc
	rrc.w	r14
	and.w	#21845, r12
	and.w	#21845, r13
	add.w	r12, r15
	addc.w	r13, r14
	mov.w	r14, -2(r4)
	mov.w	r15, -4(r4)
	mov.w	r14, r12
	and.w	#-13108, r12
	mov.w	r15, r13
	and.w	#-13108, r13
	clrc
	rrc.w	r13
	rra.w	r13
	clrc
	rrc.w	r12
	rra.w	r12
	and.w	#13107, r15
	and.w	#13107, r14
	add.w	r15, r13
	addc.w	r14, r12
	mov.w	r12, -2(r4)
	mov.w	r13, -4(r4)
	mov.w	r12, r14
	and.w	#28912, r14
	mov.w	r13, r15
	and.w	#-3856, r15
	clrc
	rrc.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	and.w	#3855, r13
	and.w	#3855, r12
	add.w	r13, r15
	addc.w	r12, r14
	mov.w	r14, -2(r4)
	mov.w	r15, -4(r4)
	mov.w	r14, r12
	and.w	#7936, r12
	mov.w	r15, r13
	clrc
	rrc.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	clrc
	rrc.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	mov.b	r15, r15
	mov.b	r14, r14
	add.w	r15, r13
	addc.w	r14, r12
	mov.w	r12, -2(r4)
	mov.w	r13, -4(r4)
	mov.w	#0, r14
	add.w	r13, r12
	addc.w	#0, r14
	mov.w	r14, -2(r4)
	mov.w	r12, -4(r4)
	mov.w	-4(r4), r12
	mov.w	&_global_n_1_bak, r13
	add.w	r12, r13
	mov.w	r13, &_global_n_1_bak
	mov.w	&_global_iter_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_iter_bak
	cmp.w	#100, r12
	jhs	.LBB5_2
	jmp	.LBB5_1
.LBB5_1:                                ; %if.then
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_1, r14
	mov.w	#_global_n_1_bak, r15
	mov.w	-6(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_bitcount, r15
	call	#transition_to
	jmp	.LBB5_3
.LBB5_2:                                ; %if.else
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_1, r14
	mov.w	#_global_n_1_bak, r15
	mov.w	-8(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_select_func, r15
	call	#transition_to
	jmp	.LBB5_3
.LBB5_3:                                ; %if.end
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end5:
	.size	task_bitcount, .Lfunc_end5-task_bitcount

	.globl	recursive_cnt
	.align	2
	.type	recursive_cnt,@function
recursive_cnt:                          ; @recursive_cnt
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#14, r1
	;DEBUG_VALUE: recursive_cnt:x <- undef
	mov.w	r15, r12
	mov.w	r14, r13
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	and.w	#15, r14
	mov.b	bits(r14), r14
	sxt	r14
	mov.w	r14, -10(r4)
	mov.w	-6(r4), r14
	mov.w	-8(r4), r15
	clrc
	rrc.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	mov.w	r14, r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	bis.w	r11, r15
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	mov.w	r14, -6(r4)
	mov.w	r15, -8(r4)
	bis.w	r14, r15
	cmp.w	#0, r15
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	jeq	.LBB6_2
	jmp	.LBB6_1
.LBB6_1:                                ; %if.then
	mov.w	-6(r4), r15
	mov.w	-8(r4), r14
	call	#recursive_cnt
	mov.w	-10(r4), r14
	add.w	r15, r14
	mov.w	r14, -10(r4)
	jmp	.LBB6_2
.LBB6_2:                                ; %if.end
	mov.w	-10(r4), r15
	add.w	#14, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end6:
	.size	recursive_cnt, .Lfunc_end6-recursive_cnt

	.globl	task_ntbl_bitcnt
	.align	2
	.type	task_ntbl_bitcnt,@function
task_ntbl_bitcnt:                       ; @task_ntbl_bitcnt
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	mov.w	&_global_iter, r12
	mov.w	r12, &_global_iter_bak
	mov.w	&_global_n_2, r12
	mov.w	r12, &_global_n_2_bak
	mov.w	&_global_seed, r12
	mov.w	&_global_seed+2, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	r12, r14
	mov.w	r13, r15
	call	#recursive_cnt
	mov.w	&_global_n_2_bak, r12
	add.w	r15, r12
	mov.w	r12, &_global_n_2_bak
	mov.w	&_global_seed_bak, r12
	mov.w	&_global_seed_bak+2, r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	&_global_iter_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_iter_bak
	cmp.w	#100, r12
	jhs	.LBB7_2
	jmp	.LBB7_1
.LBB7_1:                                ; %if.then
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -2(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_2, r14
	mov.w	#_global_n_2_bak, r15
	mov.w	-2(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_ntbl_bitcnt, r15
	call	#transition_to
	jmp	.LBB7_3
.LBB7_2:                                ; %if.else
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_2, r14
	mov.w	#_global_n_2_bak, r15
	mov.w	-4(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_select_func, r15
	call	#transition_to
	jmp	.LBB7_3
.LBB7_3:                                ; %if.end
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end7:
	.size	task_ntbl_bitcnt, .Lfunc_end7-task_ntbl_bitcnt

	.globl	task_ntbl_bitcount
	.align	2
	.type	task_ntbl_bitcount,@function
task_ntbl_bitcount:                     ; @task_ntbl_bitcount
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	mov.w	&_global_iter, r12
	mov.w	r12, &_global_iter_bak
	mov.w	&_global_n_3, r12
	mov.w	r12, &_global_n_3_bak
	mov.w	&_global_seed, r12
	mov.w	&_global_seed+2, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	r12, r14
	and.w	#15, r14
	mov.b	bits(r14), r14
	sxt	r14
	mov.w	r12, r15
	and.w	#240, r15
	clrc
	rrc.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	mov.b	bits(r15), r15
	sxt	r15
	add.w	r15, r14
	mov.w	r12, r15
	and.w	#3840, r15
	clrc
	rrc.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	mov.b	bits(r15), r15
	sxt	r15
	add.w	r15, r14
	clrc
	rrc.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	mov.b	bits(r12), r12
	sxt	r12
	add.w	r12, r14
	mov.w	r13, r12
	and.w	#15, r12
	mov.b	bits(r12), r12
	sxt	r12
	add.w	r12, r14
	mov.w	r13, r12
	and.w	#240, r12
	clrc
	rrc.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	mov.b	bits(r12), r12
	sxt	r12
	add.w	r12, r14
	mov.w	r13, r12
	and.w	#3840, r12
	clrc
	rrc.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	mov.b	bits(r12), r12
	sxt	r12
	add.w	r12, r14
	clrc
	rrc.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	mov.b	bits(r13), r12
	sxt	r12
	add.w	r12, r14
	mov.w	&_global_n_3_bak, r12
	add.w	r14, r12
	mov.w	r12, &_global_n_3_bak
	mov.w	&_global_seed_bak, r12
	mov.w	&_global_seed_bak+2, r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	&_global_iter_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_iter_bak
	cmp.w	#100, r12
	jhs	.LBB8_2
	jmp	.LBB8_1
.LBB8_1:                                ; %if.then
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -2(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_3, r14
	mov.w	#_global_n_3_bak, r15
	mov.w	-2(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_ntbl_bitcount, r15
	call	#transition_to
	jmp	.LBB8_3
.LBB8_2:                                ; %if.else
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_3, r14
	mov.w	#_global_n_3_bak, r15
	mov.w	-4(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_select_func, r15
	call	#transition_to
	jmp	.LBB8_3
.LBB8_3:                                ; %if.end
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end8:
	.size	task_ntbl_bitcount, .Lfunc_end8-task_ntbl_bitcount

	.globl	task_BW_btbl_bitcount
	.align	2
	.type	task_BW_btbl_bitcount,@function
task_BW_btbl_bitcount:                  ; @task_BW_btbl_bitcount
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	mov.w	&_global_iter, r12
	mov.w	r12, &_global_iter_bak
	mov.w	&_global_n_4, r12
	mov.w	r12, &_global_n_4_bak
	mov.w	&_global_seed, r12
	mov.w	&_global_seed+2, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	r13, -2(r4)
	mov.w	r12, -4(r4)
	mov.b	-4(r4), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov.b	-3(r4), r13
	mov.b	bits(r13), r13
	sxt	r13
	add.w	r13, r12
	mov.b	-1(r4), r13
	mov.b	bits(r13), r13
	sxt	r13
	add.w	r13, r12
	mov.b	-2(r4), r13
	mov.b	bits(r13), r13
	sxt	r13
	add.w	r13, r12
	mov.w	&_global_n_4_bak, r13
	add.w	r12, r13
	mov.w	r13, &_global_n_4_bak
	mov.w	&_global_seed_bak, r12
	mov.w	&_global_seed_bak+2, r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	&_global_iter_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_iter_bak
	cmp.w	#100, r12
	jhs	.LBB9_2
	jmp	.LBB9_1
.LBB9_1:                                ; %if.then
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_4, r14
	mov.w	#_global_n_4_bak, r15
	mov.w	-6(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_BW_btbl_bitcount, r15
	call	#transition_to
	jmp	.LBB9_3
.LBB9_2:                                ; %if.else
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_4, r14
	mov.w	#_global_n_4_bak, r15
	mov.w	-8(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_select_func, r15
	call	#transition_to
	jmp	.LBB9_3
.LBB9_3:                                ; %if.end
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end9:
	.size	task_BW_btbl_bitcount, .Lfunc_end9-task_BW_btbl_bitcount

	.globl	task_AR_btbl_bitcount
	.align	2
	.type	task_AR_btbl_bitcount,@function
task_AR_btbl_bitcount:                  ; @task_AR_btbl_bitcount
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	mov.w	&_global_iter, r12
	mov.w	r12, &_global_iter_bak
	mov.w	&_global_n_5, r12
	mov.w	r12, &_global_n_5_bak
	mov.w	&_global_seed, r12
	mov.w	&_global_seed+2, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	#_global_seed_bak, -2(r4)
	mov.w	#1, r12
	add.w	#_global_seed_bak, r12
	mov.w	r12, -2(r4)
	mov.b	&_global_seed_bak, r12
	mov.b	bits(r12), r12
	sxt	r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -2(r4)
	mov.b	0(r12), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov.w	-4(r4), r13
	add.w	r12, r13
	mov.w	r13, -4(r4)
	mov.w	-2(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -2(r4)
	mov.b	0(r12), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov.w	-4(r4), r13
	add.w	r12, r13
	mov.w	r13, -4(r4)
	mov.w	-2(r4), r12
	mov.b	0(r12), r12
	mov.b	bits(r12), r12
	sxt	r12
	add.w	r12, r13
	mov.w	r13, -4(r4)
	mov.w	&_global_n_5_bak, r12
	add.w	r13, r12
	mov.w	r12, &_global_n_5_bak
	mov.w	&_global_seed_bak, r12
	mov.w	&_global_seed_bak+2, r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	&_global_iter_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_iter_bak
	cmp.w	#100, r12
	jhs	.LBB10_2
	jmp	.LBB10_1
.LBB10_1:                               ; %if.then
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_5, r14
	mov.w	#_global_n_5_bak, r15
	mov.w	-6(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_AR_btbl_bitcount, r15
	call	#transition_to
	jmp	.LBB10_3
.LBB10_2:                               ; %if.else
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_5, r14
	mov.w	#_global_n_5_bak, r15
	mov.w	-8(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_select_func, r15
	call	#transition_to
	jmp	.LBB10_3
.LBB10_3:                               ; %if.end
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end10:
	.size	task_AR_btbl_bitcount, .Lfunc_end10-task_AR_btbl_bitcount

	.globl	task_bit_shifter
	.align	2
	.type	task_bit_shifter,@function
task_bit_shifter:                       ; @task_bit_shifter
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	mov.w	&_global_iter, r12
	mov.w	r12, &_global_iter_bak
	mov.w	&_global_n_6, r12
	mov.w	r12, &_global_n_6_bak
	mov.w	&_global_seed, r12
	mov.w	&_global_seed+2, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	r13, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	#0, -4(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB11_1
.LBB11_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	bis.w	r12, r13
	cmp.w	#0, r13
	mov.b	r14, -9(r4)             ; 1-byte Folded Spill
	jeq	.LBB11_3
	jmp	.LBB11_2
.LBB11_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	-2(r4), r12
	cmp.w	#32, r12
	mov.w	r2, r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -9(r4)             ; 1-byte Folded Spill
	jmp	.LBB11_3
.LBB11_3:                               ; %land.end
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.b	-9(r4), r12             ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB11_6
	jmp	.LBB11_4
.LBB11_4:                               ; %for.body
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	-8(r4), r12
	and.w	#1, r12
	mov.w	-4(r4), r13
	add.w	r12, r13
	mov.w	r13, -4(r4)
	jmp	.LBB11_5
.LBB11_5:                               ; %for.inc
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	clrc
	rrc.w	r13
	mov.w	r12, r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	bis.w	r14, r13
	clrc
	rrc.w	r12
	mov.w	r12, -6(r4)
	mov.w	r13, -8(r4)
	jmp	.LBB11_1
.LBB11_6:                               ; %for.end
	mov.w	-4(r4), r12
	mov.w	&_global_n_6_bak, r13
	add.w	r12, r13
	mov.w	r13, &_global_n_6_bak
	mov.w	&_global_seed_bak, r12
	mov.w	&_global_seed_bak+2, r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, &_global_seed_bak+2
	mov.w	r12, &_global_seed_bak
	mov.w	&_global_iter_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_iter_bak
	cmp.w	#100, r12
	jhs	.LBB11_8
	jmp	.LBB11_7
.LBB11_7:                               ; %if.then
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_6, r14
	mov.w	#_global_n_6_bak, r15
	mov.w	-12(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_bit_shifter, r15
	call	#transition_to
	jmp	.LBB11_9
.LBB11_8:                               ; %if.else
	mov.w	#_global_iter, r14
	mov.w	#_global_iter_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_n_6, r14
	mov.w	#_global_n_6_bak, r15
	mov.w	-14(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	#4, r13
	call	#write_to_gbuf
	mov.w	#_task_task_select_func, r15
	call	#transition_to
	jmp	.LBB11_9
.LBB11_9:                               ; %if.end
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end11:
	.size	task_bit_shifter, .Lfunc_end11-task_bit_shifter

	.globl	task_end
	.align	2
	.type	task_end,@function
task_end:                               ; @task_end
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#10, r1
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.3, 0(r14)
	call	#printf
	mov.w	&_global_n_0, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.4, 0(r13)
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	call	#printf
	mov.w	#0, r12
	mov.w	r15, -4(r4)             ; 2-byte Folded Spill
	mov.w	r12, r15
	call	#exit
.Lfunc_end12:
	.size	task_end, .Lfunc_end12-task_end

	.globl	_entry_task
	.align	2
	.type	_entry_task,@function
_entry_task:                            ; @_entry_task
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#_task_task_init, r15
	call	#transition_to
	pop.w	r4
	ret
.Lfunc_end13:
	.size	_entry_task, .Lfunc_end13-_entry_task

	.globl	_init
	.align	2
	.type	_init,@function
_init:                                  ; @_init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	call	#init
	pop.w	r4
	ret
.Lfunc_end14:
	.size	_init, .Lfunc_end14-_init

	.globl	clear_isDirty
	.align	2
	.type	clear_isDirty,@function
clear_isDirty:                          ; @clear_isDirty
; BB#0:                                 ; %entry
	ret
.Lfunc_end15:
	.size	clear_isDirty, .Lfunc_end15-clear_isDirty

	.align	2
	.type	init_hw,@function
init_hw:                                ; @init_hw
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	call	#msp_watchdog_disable
	mov.w	&0x0130, r12
	and.w	#-2, r12
	mov.w	r12, &0x0130
	call	#msp_clock_setup
	pop.w	r4
	ret
.Lfunc_end16:
	.size	init_hw, .Lfunc_end16-init_hw

	.globl	msp_watchdog_enable
	.align	2
	.type	msp_watchdog_enable,@function
msp_watchdog_enable:                    ; @msp_watchdog_enable
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	;DEBUG_VALUE: msp_watchdog_enable:bits <- R15
	;DEBUG_VALUE: msp_watchdog_enable:bits <- R15
	mov.b	r15, r12
	bis.w	#23048, r15
	mov.w	r15, &0x015C
	mov.b	r12, &watchdog_bits
	pop.w	r4
	ret
.Lfunc_end17:
	.size	msp_watchdog_enable, .Lfunc_end17-msp_watchdog_enable

	.globl	msp_watchdog_disable
	.align	2
	.type	msp_watchdog_disable,@function
msp_watchdog_disable:                   ; @msp_watchdog_disable
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#23168, &0x015C
	pop.w	r4
	ret
.Lfunc_end18:
	.size	msp_watchdog_disable, .Lfunc_end18-msp_watchdog_disable

	.globl	msp_watchdog_kick
	.align	2
	.type	msp_watchdog_kick,@function
msp_watchdog_kick:                      ; @msp_watchdog_kick
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.b	&watchdog_bits, r12
	bis.w	#23048, r12
	mov.w	r12, &0x015C
	pop.w	r4
	ret
.Lfunc_end19:
	.size	msp_watchdog_kick, .Lfunc_end19-msp_watchdog_kick

	.globl	memcpy
	.align	2
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	;DEBUG_VALUE: memcpy:dest <- R15
	;DEBUG_VALUE: memcpy:src <- R14
	;DEBUG_VALUE: memcpy:n <- R13
	;DEBUG_VALUE: memcpy:n <- R13
	;DEBUG_VALUE: memcpy:src <- R14
	;DEBUG_VALUE: memcpy:dest <- R15
	;DEBUG_VALUE: memcpy:i <- 0
	mov.w	r13, r12
	;DEBUG_VALUE: memcpy:src <- R14
	;DEBUG_VALUE: memcpy:dest <- R15
	cmp.w	#0, r13
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	;DEBUG_VALUE: memcpy:dest <- [FP+-2]
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	mov.w	r14, -6(r4)             ; 2-byte Folded Spill
	;DEBUG_VALUE: memcpy:src <- [FP+-6]
	jeq	.LBB20_4
	jmp	.LBB20_1
.LBB20_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB20_2
.LBB20_2:                               ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	mov.w	-6(r4), r13             ; 2-byte Folded Reload
	add.w	r12, r13
	mov.b	0(r13), r14
	mov.w	-2(r4), r13             ; 2-byte Folded Reload
	add.w	r12, r13
	mov.b	r14, 0(r13)
	add.w	#1, r12
	;DEBUG_VALUE: memcpy:i <- R12
	mov.w	-4(r4), r13             ; 2-byte Folded Reload
	cmp.w	r13, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jne	.LBB20_2
	jmp	.LBB20_3
.LBB20_3:                               ; %while.end.loopexit
	jmp	.LBB20_4
.LBB20_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end20:
	.size	memcpy, .Lfunc_end20-memcpy

	.globl	my_memset
	.align	2
	.type	my_memset,@function
my_memset:                              ; @my_memset
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	;DEBUG_VALUE: my_memset:s <- R15
	;DEBUG_VALUE: my_memset:c <- R14
	;DEBUG_VALUE: my_memset:n <- R13
	;APP
	mov r15, r12
add r15, r13
cmp r13, r12
jz $+10
mov.b r14, 0(r12)
inc r12
jmp $-10

	;NO_APP
	pop.w	r4
	ret
.Lfunc_end21:
	.size	my_memset, .Lfunc_end21-my_memset

	.globl	msp_clock_setup
	.align	2
	.type	msp_clock_setup,@function
msp_clock_setup:                        ; @msp_clock_setup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.b	#-91, &0x0160+1
	mov.w	#70, &0x0162
	mov.w	#51, &0x0164
	mov.w	#0, &0x0166
	pop.w	r4
	ret
.Lfunc_end22:
	.size	msp_clock_setup, .Lfunc_end22-msp_clock_setup

	.globl	mult16
	.align	2
	.type	mult16,@function
mult16:                                 ; @mult16
; BB#0:                                 ; %entry
	;APP
	MOV R15, &0x04C0
MOV R14, &0x04C8
MOV &0x04CA, R14
MOV &0x04CC, R15
RET

	;NO_APP
.Lfunc_end23:
	.size	mult16, .Lfunc_end23-mult16

	.globl	sqrt16
	.align	2
	.type	sqrt16,@function
sqrt16:                                 ; @sqrt16
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#30, r1
	;DEBUG_VALUE: sqrt16:x <- undef
	mov.w	r15, r12
	mov.w	r14, r13
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	#-1, -10(r4)
	mov.w	#0, -12(r4)
	mov.w	-10(r4), r14
	clrc
	rrc.w	r14
	mov.w	r14, -14(r4)
	mov.w	#0, -18(r4)
	mov.w	#0, -20(r4)
	mov.w	r13, -22(r4)            ; 2-byte Folded Spill
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB24_1
.LBB24_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-20(r4), r12
	mov.w	-18(r4), r13
	mov.w	-8(r4), r14
	mov.w	-6(r4), r15
	mov.b	#0, r11
	xor.w	r15, r13
	xor.w	r14, r12
	bis.w	r13, r12
	cmp.w	#0, r12
	mov.b	r11, -25(r4)            ; 1-byte Folded Spill
	jeq	.LBB24_3
	jmp	.LBB24_2
.LBB24_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB24_3
.LBB24_3:                               ; %land.end
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB24_10
	jmp	.LBB24_4
.LBB24_4:                               ; %while.body
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	mov.w	#0, r14
	add.w	r13, r12
	addc.w	#0, r14
	clrc
	rrc.w	r12
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	bis.w	r14, r12
	mov.w	r12, -14(r4)
	mov.w	r12, r15
	mov.w	r12, r14
	call	#mult16
	mov.w	r15, -18(r4)
	mov.w	r14, -20(r4)
	mov.w	-8(r4), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r15
	mov.w	r2, r11
	and.w	#1, r11
	cmp.w	r12, r14
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	r13, r15
	mov.w	r11, -28(r4)            ; 2-byte Folded Spill
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
	jeq	.LBB24_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB24_6:                               ; %while.body
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB24_8
	jmp	.LBB24_7
.LBB24_7:                               ; %if.then
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB24_9
.LBB24_8:                               ; %if.else
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB24_9
.LBB24_9:                               ; %if.end
                                        ;   in Loop: Header=BB24_1 Depth=1
	jmp	.LBB24_1
.LBB24_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end24:
	.size	sqrt16, .Lfunc_end24-sqrt16

	.globl	udivmodhi4
	.align	2
	.type	udivmodhi4,@function
udivmodhi4:                             ; @udivmodhi4
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#20, r1
	;DEBUG_VALUE: udivmodhi4:num <- undef
	;DEBUG_VALUE: udivmodhi4:den <- undef
	;DEBUG_VALUE: udivmodhi4:modwanted <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -8(r4)
	mov.w	r14, -10(r4)
	mov.w	r13, -12(r4)
	mov.w	#1, -14(r4)
	mov.w	#0, -16(r4)
	mov.w	r12, -18(r4)            ; 2-byte Folded Spill
	mov.w	r11, -20(r4)            ; 2-byte Folded Spill
	mov.w	r10, -22(r4)            ; 2-byte Folded Spill
	jmp	.LBB25_1
.LBB25_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB25_4
	jmp	.LBB25_2
.LBB25_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB25_4
	jmp	.LBB25_3
.LBB25_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB25_4
.LBB25_4:                               ; %land.end
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB25_6
	jmp	.LBB25_5
.LBB25_5:                               ; %while.body
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB25_1
.LBB25_6:                               ; %while.end
	jmp	.LBB25_7
.LBB25_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB25_11
	jmp	.LBB25_8
.LBB25_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB25_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB25_10
	jmp	.LBB25_9
.LBB25_9:                               ; %if.then
                                        ;   in Loop: Header=BB25_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB25_10
.LBB25_10:                              ; %if.end
                                        ;   in Loop: Header=BB25_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB25_7
.LBB25_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB25_13
	jmp	.LBB25_12
.LBB25_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB25_14
.LBB25_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB25_14
.LBB25_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end25:
	.size	udivmodhi4, .Lfunc_end25-udivmodhi4

	.globl	__divhi3
	.align	2
	.type	__divhi3,@function
__divhi3:                               ; @__divhi3
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	;DEBUG_VALUE: __divhi3:a <- undef
	;DEBUG_VALUE: __divhi3:b <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	#0, -6(r4)
	mov.w	-2(r4), r14
	cmp.w	#0, r14
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	jge	.LBB26_2
	jmp	.LBB26_1
.LBB26_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	-6(r4), r12
	cmp.w	#0, r12
	mov.w	r2, r12
	rra.w	r12
	and.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB26_2
.LBB26_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB26_4
	jmp	.LBB26_3
.LBB26_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	mov.w	-6(r4), r12
	cmp.w	#0, r12
	mov.w	r2, r12
	rra.w	r12
	and.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB26_4
.LBB26_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB26_6
	jmp	.LBB26_5
.LBB26_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB26_6
.LBB26_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end26:
	.size	__divhi3, .Lfunc_end26-__divhi3

	.globl	__modhi3
	.align	2
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	;DEBUG_VALUE: __modhi3:a <- undef
	;DEBUG_VALUE: __modhi3:b <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	#0, -6(r4)
	mov.w	-2(r4), r14
	cmp.w	#0, r14
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	jge	.LBB27_2
	jmp	.LBB27_1
.LBB27_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
	jmp	.LBB27_2
.LBB27_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB27_4
	jmp	.LBB27_3
.LBB27_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	jmp	.LBB27_4
.LBB27_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB27_6
	jmp	.LBB27_5
.LBB27_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB27_6
.LBB27_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end27:
	.size	__modhi3, .Lfunc_end27-__modhi3

	.globl	__udivhi3
	.align	2
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#8, r1
	;DEBUG_VALUE: __udivhi3:a <- undef
	;DEBUG_VALUE: __udivhi3:b <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -4(r4)
	mov.w	r14, -6(r4)
	mov.w	-4(r4), r15
	mov.w	#0, r11
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	mov.w	r11, r13
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	call	#udivmodhi4
	add.w	#8, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end28:
	.size	__udivhi3, .Lfunc_end28-__udivhi3

	.globl	__umodhi3
	.align	2
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#8, r1
	;DEBUG_VALUE: __umodhi3:a <- undef
	;DEBUG_VALUE: __umodhi3:b <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -4(r4)
	mov.w	r14, -6(r4)
	mov.w	-4(r4), r15
	mov.w	#1, r11
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	mov.w	r11, r13
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	call	#udivmodhi4
	add.w	#8, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end29:
	.size	__umodhi3, .Lfunc_end29-__umodhi3

	.globl	task_prologue
	.align	2
	.type	task_prologue,@function
task_prologue:                          ; @task_prologue
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	mov.w	&_numBoots, r12
	cmp.w	#-1, r12
	jne	.LBB30_2
	jmp	.LBB30_1
.LBB30_1:                               ; %if.then
	call	#clear_isDirty
	mov.w	&_numBoots, r12
	add.w	#1, r12
	mov.w	r12, &_numBoots
	jmp	.LBB30_2
.LBB30_2:                               ; %if.end
	mov.w	&_numBoots, r12
	add.w	#1, r12
	mov.w	r12, &_numBoots
	mov.w	&curctx, r12
	mov.b	2(r12), r13
	cmp.b	#0, r13
	jeq	.LBB30_7
	jmp	.LBB30_3
.LBB30_3:                               ; %if.then.2
	jmp	.LBB30_4
.LBB30_4:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&gv_index, r12
	mov.w	&num_dirty_gv, r13
	cmp.w	r13, r12
	jhs	.LBB30_6
	jmp	.LBB30_5
.LBB30_5:                               ; %while.body
                                        ;   in Loop: Header=BB30_4 Depth=1
	;DEBUG_VALUE: w_data_dest <- [FP+-2]
	mov.w	&data_dest_base, r12
	mov.w	&gv_index, r13
	rla.w	r13
	add.w	r13, r12
	mov.w	0(r12), r12
	mov.w	r12, -2(r4)
	;DEBUG_VALUE: w_data_src <- [FP+-4]
	mov.w	&data_src_base, r12
	mov.w	&gv_index, r13
	rla.w	r13
	add.w	r13, r12
	mov.w	0(r12), r12
	mov.w	r12, -4(r4)
	;DEBUG_VALUE: w_data_size <- [FP+-6]
	mov.w	&data_size_base, r12
	mov.w	&gv_index, r13
	rla.w	r13
	add.w	r13, r12
	mov.w	0(r12), r12
	mov.w	r12, -6(r4)
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	r12, r13
	call	#memcpy
	mov.w	&gv_index, r12
	add.w	#1, r12
	mov.w	r12, &gv_index
	jmp	.LBB30_4
.LBB30_6:                               ; %while.end
	mov.w	#0, &num_dirty_gv
	mov.w	#0, &gv_index
	mov.w	&curctx, r12
	mov.b	#0, 2(r12)
	jmp	.LBB30_8
.LBB30_7:                               ; %if.else
	mov.w	#0, &num_dirty_gv
	jmp	.LBB30_8
.LBB30_8:                               ; %if.end.8
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end30:
	.size	task_prologue, .Lfunc_end30-task_prologue

	.globl	transition_to
	.align	2
	.type	transition_to,@function
transition_to:                          ; @transition_to
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#10, r1
	;DEBUG_VALUE: transition_to:next_task <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	&curctx, r15
	mov.w	#context_0, r13
	mov.w	#context_1, r14
	cmp.w	r13, r15
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	mov.w	r14, -10(r4)            ; 2-byte Folded Spill
	jeq	.LBB31_2
; BB#1:                                 ; %entry
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
.LBB31_2:                               ; %entry
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r13
	mov.w	r13, 0(r12)
	mov.w	-4(r4), r12
	mov.b	#1, 2(r12)
	mov.w	-4(r4), r12
	mov.w	r12, &curctx
	call	#task_prologue
	mov.w	-2(r4), r12
	mov.w	0(r12), r12
	;APP
	mov #0x2400, r1
br r12

	;NO_APP
	add.w	#10, r1
	pop.w	r4
	ret
.Lfunc_end31:
	.size	transition_to, .Lfunc_end31-transition_to

	.globl	write_to_gbuf
	.align	2
	.type	write_to_gbuf,@function
write_to_gbuf:                          ; @write_to_gbuf
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#12, r1
	;DEBUG_VALUE: write_to_gbuf:data_src <- undef
	;DEBUG_VALUE: write_to_gbuf:data_dest <- undef
	;DEBUG_VALUE: write_to_gbuf:var_size <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.w	&data_size_base, r14
	mov.w	&num_dirty_gv, r15
	rla.w	r15
	add.w	r15, r14
	mov.w	r13, 0(r14)
	mov.w	-8(r4), r13
	mov.w	&data_dest_base, r14
	mov.w	&num_dirty_gv, r15
	rla.w	r15
	add.w	r15, r14
	mov.w	r13, 0(r14)
	mov.w	-6(r4), r13
	mov.w	&data_src_base, r14
	mov.w	&num_dirty_gv, r15
	rla.w	r15
	add.w	r15, r14
	mov.w	r13, 0(r14)
	mov.w	&num_dirty_gv, r13
	add.w	#1, r13
	mov.w	r13, &num_dirty_gv
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r11, -14(r4)            ; 2-byte Folded Spill
	mov.w	r10, -16(r4)            ; 2-byte Folded Spill
	add.w	#12, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end32:
	.size	write_to_gbuf, .Lfunc_end32-write_to_gbuf

	.globl	main
	.align	2
	.type	main,@function
main:                                   ; @main
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	#0, -2(r4)
	call	#_init
	call	#task_prologue
	mov.w	&curctx, r12
	mov.w	0(r12), r12
	mov.w	0(r12), r12
	;APP
	br r12

	;NO_APP
	mov.w	#0, r15
	add.w	#2, r1
	pop.w	r4
	ret
.Lfunc_end33:
	.size	main, .Lfunc_end33-main

	.type	_task_task_init,@object ; @_task_task_init
	.section	.nv_vars,"aw",@progbits
	.globl	_task_task_init
	.align	1
_task_task_init:
	.short	task_init
	.short	1                       ; 0x1
	.size	_task_task_init, 4

	.type	_task_task_select_func,@object ; @_task_task_select_func
	.globl	_task_task_select_func
	.align	1
_task_task_select_func:
	.short	task_select_func
	.short	2                       ; 0x2
	.size	_task_task_select_func, 4

	.type	_task_task_bit_count,@object ; @_task_task_bit_count
	.globl	_task_task_bit_count
	.align	1
_task_task_bit_count:
	.short	task_bit_count
	.short	3                       ; 0x3
	.size	_task_task_bit_count, 4

	.type	_task_task_bitcount,@object ; @_task_task_bitcount
	.globl	_task_task_bitcount
	.align	1
_task_task_bitcount:
	.short	task_bitcount
	.short	4                       ; 0x4
	.size	_task_task_bitcount, 4

	.type	_task_task_ntbl_bitcnt,@object ; @_task_task_ntbl_bitcnt
	.globl	_task_task_ntbl_bitcnt
	.align	1
_task_task_ntbl_bitcnt:
	.short	task_ntbl_bitcnt
	.short	5                       ; 0x5
	.size	_task_task_ntbl_bitcnt, 4

	.type	_task_task_ntbl_bitcount,@object ; @_task_task_ntbl_bitcount
	.globl	_task_task_ntbl_bitcount
	.align	1
_task_task_ntbl_bitcount:
	.short	task_ntbl_bitcount
	.short	6                       ; 0x6
	.size	_task_task_ntbl_bitcount, 4

	.type	_task_task_BW_btbl_bitcount,@object ; @_task_task_BW_btbl_bitcount
	.globl	_task_task_BW_btbl_bitcount
	.align	1
_task_task_BW_btbl_bitcount:
	.short	task_BW_btbl_bitcount
	.short	7                       ; 0x7
	.size	_task_task_BW_btbl_bitcount, 4

	.type	_task_task_AR_btbl_bitcount,@object ; @_task_task_AR_btbl_bitcount
	.globl	_task_task_AR_btbl_bitcount
	.align	1
_task_task_AR_btbl_bitcount:
	.short	task_AR_btbl_bitcount
	.short	8                       ; 0x8
	.size	_task_task_AR_btbl_bitcount, 4

	.type	_task_task_bit_shifter,@object ; @_task_task_bit_shifter
	.globl	_task_task_bit_shifter
	.align	1
_task_task_bit_shifter:
	.short	task_bit_shifter
	.short	9                       ; 0x9
	.size	_task_task_bit_shifter, 4

	.type	_task_task_end,@object  ; @_task_task_end
	.globl	_task_task_end
	.align	1
_task_task_end:
	.short	task_end
	.short	10                      ; 0xa
	.size	_task_task_end, 4

	.type	overflow,@object        ; @overflow
	.section	.bss,"aw",@nobits
	.globl	overflow
	.align	1
overflow:
	.short	0                       ; 0x0
	.size	overflow, 2

	.type	__vector_timer0_b1,@object ; @__vector_timer0_b1
	.section	__interrupt_vector_timer0_b1,"aw",@progbits
	.globl	__vector_timer0_b1
	.align	1
__vector_timer0_b1:
	.short	TimerB1_ISR
	.size	__vector_timer0_b1, 2

	.type	timer,@object           ; @timer
	.section	.data.rel,"aw",@progbits
	.globl	timer
	.align	1
timer:
	.short	0x03C0
	.size	timer, 2

	.type	_global_func_bak,@object ; @_global_func_bak
	.section	.nv_vars,"aw",@progbits
	.globl	_global_func_bak
	.align	1
_global_func_bak:
	.short	0                       ; 0x0
	.size	_global_func_bak, 2

	.type	_global_func,@object    ; @_global_func
	.globl	_global_func
	.align	1
_global_func:
	.short	0                       ; 0x0
	.size	_global_func, 2

	.type	_global_n_0_bak,@object ; @_global_n_0_bak
	.globl	_global_n_0_bak
	.align	1
_global_n_0_bak:
	.short	0                       ; 0x0
	.size	_global_n_0_bak, 2

	.type	_global_n_0,@object     ; @_global_n_0
	.globl	_global_n_0
	.align	1
_global_n_0:
	.short	0                       ; 0x0
	.size	_global_n_0, 2

	.type	_global_n_1_bak,@object ; @_global_n_1_bak
	.globl	_global_n_1_bak
	.align	1
_global_n_1_bak:
	.short	0                       ; 0x0
	.size	_global_n_1_bak, 2

	.type	_global_n_1,@object     ; @_global_n_1
	.globl	_global_n_1
	.align	1
_global_n_1:
	.short	0                       ; 0x0
	.size	_global_n_1, 2

	.type	_global_n_2_bak,@object ; @_global_n_2_bak
	.globl	_global_n_2_bak
	.align	1
_global_n_2_bak:
	.short	0                       ; 0x0
	.size	_global_n_2_bak, 2

	.type	_global_n_2,@object     ; @_global_n_2
	.globl	_global_n_2
	.align	1
_global_n_2:
	.short	0                       ; 0x0
	.size	_global_n_2, 2

	.type	_global_n_3_bak,@object ; @_global_n_3_bak
	.globl	_global_n_3_bak
	.align	1
_global_n_3_bak:
	.short	0                       ; 0x0
	.size	_global_n_3_bak, 2

	.type	_global_n_3,@object     ; @_global_n_3
	.globl	_global_n_3
	.align	1
_global_n_3:
	.short	0                       ; 0x0
	.size	_global_n_3, 2

	.type	_global_n_4_bak,@object ; @_global_n_4_bak
	.globl	_global_n_4_bak
	.align	1
_global_n_4_bak:
	.short	0                       ; 0x0
	.size	_global_n_4_bak, 2

	.type	_global_n_4,@object     ; @_global_n_4
	.globl	_global_n_4
	.align	1
_global_n_4:
	.short	0                       ; 0x0
	.size	_global_n_4, 2

	.type	_global_n_5_bak,@object ; @_global_n_5_bak
	.globl	_global_n_5_bak
	.align	1
_global_n_5_bak:
	.short	0                       ; 0x0
	.size	_global_n_5_bak, 2

	.type	_global_n_5,@object     ; @_global_n_5
	.globl	_global_n_5
	.align	1
_global_n_5:
	.short	0                       ; 0x0
	.size	_global_n_5, 2

	.type	_global_n_6_bak,@object ; @_global_n_6_bak
	.globl	_global_n_6_bak
	.align	1
_global_n_6_bak:
	.short	0                       ; 0x0
	.size	_global_n_6_bak, 2

	.type	_global_n_6,@object     ; @_global_n_6
	.globl	_global_n_6
	.align	1
_global_n_6:
	.short	0                       ; 0x0
	.size	_global_n_6, 2

	.type	_global_seed_bak,@object ; @_global_seed_bak
	.globl	_global_seed_bak
	.align	1
_global_seed_bak:
	.long	0                       ; 0x0
	.size	_global_seed_bak, 4

	.type	_global_seed,@object    ; @_global_seed
	.globl	_global_seed
	.align	1
_global_seed:
	.long	0                       ; 0x0
	.size	_global_seed, 4

	.type	_global_iter_bak,@object ; @_global_iter_bak
	.globl	_global_iter_bak
	.align	1
_global_iter_bak:
	.short	0                       ; 0x0
	.size	_global_iter_bak, 2

	.type	_global_iter,@object    ; @_global_iter
	.globl	_global_iter
	.align	1
_global_iter:
	.short	0                       ; 0x0
	.size	_global_iter, 2

	.type	_task__entry_task,@object ; @_task__entry_task
	.globl	_task__entry_task
	.align	1
_task__entry_task:
	.short	_entry_task
	.short	0                       ; 0x0
	.size	_task__entry_task, 4

	.type	data_src,@object        ; @data_src
	.globl	data_src
	.align	1
data_src:
	.zero	6
	.size	data_src, 6

	.type	data_dest,@object       ; @data_dest
	.globl	data_dest
	.align	1
data_dest:
	.zero	6
	.size	data_dest, 6

	.type	data_size,@object       ; @data_size
	.globl	data_size
	.align	1
data_size:
	.zero	6
	.size	data_size, 6

	.type	.L.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	".%u.\r\n"
	.size	.L.str, 7

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"time start is 65536*%u+%u\r\n"
	.size	.L.str.1, 28

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"n_0%u\r\n"
	.size	.L.str.2, 8

	.type	bits,@object            ; @bits
	.section	.nv_vars,"aw",@progbits
bits:
	.ascii	"\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.size	bits, 256

	.type	.L.str.3,@object        ; @.str.3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str.3, 26

	.type	.L.str.4,@object        ; @.str.4
.L.str.4:
	.asciz	"%u\r\n"
	.size	.L.str.4, 5

	.type	watchdog_bits,@object   ; @watchdog_bits
	.local	watchdog_bits
	.comm	watchdog_bits,1,1
	.type	data_src_base,@object   ; @data_src_base
	.section	.nv_vars,"aw",@progbits
	.globl	data_src_base
	.align	1
data_src_base:
	.short	data_src
	.size	data_src_base, 2

	.type	data_dest_base,@object  ; @data_dest_base
	.globl	data_dest_base
	.align	1
data_dest_base:
	.short	data_dest
	.size	data_dest_base, 2

	.type	data_size_base,@object  ; @data_size_base
	.globl	data_size_base
	.align	1
data_size_base:
	.short	data_size
	.size	data_size_base, 2

	.type	gv_index,@object        ; @gv_index
	.globl	gv_index
	.align	1
gv_index:
	.short	0                       ; 0x0
	.size	gv_index, 2

	.type	num_dirty_gv,@object    ; @num_dirty_gv
	.globl	num_dirty_gv
	.align	1
num_dirty_gv:
	.short	0                       ; 0x0
	.size	num_dirty_gv, 2

	.type	context_1,@object       ; @context_1
	.globl	context_1
	.align	1
context_1:
	.zero	4
	.size	context_1, 4

	.type	context_0,@object       ; @context_0
	.globl	context_0
	.align	1
context_0:
	.short	_task__entry_task
	.byte	0                       ; 0x0
	.zero	1
	.size	context_0, 4

	.type	curctx,@object          ; @curctx
	.globl	curctx
	.align	1
curctx:
	.short	context_0
	.size	curctx, 2

	.type	_numBoots,@object       ; @_numBoots
	.globl	_numBoots
	.align	1
_numBoots:
	.short	0                       ; 0x0
	.size	_numBoots, 2


	.globl	__interrupt_vector_51
__interrupt_vector_51 = TimerB1_ISR
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.section	".note.GNU-stack","",@progbits
