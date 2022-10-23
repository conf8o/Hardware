public protocol Mux: BooleanLogic {
    static func mux(_ a: Self, _ b: Self, _ sel: Bit) -> Self
}

public protocol Mux4: BooleanLogic {
    static func mux4(
        _ a: Self, _ b: Self, _ c: Self, _ d: Self, _ sel: Bit2
    ) -> Self
}

public protocol Mux8: BooleanLogic {
    static func mux8(
        _ a: Self, _ b: Self, _ c: Self, _ d: Self,
        _ e: Self, _ f: Self, _ g: Self, _ h: Self,
        _ sel: Bit3
    ) -> Self
}

public protocol DMux: BooleanLogic {
    static func dmux(_ a: Self, _ sel: Bit) -> (a: Self, b: Self)
}

public protocol DMux4: BooleanLogic {
    static func dmux4(
        _ a: Self, _ sel: Bit2
    ) -> (
        a: Self, b: Self, c: Self, d: Self
    )
}

public protocol DMux8: BooleanLogic {
    static func dmux8(
        _ a: Self, _ sel: Bit3
    ) -> (
        a: Self, b: Self, c: Self, d: Self, 
        e: Self, f: Self, g: Self, h: Self
    )
}

extension Bit: Mux, DMux, DMux4, Mux8, DMux8 {
    public static func mux(_ a: Bit, _ b: Bit, _ sel: Bit) -> Bit {
        Bit.xor(Bit.and(a, Bit.not(sel)),
                Bit.and(b, sel))
    }
    
    public static func dmux(_ a: Bit, _ sel: Bit) -> (a: Bit, b: Bit) {
        (a: Bit.and(a, Bit.not(sel)), b: Bit.and(a, sel))
    }

    public static func dmux4(_ a: Bit, _ sel: Bit2) -> (a: Bit, b: Bit, c: Bit, d: Bit) {
        (
            a: Bit.and(a, Bit2.xnor(sel, Bit2(bits: (.off, .off))).all()),
            b: Bit.and(a, Bit2.xnor(sel, Bit2(bits: (.off, .on))).all()),
            c: Bit.and(a, Bit2.xnor(sel, Bit2(bits: (.on, .off))).all()),
            d: Bit.and(a, Bit2.xnor(sel, Bit2(bits: (.on, .on))).all())
        )
    }

    public static func mux8(_ a: Bit, _ b: Bit, _ c: Bit, _ d: Bit, _ e: Bit, _ f: Bit, _ g: Bit, _ h: Bit, _ sel: Bit3)
    -> Bit
    {
        Bit.mux(
         Bit.mux(
          Bit.mux(
           Bit.mux(
            Bit.mux(
             Bit.mux(
              Bit.mux(
               h, g, Bit3.xnor(Bit3(bits: (.on, .on, .off)), sel).all()
              ), f, Bit3.xnor(Bit3(bits: (.on, .off, .on)), sel).all()
             ), e, Bit3.xnor(Bit3(bits: (.on, .off, .off)), sel).all()
            ), d, Bit3.xnor(Bit3(bits: (.off, .on, .on)), sel).all()
           ), c, Bit3.xnor(Bit3(bits: (.off, .on, .off)), sel).all()
          ), b, Bit3.xnor(Bit3(bits: (.off, .off, .on)), sel).all()
         ), a, Bit3.xnor(Bit3(bits: (.off, .off, .off)), sel).all()
        )
    }
    
    public static func dmux8(_ a: Bit, _ sel: Bit3) 
    -> (a: Bit, b: Bit, c: Bit, d: Bit, e: Bit, f: Bit, g: Bit, h: Bit)
    {
        (
            a: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.off, .off, .off))).all()),
            b: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.off, .off, .on))).all()),
            c: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.off, .on, .off))).all()),
            d: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.off, .on, .on))).all()),
            e: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.on, .off, .off))).all()),
            f: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.on, .off, .on))).all()),
            g: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.on, .on, .off))).all()),
            h: Bit.and(a, Bit3.xnor(sel, Bit3(bits: (.on, .on, .on))).all())
        )
    }
}

extension Bit3: Mux {
    public static func mux(_ a: Bit3, _ b: Bit3, _ sel: Bit) -> Bit3 {
        Bit3(
            bits: (
                Bit.mux(a.bits.0, b.bits.0, sel),
                Bit.mux(a.bits.1, b.bits.1, sel),
                Bit.mux(a.bits.2, b.bits.2, sel)
            )
        )
    }
}

extension Bit15: Mux, Mux4, Mux8 {
    public static func mux(_ a: Bit15, _ b: Bit15, _ sel: Bit) -> Bit15 {
        Bit15(
            bits: (
                Bit.mux(a.bits.0, b.bits.0, sel), Bit.mux(a.bits.1, b.bits.1, sel),
                Bit.mux(a.bits.2, b.bits.2, sel), Bit.mux(a.bits.3, b.bits.3, sel),
                Bit.mux(a.bits.4, b.bits.4, sel), Bit.mux(a.bits.5, b.bits.5, sel),
                Bit.mux(a.bits.6, b.bits.6, sel), Bit.mux(a.bits.7, b.bits.7, sel),
                Bit.mux(a.bits.8, b.bits.8, sel), Bit.mux(a.bits.9, b.bits.9, sel),
                Bit.mux(a.bits.10, b.bits.10, sel), Bit.mux(a.bits.11, b.bits.11, sel),
                Bit.mux(a.bits.12, b.bits.12, sel), Bit.mux(a.bits.13, b.bits.13, sel),
                Bit.mux(a.bits.14, b.bits.14, sel)
            )
            
        )
    }

