public struct Register<B: BooleanLogic & Mux> {
    var load: Bit = .off
    var flipflop = FlipFlop<B>()
    var out: B = .allOff
    
    public mutating func access(_ a: B, _ load: Bit) -> B {
        defer { self.load = load }
        out = B.mux(out, flipflop.flipflop(a), self.load)
        return out
    }
}
