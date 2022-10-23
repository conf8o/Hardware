import XCTest
@testable import Hardware

extension Bit: ExpressibleByIntegerLiteral {
    public init(integerLiteral b: Int) {
        self = (b == 0 ? .off : .on)
    }
}

final class BitTests: XCTestCase {
    func testNand() throws {
        XCTAssertEqual(1, Bit.nand(0, 0))
        XCTAssertEqual(1, Bit.nand(0, 1))
        XCTAssertEqual(1, Bit.nand(1, 0))
        XCTAssertEqual(0, Bit.nand(1, 1))
    }
    
    func testNot() throws {
        XCTAssertEqual(1, Bit.not(0))
        XCTAssertEqual(0, Bit.not(1))
    }
    
    func testAnd() throws {
        XCTAssertEqual(0, Bit.and(0, 0))
        XCTAssertEqual(0, Bit.and(0, 1))
        XCTAssertEqual(0, Bit.and(1, 0))
        XCTAssertEqual(1, Bit.and(1, 1))
    }
    
    func testOr() throws {
        XCTAssertEqual(0, Bit.or(0, 0))
        XCTAssertEqual(1, Bit.or(0, 1))
        XCTAssertEqual(1, Bit.or(1, 0))
        XCTAssertEqual(1, Bit.or(1, 1))
    }
    
    func testXor() throws {
        XCTAssertEqual(0, Bit.xor(0, 0))
        XCTAssertEqual(1, Bit.xor(0, 1))
        XCTAssertEqual(1, Bit.xor(1, 0))
        XCTAssertEqual(0, Bit.xor(1, 1))
    }
    
    func testMux() throws {
        XCTAssertEqual(0, Bit.mux(0, 0, 0))
        XCTAssertEqual(0, Bit.mux(0, 1, 0))
        XCTAssertEqual(1, Bit.mux(1, 0, 0))
        XCTAssertEqual(1, Bit.mux(1, 1, 0))
        XCTAssertEqual(0, Bit.mux(0, 0, 1))
        XCTAssertEqual(1, Bit.mux(0, 1, 1))
        XCTAssertEqual(0, Bit.mux(1, 0, 1))
        XCTAssertEqual(1, Bit.mux(1, 1, 1))
    }
    
    func testDMux() throws {
        XCTAssertEqual(0, Bit.dmux(0, 0).0)
        XCTAssertEqual(0, Bit.dmux(0, 0).1)
        XCTAssertEqual(0, Bit.dmux(0, 1).0)
        XCTAssertEqual(0, Bit.dmux(0, 1).1)
        XCTAssertEqual(1, Bit.dmux(1, 0).0)
        XCTAssertEqual(0, Bit.dmux(1, 0).1)
        XCTAssertEqual(0, Bit.dmux(1, 1).0)
        XCTAssertEqual(1, Bit.dmux(1, 1).1)
    }

    func testMux8() throws {

        XCTAssertEqual(1, Bit.mux8(0, 0, 0, 1, 0, 0, 0, 1, Bit3(bits: (0, 0, 0))))
        XCTAssertEqual(0, Bit.mux8(0, 0, 0, 1, 0, 0, 0, 1, Bit3(bits: (0, 0, 1))))
        XCTAssertEqual(0, Bit.mux8(0, 0, 0, 1, 0, 0, 0, 1, Bit3(bits: (0, 1, 0))))
        XCTAssertEqual(0, Bit.mux8(0, 0, 0, 1, 0, 0, 0, 1, Bit3(bits: (0, 1, 1))))
        XCTAssertEqual(1, Bit.mux8(0, 0, 0, 1, 0, 0, 0, 1, Bit3(bits: (1, 0, 0))))
        XCTAssertEqual(0, Bit.mux8(0, 0, 0, 1, 0, 0, 0, 1, Bit3(bits: (1, 0, 1))))
        XCTAssertEqual(0, Bit.mux8(0, 0, 0, 1, 0, 0, 0, 1, Bit3(bits: (1, 1, 0))))
        XCTAssertEqual(0, Bit.mux8(0, 0, 0, 1, 0, 0, 0, 1, Bit3(bits: (1, 1, 1))))
    }

    func testDMux8() throws {
        let (a, b, c, d, e, f, g, h) = Bit.dmux8(.on, Bit3(bits: (.on, .off, .off)))
        XCTAssertEqual(0, a)
        XCTAssertEqual(0, b)
        XCTAssertEqual(0, c)
        XCTAssertEqual(0, d)
        XCTAssertEqual(1, e)
        XCTAssertEqual(0, f)
        XCTAssertEqual(0, g)
        XCTAssertEqual(0, h) 
    }  
}
