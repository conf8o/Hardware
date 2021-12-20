public protocol BooleanLogic {
    static func nand(_ a: Self, _ b: Self) -> Self
    static var allOff: Self { get }
}

extension BooleanLogic {
    public static func not(_ a: Self) -> Self {
        Self.nand(a, a)
    }

    public static func and(_ a: Self, _ b: Self) -> Self {
        Self.not(Self.nand(a, b))
    }

    public static func or(_ a: Self, _ b: Self) -> Self {
        Self.nand(Self.not(a), Self.not(b))
    }

    public static func xor(_ a: Self, _ b: Self) -> Self {
        Self.and(Self.nand(a, b), Self.or(a, b))
    }
}

extension BooleanLogic {
    public static func mux(_ a: Self, _ b: Self, _ sel: Self) -> Self {
        Self.xor(Self.and(a, Self.not(sel)),
                 Self.and(b, sel))
    }
    
    public static func dmux(_ _in: Self, _ sel: Self) -> (a: Self, b: Self) {
        (a: Self.and(_in, Self.not(sel)), b: Self.and(_in, sel))
    }
}
