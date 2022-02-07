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
        let address8 = address.bit3s.0
        let addressR = address.bit3s.1
        
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
        let address64 = address.bit3s.0
        let addressInner = Bit6(bit3s: (address.bit3s.1, address.bit3s.2))
        
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