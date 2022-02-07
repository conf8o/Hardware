public enum Bit {
    case off, on
}

extension Bit: BooleanLogic {
    public static func nand(_ a: Bit, _ b: Bit) -> Bit {
        if case (.on, .on) = (a, b) {
            return .off
        } else {
            return .on
        }
    }
    
    public static var allOff: Bit = .off
}

extension Bit: Mux, DMux {
    public static func mux(_ a: Bit, _ b: Bit, _ sel: Bit) -> Bit {
        Bit.xor(Bit.and(a, Bit.not(sel)),
                Bit.and(b, sel))
    }
    
    public static func dmux(_ a: Bit, _ sel: Bit) -> (a: Bit, b: Bit) {
        (a: Bit.and(a, Bit.not(sel)), b: Bit.and(a, sel))
    }
}

extension Bit: DMux4 {
    public static func dmux4(_ a: Bit, _ sel: Bit2) -> (a: Bit, b: Bit, c: Bit, d: Bit) {
        (
            a: Bit.and(a, Bit2.xnor(sel, Bit2(bits: (.off, .off))).all()),
            b: Bit.and(a, Bit2.xnor(sel, Bit2(bits: (.off, .on))).all()),
            c: Bit.and(a, Bit2.xnor(sel, Bit2(bits: (.on, .off))).all()),
            d: Bit.and(a, Bit2.xnor(sel, Bit2(bits: (.on, .on))).all())
        )
    }
}

extension Bit: DMux8 {
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