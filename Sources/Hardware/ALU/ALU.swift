public enum ALU {
    static func prepare(_ a: Bit16, _ zero: Bit, _ neg: Bit) -> Bit16 {
        let _a = Bit16.mux(a, Bit16.allOff, zero)
        return Bit16.mux(_a, Bit16.not(_a), neg)
    }
    
    public static func call(
        _ x: Bit16, _ y: Bit16,
        _ zeroX: Bit, _ negX: Bit,
        _ zeroY: Bit, _ negY: Bit,
        _ f: Bit, // .on is "add", .off is "and"
        _ negO: Bit
    ) -> (out: Bit16, zero: Bit, neg: Bit) {
        let _x = ALU.prepare(x, zeroX, negX)
        let _y = ALU.prepare(y, zeroY, negY)
        var out = Bit16.mux(Adder16.add(_x, _y), Bit16.and(_x, _y), f)
        out = Bit16.mux(out, Bit16.not(out), negO)
        
        return (
            out: out,
            zero: Bit.not(
                Bit.or(out.bits.0,
                 Bit.or(out.bits.1,
                  Bit.or(out.bits.2,
                   Bit.or(out.bits.3,
                    Bit.or(out.bits.4,
                     Bit.or(out.bits.5,
                      Bit.or(out.bits.6,
                       Bit.or(out.bits.7,
                        Bit.or(out.bits.8,
                         Bit.or(out.bits.9,
                          Bit.or(out.bits.10,
                           Bit.or(out.bits.11,
                            Bit.or(out.bits.12,
                             Bit.or(out.bits.13,
                              Bit.or(out.bits.14,
                                     out.bits.15)))))))))))))))
            ),
            neg: out.bits.0
        )
    }
}
