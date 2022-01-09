public protocol Mux {
    static func mux(_ a: Self, _ b: Self, _ sel: Bit) -> Self
}
