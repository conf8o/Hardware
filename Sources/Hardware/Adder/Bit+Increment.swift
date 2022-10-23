public protocol Increment: Add {
    static func increment(_ a: Self) -> Self
}

extension Bit15: Increment {
    public static func increment(_ a: Bit15) -> Bit15 {
        Bit15.add(
            a,
            Bit15(
                bits: (
                    .off, .off, .off, .off, .off,
                    .off, .off, .off, .off, .off,
                    .off, .off, .off, .off, .on
                )
            )
        )
    }
}

extension Bit16: Increment {
    public static func increment(_ a: Bit16) -> Bit16 {
        Bit16.add(
            a,
            Bit16(
                bits: (
                    .off, .off, .off, .off,
                    .off, .off, .off, .off,
                    .off, .off, .off, .off,
                    .off, .off, .off, .on
                )
            )
        )
    }
}