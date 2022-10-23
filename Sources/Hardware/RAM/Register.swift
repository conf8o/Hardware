public struct DFlipFlop<B: BooleanLogic> {
    private var state: B = .allOff
    public mutating func flipflop(_ a: B) -> B {
        defer { state = a }
        return state
    }
}

public struct Register<B: BooleanLogic & Mux> {
    private var load: Bit = .off
    private var flipflop = DFlipFlop<B>()
    private var out: B = .allOff
    
    public mutating func access(_ a: B, _ load: Bit) -> B {
        out = B.mux(out, flipflop.flipflop(a), self.load)
        self.load = load
        return out
    }
}
