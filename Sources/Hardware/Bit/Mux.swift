public protocol Mux {
    static func mux(_ a: Self, _ b: Self, _ sel: Bit) -> Self
}

public protocol Mux4 {
    static func mux4(
        _ a: Self, _ b: Self, _ c: Self, _ d: Self, _ sel: Bit2
    ) -> Self
}

public protocol Mux8 {
    static func mux8(
        _ a: Self, _ b: Self, _ c: Self, _ d: Self,
        _ e: Self, _ f: Self, _ g: Self, _ h: Self,
        _ sel: Bit3
    ) -> Self
}

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
