public struct PC<B: BooleanLogic & Mux> {
    private var load: Bit = .off
    private var inc: Bit = .off
    private var reset: Bit = .off
    private var flipflop = DFlipFlop<Bit16>()
    private var out: Bit16 = .allOff
    
    public mutating func access(_ a: Bit16, _ inc: Bit, _ load: Bit, _ reset: Bit) -> Bit16 {
        out = Bit16.mux(
                Bit16.mux(
                  Bit16.mux(
                    out, Increment16.increment(out), self.inc
                  ), flipflop.flipflop(a), self.load
                ), .allOff, self.reset
              )
        self.load = load
        self.inc = inc
        self.reset = reset
        return out
    }
}
