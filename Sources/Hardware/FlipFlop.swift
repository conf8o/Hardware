public struct FlipFlop<B: BooleanLogic> {
    var state: B = .allOff
    public mutating func flipflop(_ a: B) -> B {
        defer { state = a }
        return state
    }
}
