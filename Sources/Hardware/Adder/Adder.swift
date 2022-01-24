public enum Adder {
    public static func halfAdder(_ a: Bit, _ b: Bit) -> (sum: Bit, carry: Bit) {
        (sum: .xor(a, b), carry: .and(a, b))
    }
    
    public static func fullAdder(_ a: Bit, _ b: Bit, _ c: Bit) -> (sum: Bit, carry: Bit) {
        let (sum1, carry1) = halfAdder(a, b)
        let (sum2, carry2) = halfAdder(sum1, c)
        return (sum: sum2, carry: .or(carry1, carry2))
    }
}
