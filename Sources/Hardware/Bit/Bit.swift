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
    
    public static var allOff: Bit = .off
}

public struct Bit2: BooleanLogic {
    var bits: (Bit, Bit)

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

public struct Bit3: BooleanLogic {
    var bits: (Bit, Bit, Bit)

    public func any() -> Bit {
        return Bit.or(bits.0, Bit.or(bits.1, bits.2))
    }

    public func all() -> Bit {
        return Bit.and(bits.0, Bit.and(bits.1, bits.2))
    }

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
}


public struct Bit6: BooleanLogic {
    var bit3s: (Bit3, Bit3)
    init(bit3s: (Bit3, Bit3)) {
        self.bit3s = bit3s
    }
    init(bits: (Bit, Bit, Bit, Bit, Bit, Bit)) {
        bit3s = (
            Bit3(bits: (bits.0, bits.1, bits.2)),
            Bit3(bits: (bits.3, bits.4, bits.5))
        )
    }

    public func any() -> Bit {
        return Bit.or(bit3s.0.any(), bit3s.1.any())
    }

    public func all() -> Bit {
        return Bit.and(bit3s.0.all(), bit3s.1.all())
    }

    public static func nand(_ a: Bit6, _ b: Bit6) -> Bit6 {
        Bit6(
            bit3s: (
                Bit3.nand(a.bit3s.0, b.bit3s.0),
                Bit3.nand(a.bit3s.1, b.bit3s.1)
            )
        )
    }

    public static var allOff: Bit6 { 
        Bit6(
            bit3s: (Bit3.allOff, Bit3.allOff)
        )
    }
}

public typealias Bit9 = (Bit3, Bit3, Bit3)
public typealias Bit12 = (Bit3, Bit3, Bit3, Bit3)
public typealias Bit13 = (Bit, Bit3, Bit3, Bit3, Bit3)
public typealias Bit14 = (Bit, Bit, Bit3, Bit3, Bit3, Bit3)

public struct Bit15: BooleanLogic {
    var bits: (
        Bit, Bit, Bit,
        Bit, Bit, Bit,
        Bit, Bit, Bit,
        Bit, Bit, Bit,
        Bit, Bit, Bit
    )

    public static func nand(_ a: Bit15, _ b: Bit15) -> Bit15 {
        Bit15(
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
                Bit.nand(a.bits.14, b.bits.14)
            )
        )
    }
    
    public static var allOff = Bit15(
        bits: (
            .off, .off, .off, .off,
            .off, .off, .off, .off,
            .off, .off, .off, .off,
            .off, .off, .off
        )
    )
}

public struct Bit16: BooleanLogic {
    var bits: (
        Bit, Bit, Bit, Bit,
        Bit, Bit, Bit, Bit,
        Bit, Bit, Bit, Bit,
        Bit, Bit, Bit, Bit
    )

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
}
