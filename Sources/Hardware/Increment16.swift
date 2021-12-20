public enum Increment16 {
    public static func increment(_ a: Bit16) -> Bit16 {
        Adder16.add(
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
