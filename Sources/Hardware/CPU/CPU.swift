public struct CPU {
    private var registerA = Register<Bit16>()
    private var registerD = Register<Bit16>()
    private var programCounter = PC<Bit15>()

    private var outM: Bit16

    public mutating func access(_ inM: Bit16, _ instruction: Bit16, _ reset: Bit) 
    -> (outM: Bit16, writeM: Bit, addressM: Bit15, pc: Bit15) {
        let c = instruction.bits.0
        let (outM, zero, neg) = ALU.call(
            registerD.access(instruction, c), 
            Bit16.mux(registerA.access(instruction, c), inM, instruction.bits.3), 
            instruction.bits.4,
            instruction.bits.5, 
            instruction.bits.6,
            instruction.bits.7,
            instruction.bits.8,
            instruction.bits.9
        )

        
        _ = registerA.access(outM, Bit.and(instruction.bits.10, c))
        let writeM = Bit.and(instruction.bits.12, c)
        _ = registerD.access(outM, Bit.and(instruction.bits.11, c))

        let addressM = Bit15(
            bits: (
                Bit, Bit, Bit, Bit, Bit, 
                Bit, Bit, Bit, Bit, Bit, 
                Bit, Bit, Bit, Bit, Bit
            )
        )
        Bit15.mux8(

        )


        return 
    }
}