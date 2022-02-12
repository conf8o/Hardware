public struct CPU {
    private struct MnemonicCodes {
        public static var zero = Bit6(bits: (.on, .off, .on, .off, .on, .off))
        public static var one = Bit6(bits: (.on, .on, .on, .on, .on, .on))
        public static var negOne = Bit6(bits: (.on, .on, .on, .off, .on, .off))
        public static var D = Bit6(bits: (.off, .off, .on, .on, .off, .off))
        public static var AM = Bit6(bits: (.on, .on, .off, .off, .off, .off))
        public static var notD = Bit6(bits: (.off, .off, .on, .on, .off, .on))
        public static var notAM = Bit6(bits: (.on, .on, .off, .off, .off, .on))
        public static var negD = Bit6(bits: (.off, .off, .on, .on, .off, .on))
        public static var negAM = Bit6(bits: (.on, .on, .off, .off, .on, .on))
        public static var incD = Bit6(bits: (.off, .on, .on, .on, .on, .on))
        public static var incAM = Bit6(bits: (.on, .on, .off, .on, .on, .on))
        public static var decD = Bit6(bits: (.off, .off, .on, .on, .on, .off))
        public static var DplusAM = Bit6(bits: (.off, .off, .off, .off, .on, .off))
        public static var DminusAM = Bit6(bits: (.off, .on, .off, .off, .on, .off))
        public static var AMminusD = Bit6(bits: (.off, .off, .off, .on, .on, .on))
        public static var DandAM = Bit6(bits: (.off, .off, .off, .off, .off, .off))
        public static var DorAM = Bit6(bits: (.off, .on, .off, .on, .off, .on))
    } 

    private var A = Register<Bit16>()
    private var D = Register<Bit16>()
    private var pc = PC<Bit16>()

    private var outM: Bit16

    private static func decode(_ instruction: Bit16) -> (compa: Bit, comp: Bit6, dest: Bit3, jump: Bit3) {
        let code = instruction.bits
        return (
            code.3,
            Bit6(bits: (code.4, code.5, code.6, code.7, code.8, code.9)),
            Bit3(bits: (code.10, code.11, code.12)),
            Bit3(bits: (code.13, code.14, code.15))
        )
    }
    // public mutating func access(_ inM: Bit16, _ instruction: Bit16, _ reset: Bit) 
    // -> (outM: Bit16, writeM: Bit, addressM: Bit15, pc: Bit15) {
    //     let codeBits = instruction.bits
    //     let c = codeBits.0
    //     let (a, comp, dest, jump) = CPU.decode(instruction)
    //     let a = A.access(Bit16.mux(outM, instruction, .on), .on)

    //     return 
    // }
}