public protocol Mux {
    static func mux(_ a: Self, _ b: Self, _ sel: Bit) -> Self
}

public protocol Mux8 {
    static func mux8(
        _ a: Self, _ b: Self, _ c: Self, _ d: Self,
        _ e: Self, _ f: Self, _ g: Self, _ h: Self,
        _ sel: Bit3
    ) -> Self
}