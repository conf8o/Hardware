public struct Bit2 {
    var bits: (Bit, Bit)
}

extension Bit2: BooleanLogic {
    public func all() -> Bit {
        return Bit.and(bits.0, bits.1)
    }
    
    public static func nand(_ a: Bit2, _ b: Bit2) -> Bit2 {
        Bit2(
            bits: (
                Bit.nand(a.bits.0, b.bits.0), 
                Bit.nand(a.bits.1, b.bits.1)
            )
        )
    }

    public static var allOff: Bit2 { Bit2(bits: (.off, .off)) }
}

public struct Bit3 {
    var bits: (Bit, Bit, Bit)
    public func any() -> Bit {
        return Bit.or(bits.0, Bit.or(bits.1, bits.2))
    }

    public func all() -> Bit {
        return Bit.and(bits.0, Bit.and(bits.1, bits.2))
    }
}

extension Bit3: BooleanLogic, Mux {
    public static func nand(_ a: Bit3, _ b: Bit3) -> Bit3 {
        Bit3(
            bits: (
                Bit.nand(a.bits.0, b.bits.0),
                Bit.nand(a.bits.1, b.bits.1),
                Bit.nand(a.bits.2, b.bits.2)
            )
        )
    }

    public static var allOff = Bit3(
        bits: (.off, .off, .off)
    )

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


public typealias Bit6 = (Bit3, Bit3)
public typealias Bit9 = (Bit3, Bit3, Bit3)
public typealias Bit12 = (Bit3, Bit3, Bit3, Bit3)
public typealias Bit13 = (Bit, Bit3, Bit3, Bit3, Bit3)
public typealias Bit14 = (Bit, Bit, Bit3, Bit3, Bit3, Bit3)
public typealias Bit15 = (Bit3, Bit3, Bit3, Bit3, Bit3)

public struct Bit16 {
    var bits: (
        Bit, Bit, Bit, Bit,
        Bit, Bit, Bit, Bit,
        Bit, Bit, Bit, Bit,
        Bit, Bit, Bit, Bit
    )
}

extension Bit16: BooleanLogic, Mux, Mux4, Mux8 {
    public static func nand(_ a: Bit16, _ b: Bit16) -> Bit16 {
        Bit16(
            bits:(
                Bit.nand(a.bits.0, b.bits.0),
                Bit.nand(a.bits.1, b.bits.1),
                Bit.nand(a.bits.2, b.bits.2),
                Bit.nand(a.bits.3, b.bits.3),
            
                Bit.nand(a.bits.4, b.bits.4),
                Bit.nand(a.bits.5, b.bits.5),
                Bit.nand(a.bits.6, b.bits.6),
                Bit.nand(a.bits.7, b.bits.7),
            
                Bit.nand(a.bits.8, b.bits.8),
                Bit.nand(a.bits.9, b.bits.9),
                Bit.nand(a.bits.10, b.bits.10),
                Bit.nand(a.bits.11, b.bits.11),
            
                Bit.nand(a.bits.12, b.bits.12),
                Bit.nand(a.bits.13, b.bits.13),
                Bit.nand(a.bits.14, b.bits.14),
                Bit.nand(a.bits.15, b.bits.15)
            )
        )
    }
    
    public static var allOff = Bit16(
        bits: (
            .off, .off, .off, .off,
            .off, .off, .off, .off,
            .off, .off, .off, .off,
            .off, .off, .off, .off
        )
    )

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
