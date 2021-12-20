public struct Register<B: BooleanLogic> {
    var load: B = .allOff
    var flipflop = FlipFlop<B>()
    
    public mutating func call(_ a: B, _ load: B) -> B {
        defer { self.load = load }
        return flipflop.flipflop(a: B.mux(a, flipflop.state, self.load))
    }
}
