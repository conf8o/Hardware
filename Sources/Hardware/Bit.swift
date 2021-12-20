public enum Bit {
    case off, on
}

extension Bit: BooleanLogic {
    public static func nand(_ a: Bit, _ b: Bit) -> Bit {
        if case (.on, .on) = (a, b) {
            return .off
        } else {
            return .on
        }
    }
}
