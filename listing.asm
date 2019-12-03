; ================================================================================
; superfluous_mov.Program.BugBugBug()
; 219 (0xDB) bytes
; 43 (0x2B) instructions

00007FC3A6AB07E0 55                   push    rbp
00007FC3A6AB07E1 C5F877               vzeroupper
00007FC3A6AB07E4 488BEC               mov     rbp,rsp

;             var P = Vector256.Create(100);
00007FC3A6AB07E7 B864000000           mov     eax,64h
00007FC3A6AB07EC C5F96EC0             vmovd   xmm0,eax
00007FC3A6AB07F0 C4E27D58C0           vpbroadcastd ymm0,xmm0

;             t64 = P.AsUInt64().GetElement(0);
00007FC3A6AB07F5 C5FC28C8             vmovaps ymm1,ymm0
00007FC3A6AB07F9 C4E1F97EC8           vmovq   rax,xmm1

;             var p0 = ParallelBitDeposit(t64, 0x0707070707070707);
00007FC3A6AB07FE 48BF0707070707070707 mov     rdi,707070707070707h
00007FC3A6AB0808 C4E2FBF5FF           pdep    rdi,rax,rdi

;             var p1 = ParallelBitDeposit(t64 >> 32, 0x0707070707070707);
00007FC3A6AB080D 48C1E820             shr     rax,20h
00007FC3A6AB0811 48BE0707070707070707 mov     rsi,707070707070707h
00007FC3A6AB081B C4E2FBF5F6           pdep    rsi,rax,rsi

;             t64 = P.AsUInt64().GetElement(1);
00007FC3A6AB0820 C5FC28C8             vmovaps ymm1,ymm0
00007FC3A6AB0824 C4E3F916C801         vpextrq rax,xmm1,1

;             var p2 = ParallelBitDeposit(t64, 0x0707070707070707);
00007FC3A6AB082A 48BA0707070707070707 mov     rdx,707070707070707h
00007FC3A6AB0834 C4E2FBF5D2           pdep    rdx,rax,rdx

;             var p3 = ParallelBitDeposit(t64 >> 32, 0x0707070707070707);
00007FC3A6AB0839 48C1E820             shr     rax,20h
00007FC3A6AB083D 48B90707070707070707 mov     rcx,707070707070707h
00007FC3A6AB0847 C4E2FBF5C9           pdep    rcx,rax,rcx

;             var tmp128 = ExtractVector128(P, 1);
00007FC3A6AB084C C4E37D39C001         vextracti128 xmm0,ymm0,1

;             t64 = tmp128.AsUInt64().GetElement(0);
00007FC3A6AB0852 C4E1F97EC0           vmovq   rax,xmm0

;             var p4 = ParallelBitDeposit(t64, 0x0707070707070707);
00007FC3A6AB0857 49B80707070707070707 mov     r8,707070707070707h
00007FC3A6AB0861 C442FBF5C0           pdep    r8,rax,r8

;             var p5 = ParallelBitDeposit(t64 >> 32, 0x0707070707070707);
00007FC3A6AB0866 48C1E820             shr     rax,20h
00007FC3A6AB086A 49B90707070707070707 mov     r9,707070707070707h
00007FC3A6AB0874 C442FBF5C9           pdep    r9,rax,r9

;             t64 = tmp128.AsUInt64().GetElement(1);
00007FC3A6AB0879 C4E3F916C001         vpextrq rax,xmm0,1

;             var p6 = ParallelBitDeposit(t64, 0x0707070707070707);
00007FC3A6AB087F 49BA0707070707070707 mov     r10,707070707070707h
00007FC3A6AB0889 C442FBF5D2           pdep    r10,rax,r10

;             var p7 = ParallelBitDeposit(t64 >> 32, 0x0707070707070707);
00007FC3A6AB088E 48C1E820             shr     rax,20h
00007FC3A6AB0892 49BB0707070707070707 mov     r11,707070707070707h
00007FC3A6AB089C C4C2FBF5C3           pdep    rax,rax,r11

;             return p0+p1+p2+p3+p4+p5+p6+p7;
00007FC3A6AB08A1 4803FE               add     rdi,rsi
00007FC3A6AB08A4 4803FA               add     rdi,rdx
00007FC3A6AB08A7 4803F9               add     rdi,rcx
00007FC3A6AB08AA 4903F8               add     rdi,r8
00007FC3A6AB08AD 4903F9               add     rdi,r9
00007FC3A6AB08B0 4C03D7               add     r10,rdi
00007FC3A6AB08B3 4903C2               add     rax,r10

00007FC3A6AB08B6 C5F877               vzeroupper
00007FC3A6AB08B9 5D                   pop     rbp
00007FC3A6AB08BA C3                   ret

; ================================================================================
; superfluous_mov.Program.Main(System.String[])
; 39 (0x27) bytes
; 12 (0xC) instructions

00007FC3A6AB0390 55                   push    rbp
00007FC3A6AB0391 4883EC10             sub     rsp,10h
00007FC3A6AB0395 488D6C2410           lea     rbp,[rsp+10h]
00007FC3A6AB039A 48897DF8             mov     [rbp-8],rdi

;             Console.WriteLine(BugBugBug());
00007FC3A6AB039E E8F5BAFFFF           call    superfluous_mov.Program.BugBugBug()
00007FC3A6AB03A3 488BF8               mov     rdi,rax
00007FC3A6AB03A6 E82DFFFFFF           call    System.Console.WriteLine(UInt64)

;       Console.ReadLine();
00007FC3A6AB03AB E8C8FEFFFF           call    System.Console.ReadLine()

;         }
00007FC3A6AB03B0 90                   nop
00007FC3A6AB03B1 488D6500             lea     rsp,[rbp]
00007FC3A6AB03B5 5D                   pop     rbp
00007FC3A6AB03B6 C3                   ret
