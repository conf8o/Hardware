import XCTest
@testable import Hardware


extension Bit3: Equatable {
    public static func == (lhs: Bit3, rhs: Bit3) -> Bool {
        return lhs.bits.0 == rhs.bits.0 &&
               lhs.bits.1 == rhs.bits.1 &&
               lhs.bits.2 == rhs.bits.2
    }
}

final class Bit3Tests: XCTestCase {
    func testNand() throws {
        let a = Bit3(bits: (.on, .off, .off))
        let b = Bit3(bits: (.on, .on, .off))
        let expect = Bit3(bits: (.off, .on, .on))
        XCTAssertEqual(expect, Bit3.nand(a, b))
    }
    
    func testXor() throws {
        let a = Bit3(bits: (.on, .off, .off))
        let b = Bit3(bits: (.on, .on, .off))
        let expect = Bit3(bits: (.off, .on, .off))
        XCTAssertEqual(expect, Bit3.xor(a, b))
    }
    
    func testAll() throws {
        let a = Bit3(bits: (.off, .off, .off))
        let b = Bit3(bits: (.off, .off, .off))
        XCTAssertEqual(Bit.on, Bit3.not(Bit3.xor(a, b)).all())
    }
}
