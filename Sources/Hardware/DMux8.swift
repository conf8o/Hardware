public enum DMux8 {
    public static func dmux8(_ a: Bit, _ sel: Bit3) 
    -> (a: Bit, b: Bit, c: Bit, d: Bit, e: Bit, f: Bit, g: Bit, h: Bit)
    {
        (
            a: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.off, .off, .off))).all()),
            b: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.off, .off, .on))).all()),
            c: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.off, .on, .off))).all()),
            d: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.off, .on, .on))).all()),
            e: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.on, .off, .off))).all()),
            f: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.on, .off, .on))).all()),
            g: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.on, .on, .off))).all()),
            h: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.on, .on, .on))).all())
        )
    }
}
