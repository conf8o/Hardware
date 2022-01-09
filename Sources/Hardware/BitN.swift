public struct Bit3 {
    var bits: (Bit, Bit, Bit)
    public func any() -> Bit {
        return Bit.or(bits.0, Bit.or(bits.1, bits.2))
    }

    public func all() -> Bit {
        return Bit.and(bits.0, Bit.and(bits.1, bits.2))
    }
}

extension Bit3: BooleanLogic, Mux {
    public static func nand(_ a: Bit3, _ b: Bit3) -> Bit3 {
        Bit3(
            bits: (
                Bit.nand(a.bits.0, b.bits.0),
                Bit.nand(a.bits.1, b.bits.1),
                Bit.nand(a.bits.2, b.bits.2)
            )
        )
    }

    public static var allOff = Bit3(
        bits: (.off, .off, .off)
    )

    public static func mux(_ a: Bit3, _ b: Bit3, _ sel: Bit) -> Bit3 {
        Bit3(
            bits: (
                Bit.mux(a.bits.0, b.bits.0, sel),
                Bit.mux(a.bits.1, b.bits.1, sel),
                Bit.mux(a.bits.2, b.bits.2, sel)
            )
        )
    }
}
