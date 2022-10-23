public struct CPU {
    private var registerA = Register<Bit16>()
    private var registerD = Register<Bit16>()
    private var programCounter = PC<Bit15>()

    private var outM: Bit16

    public mutating func access(inM: Bit16, instruction: Bit16, reset: Bit) 
    -> (outM: Bit16, writeM: Bit, addressM: Bit15, pc: Bit15) {
        
        // A命令 or C命令
        let c = instruction.bits.0

        // C命令 comp
        let (outM, zero, neg) = ALU.call(
            x: registerD.access(instruction, c), 
            y: Bit16.mux(registerA.access(instruction, c), inM, instruction.bits.3), 
            zeroX: instruction.bits.4,
            negX: instruction.bits.5, 
            zeroY: instruction.bits.6,
            negY: instruction.bits.7,
            f: instruction.bits.8,
            negO: instruction.bits.9
        )

        
        // C命令 dest
        _ = registerA.access(outM, Bit.and(instruction.bits.10, c))
        _ = registerD.access(outM, Bit.and(instruction.bits.11, c))
        let writeM = Bit.and(instruction.bits.12, c)

        // C命令 jump
        let jump = Bit.mux8(
            .off,
            Bit.not(neg),
            zero,
            Bit.or(zero, Bit.not(neg)),
            neg,
            Bit.not(zero),
            Bit.or(zero, neg),
            .on,
            Bit3(bits: (instruction.bits.13, instruction.bits.14, instruction.bits.15))
        )

        let a = registerA.access(.allOff, .off).bits
        let addressM = Bit15(bits: (a.1, a.2, a.3, a.4, a.5,
                                    a.6, a.7, a.8, a.9, a.10,
                                    a.11, a.12, a.13, a.14, a.15))
        // プログラムカウンタ　ここわからん
        // とりあえず、メモリの位置が重要。メモリの位置はAレジスタにある想定
        let pc = programCounter.access(a: addressM, inc: .on,  load: Bit.and(jump, c), reset: reset)

        return (outM: outM, writeM: writeM, addressM: addressM, pc: pc)
    }
}