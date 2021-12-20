public struct Bit16 {
    var bits: (
        Bit, Bit, Bit, Bit,
        Bit, Bit, Bit, Bit,
        Bit, Bit, Bit, Bit,
        Bit, Bit, Bit, Bit
    )
    static var allOff = Bit16(
        bits: (
            .off, .off, .off, .off,
            .off, .off, .off, .off,
            .off, .off, .off, .off,
            .off, .off, .off, .off
        )
    )
}

extension Bit16: BooleanLogic {
    public static func nand(_ a: Bit16, _ b: Bit16) -> Bit16 {
        Bit16(
            bits:(
                Bit.nand(a.bits.0, b.bits.0),
                Bit.nand(a.bits.1, b.bits.1),
                Bit.nand(a.bits.2, b.bits.2),
                Bit.nand(a.bits.3, b.bits.3),
            
                Bit.nand(a.bits.4, b.bits.4),
                Bit.nand(a.bits.5, b.bits.5),
                Bit.nand(a.bits.6, b.bits.6),
                Bit.nand(a.bits.7, b.bits.7),
            
                Bit.nand(a.bits.8, b.bits.8),
                Bit.nand(a.bits.9, b.bits.9),
                Bit.nand(a.bits.10, b.bits.10),
                Bit.nand(a.bits.11, b.bits.11),
            
                Bit.nand(a.bits.12, b.bits.12),
                Bit.nand(a.bits.13, b.bits.13),
                Bit.nand(a.bits.14, b.bits.14),
                Bit.nand(a.bits.15, b.bits.15)
            )
        )
    }
}

extension Bit16 {
    public static func mux(_ a: Bit16, _ b: Bit16, _ sel: Bit) -> Bit16 {
        Bit16.mux(a, b,
                  Bit16(
                    bits: (
                        sel, sel, sel, sel,
                        sel, sel, sel, sel,
                        sel, sel, sel, sel,
                        sel, sel, sel, sel
                    )
                  )
        )
    }
    
    public static func dmux(_ _in: Bit16, _ sel: Bit) -> (a: Bit16, b: Bit16) {
        Bit16.dmux(_in,
                   Bit16(
                    bits: (
                        sel, sel, sel, sel,
                        sel, sel, sel, sel,
                        sel, sel, sel, sel,
                        sel, sel, sel, sel
                    )
                   )
        )
    }
}
