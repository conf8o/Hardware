public struct FlipFlop<B: BooleanLogic> {
    var state: B = .allOff
    public mutating func flipflop(a: B) -> B {
        defer { state = a }
        return state
    }
}
