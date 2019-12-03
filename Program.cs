using System;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using static System.Runtime.Intrinsics.X86.Avx;
using static System.Runtime.Intrinsics.X86.Avx2;
using static System.Runtime.Intrinsics.X86.Popcnt.X64;
using static System.Runtime.Intrinsics.X86.Bmi2.X64;


namespace superfluous_mov
{
    class Program
    {
        static unsafe void Main(string[] args)
        {
            Console.WriteLine(BugBugBug());
	    Console.ReadLine();
        }

        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        unsafe static ulong BugBugBug()
        {
            var N = Vector256<int>.Count;
            var P = Vector256.Create(100);

            ulong element64;

            ulong t64;
            t64 = P.AsUInt64().GetElement(0);
            var p0 = ParallelBitDeposit(t64, 0x0707070707070707);
            var p1 = ParallelBitDeposit(t64 >> 32, 0x0707070707070707);
            t64 = P.AsUInt64().GetElement(1);
            var p2 = ParallelBitDeposit(t64, 0x0707070707070707);
            var p3 = ParallelBitDeposit(t64 >> 32, 0x0707070707070707);
            var tmp128 = ExtractVector128(P, 1);
            t64 = tmp128.AsUInt64().GetElement(0);
            var p4 = ParallelBitDeposit(t64, 0x0707070707070707);
            var p5 = ParallelBitDeposit(t64 >> 32, 0x0707070707070707);
            t64 = tmp128.AsUInt64().GetElement(1);
            var p6 = ParallelBitDeposit(t64, 0x0707070707070707);
            var p7 = ParallelBitDeposit(t64 >> 32, 0x0707070707070707);
            
            return p0+p1+p2+p3+p4+p5+p6+p7;
        }
    }
}
