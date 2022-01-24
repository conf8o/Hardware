public enum Adder16 {
    public static func add(_ a: Bit16, _ b: Bit16) -> Bit16 {
        let aBits = a.bits
        let bBits = b.bits
        
        let (sum15, carry15) = Adder.halfAdder(aBits.15, bBits.15)
        let (sum14, carry14) = Adder.fullAdder(aBits.14, bBits.14, carry15)
        let (sum13, carry13) = Adder.fullAdder(aBits.13, bBits.13, carry14)
        let (sum12, carry12) = Adder.fullAdder(aBits.12, bBits.12, carry13)
        
        let (sum11, carry11) = Adder.fullAdder(aBits.11, bBits.11, carry12)
        let (sum10, carry10) = Adder.fullAdder(aBits.10, bBits.10, carry11)
        let (sum9, carry9) = Adder.fullAdder(aBits.9, bBits.9, carry10)
        let (sum8, carry8) = Adder.fullAdder(aBits.8, bBits.8, carry9)
        
        let (sum7, carry7) = Adder.fullAdder(aBits.7, bBits.7, carry8)
        let (sum6, carry6) = Adder.fullAdder(aBits.6, bBits.6, carry7)
        let (sum5, carry5) = Adder.fullAdder(aBits.5, bBits.5, carry6)
        let (sum4, carry4) = Adder.fullAdder(aBits.4, bBits.4, carry5)
        
        let (sum3, carry3) = Adder.fullAdder(aBits.3, bBits.3, carry4)
        let (sum2, carry2) = Adder.fullAdder(aBits.2, bBits.2, carry3)
        let (sum1, carry1) = Adder.fullAdder(aBits.1, bBits.1, carry2)
        let (sum0, _) = Adder.fullAdder(aBits.0, bBits.0, carry1)
        
        return Bit16(
            bits: (
                sum0, sum1, sum2, sum3,
                sum4, sum5, sum6, sum7,
                sum8, sum9, sum10, sum11,
                sum12, sum13, sum14, sum15
            )
        )
    }
}
