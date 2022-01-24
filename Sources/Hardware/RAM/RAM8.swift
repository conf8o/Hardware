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