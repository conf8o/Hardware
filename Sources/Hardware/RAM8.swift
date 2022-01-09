public struct RAM8 {
    typealias Register16 = Register<Bit16> 
    
    var registers: (Register16, Register16, Register16, Register16,
                    Register16, Register16, Register16, Register16)

    public mutating func access(_ a: Bit16, _ address: Bit3, _ load: Bit) -> Bit16 {
        defer { self.load = load }
        
        let n = Bit16.mux8(registers.0, registers.1, registers.2, registers.3,
                           registers.4, registers.5, registers.6, registers.7,
                           address)
    }
}