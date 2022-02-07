public protocol DMux {
    static func dmux(_ a: Self, _ sel: Bit) -> (a: Self, b: Self)
}

public protocol DMux4 {
    static func dmux4(
        _ a: Self, _ sel: Bit2
    ) -> (
        a: Self, b: Self, c: Self, d: Self
    )
}

public protocol DMux8 {
    static func dmux8(
        _ a: Self, _ sel: Bit3
    ) -> (
        a: Self, b: Self, c: Self, d: Self, 
        e: Self, f: Self, g: Self, h: Self
    )
}
