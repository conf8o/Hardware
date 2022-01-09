public struct Register<B: BooleanLogic & Mux> {
    var load: Bit = .allOff
    var flipflop = FlipFlop<B>()
    
    public mutating func access(_ a: B, _ load: Bit) -> B {
        defer { self.load = load }
        return flipflop.flipflop(B.mux(a, flipflop.state, self.load))
    }
}
