public struct PC<B: Mux & Increment> {
    private var load: Bit = .off
    private var inc: Bit = .off
    private var reset: Bit = .off
    private var flipflop = DFlipFlop<B>()
    private var out: B = .allOff
    
    public mutating func access(a: B, inc: Bit, load: Bit, reset: Bit) -> B {
        out = B.mux(
                B.mux(
                  B.mux(
                    out, B.increment(out), self.inc
                  ), flipflop.flipflop(a), self.load
                ), .allOff, self.reset
              )
        self.load = load
        self.inc = inc
        self.reset = reset
        return out
    }
}