    public static func mux4(_ a: Bit15, _ b: Bit15, _ c: Bit15, _ d: Bit15, _ sel: Bit2) -> Bit15 {
        Bit15.mux(
          Bit15.mux(
            Bit15.mux(
              d, c, Bit2.xnor(Bit2(bits: (.on, .off)), sel).all()
            ), b, Bit2.xnor(Bit2(bits: (.off, .on)), sel).all()
          ), a, Bit2.xnor(Bit2(bits: (.off, .off)), sel).all()
        )
    }

    public static func mux8(
        _ a: Bit15, _ b: Bit15, _ c: Bit15, _ d: Bit15,
        _ e: Bit15, _ f: Bit15, _ g: Bit15, _ h: Bit15,
        _ sel: Bit3
    ) -> Bit15 {
        Bit15.mux(
         Bit15.mux(
          Bit15.mux(
           Bit15.mux(
            Bit15.mux(
             Bit15.mux(
              Bit15.mux(
               h, g, Bit3.xnor(Bit3(bits: (.on, .on, .off)), sel).all()
              ), f, Bit3.xnor(Bit3(bits: (.on, .off, .on)), sel).all()
             ), e, Bit3.xnor(Bit3(bits: (.on, .off, .off)), sel).all()
            ), d, Bit3.xnor(Bit3(bits: (.off, .on, .on)), sel).all()
           ), c, Bit3.xnor(Bit3(bits: (.off, .on, .off)), sel).all()
          ), b, Bit3.xnor(Bit3(bits: (.off, .off, .on)), sel).all()
         ), a, Bit3.xnor(Bit3(bits: (.off, .off, .off)), sel).all()
        )
    }
}

extension Bit16: Mux, Mux4, Mux8 {
    public static func mux(_ a: Bit16, _ b: Bit16, _ sel: Bit) -> Bit16 {
        Bit16(
            bits: (
                Bit.mux(a.bits.0, b.bits.0, sel), Bit.mux(a.bits.1, b.bits.1, sel),
                Bit.mux(a.bits.2, b.bits.2, sel), Bit.mux(a.bits.3, b.bits.3, sel),
                Bit.mux(a.bits.4, b.bits.4, sel), Bit.mux(a.bits.5, b.bits.5, sel),
                Bit.mux(a.bits.6, b.bits.6, sel), Bit.mux(a.bits.7, b.bits.7, sel),
                Bit.mux(a.bits.8, b.bits.8, sel), Bit.mux(a.bits.9, b.bits.9, sel),
                Bit.mux(a.bits.10, b.bits.10, sel), Bit.mux(a.bits.11, b.bits.11, sel),
                Bit.mux(a.bits.12, b.bits.12, sel), Bit.mux(a.bits.13, b.bits.13, sel),
                Bit.mux(a.bits.14, b.bits.14, sel), Bit.mux(a.bits.15, b.bits.15, sel)
            )
            
        )
    }

    public static func mux4(_ a: Bit16, _ b: Bit16, _ c: Bit16, _ d: Bit16, _ sel: Bit2) -> Bit16 {
        Bit16.mux(
          Bit16.mux(
            Bit16.mux(
              d, c, Bit2.xnor(Bit2(bits: (.on, .off)), sel).all()
            ), b, Bit2.xnor(Bit2(bits: (.off, .on)), sel).all()
          ), a, Bit2.xnor(Bit2(bits: (.off, .off)), sel).all()
        )
    }

    public static func mux8(
        _ a: Bit16, _ b: Bit16, _ c: Bit16, _ d: Bit16,
        _ e: Bit16, _ f: Bit16, _ g: Bit16, _ h: Bit16,
        _ sel: Bit3
    ) -> Bit16 {
        Bit16.mux(
         Bit16.mux(
          Bit16.mux(
           Bit16.mux(
            Bit16.mux(
             Bit16.mux(
              Bit16.mux(
               h, g, Bit3.xnor(Bit3(bits: (.on, .on, .off)), sel).all()
              ), f, Bit3.xnor(Bit3(bits: (.on, .off, .on)), sel).all()
             ), e, Bit3.xnor(Bit3(bits: (.on, .off, .off)), sel).all()
            ), d, Bit3.xnor(Bit3(bits: (.off, .on, .on)), sel).all()
           ), c, Bit3.xnor(Bit3(bits: (.off, .on, .off)), sel).all()
          ), b, Bit3.xnor(Bit3(bits: (.off, .off, .on)), sel).all()
         ), a, Bit3.xnor(Bit3(bits: (.off, .off, .off)), sel).all()
        )
    }
}