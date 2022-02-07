public struct RAM8 {
    typealias Register16 = Register<Bit16> 
    
    private var registers = (
        Register16(), Register16(), Register16(), Register16(),
        Register16(), Register16(), Register16(), Register16()
    )

    public mutating func access(_ a: Bit16, _ address: Bit3, _ load: Bit) -> Bit16 {
        let loadBits = Bit.dmux8(load, address)
        return Bit16.mux8(
            registers.0.access(a, loadBits.a), 
            registers.1.access(a, loadBits.b), 
            registers.2.access(a, loadBits.c), 
            registers.3.access(a, loadBits.d),
            registers.4.access(a, loadBits.e),
            registers.5.access(a, loadBits.f), 
            registers.6.access(a, loadBits.g), 
            registers.7.access(a, loadBits.h),
            address
        )
    }
}

public struct RAM64 {
    private var memories = (
        RAM8(), RAM8(), RAM8(), RAM8(), 
        RAM8(), RAM8(), RAM8(), RAM8()
    )

    public mutating func access(_ a: Bit16, _ address: Bit6, _ load: Bit) -> Bit16 {
        // Bit6の上位3桁をRAM8用に、下位3桁をRegister用に。
        let address8 = address.0
        let addressR = address.1
        
        let loadBits = Bit.dmux8(load, address8)
        return Bit16.mux8(
            memories.0.access(a, addressR, loadBits.a),
            memories.1.access(a, addressR, loadBits.b),
            memories.2.access(a, addressR, loadBits.c),
            memories.3.access(a, addressR, loadBits.d),
            memories.4.access(a, addressR, loadBits.e),
            memories.5.access(a, addressR, loadBits.f),
            memories.6.access(a, addressR, loadBits.g),
            memories.7.access(a, addressR, loadBits.h),
            address8
        )

    }
}

public struct RAM512 {
    private var memories = (
        RAM64(), RAM64(), RAM64(), RAM64(),
        RAM64(), RAM64(), RAM64(), RAM64()
    )

    public mutating func access(_ a: Bit16, _ address: Bit9, _ load: Bit) -> Bit16 {
        let address64 = address.0
        let addressInner = Bit6(address.1, address.2)
        
        let loadBits = Bit.dmux8(load, address64)
        return Bit16.mux8(
            memories.0.access(a, addressInner, loadBits.a),
            memories.1.access(a, addressInner, loadBits.b),
            memories.2.access(a, addressInner, loadBits.c),
            memories.3.access(a, addressInner, loadBits.d),
            memories.4.access(a, addressInner, loadBits.e),
            memories.5.access(a, addressInner, loadBits.f),
            memories.6.access(a, addressInner, loadBits.g),
            memories.7.access(a, addressInner, loadBits.h),
            address64
        )
    }
}

public struct RAM4k {
    private var memories = (
        RAM512(), RAM512(), RAM512(), RAM512(),
        RAM512(), RAM512(), RAM512(), RAM512()
    )

    public mutating func access(_ a: Bit16, _ address: Bit12, _ load: Bit) -> Bit16 {
        let address512 = address.0
        let addressInner = Bit9(address.1, address.2, address.3)
        
        let loadBits = Bit.dmux8(load, address512)
        return Bit16.mux8(
            memories.0.access(a, addressInner, loadBits.a),
            memories.1.access(a, addressInner, loadBits.b),
            memories.2.access(a, addressInner, loadBits.c),
            memories.3.access(a, addressInner, loadBits.d),
            memories.4.access(a, addressInner, loadBits.e),
            memories.5.access(a, addressInner, loadBits.f),
            memories.6.access(a, addressInner, loadBits.g),
            memories.7.access(a, addressInner, loadBits.h),
            address512
        )
    }
}

public struct RAM16k {
    private var memories = (
        RAM4k(), RAM4k(), RAM4k(), RAM4k()
    )

    public mutating func access(_ a: Bit16, _ address: Bit14, _ load: Bit) -> Bit16 {
        let address4k = Bit2(bits:(address.0, address.1))
        let addressInner = Bit12(address.2, address.3, address.4, address.5)

        let loadBits = Bit.dmux4(load, address4k)
        return Bit16.mux4(
            memories.0.access(a, addressInner, loadBits.a),
            memories.1.access(a, addressInner, loadBits.b),
            memories.2.access(a, addressInner, loadBits.c),
            memories.3.access(a, addressInner, loadBits.d),
            address4k
        )
    }
}