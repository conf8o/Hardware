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
    
    public static var allOff: Bit { .off }
}

extension Bit: Mux {
    public static func mux(_ a: Bit, _ b: Bit, _ sel: Bit) -> Bit {
        Bit.xor(Bit.and(a, Bit.not(sel)),
                Bit.and(b, sel))
    }
    
    public static func dmux(_ a: Bit, _ sel: Bit) -> (a: Bit, b: Bit) {
        (a: Bit.and(a, Bit.not(sel)), b: Bit.and(a, sel))
    }
}
