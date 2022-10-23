import XCTest
@testable import Hardware

final class AdderTests: XCTestCase {
    func testHalfAdder() throws {
        try assertEqualBitTuple((0, 0), Adder.halfAdder(0, 0))
        try assertEqualBitTuple((1, 0), Adder.halfAdder(0, 1))
        try assertEqualBitTuple((1, 0), Adder.halfAdder(1, 0))
        try assertEqualBitTuple((0, 1), Adder.halfAdder(1, 1))
    }
    
    func testFullAdder() throws {
        try assertEqualBitTuple((0, 0), Adder.fullAdder(0, 0, 0))
        try assertEqualBitTuple((1, 0), Adder.fullAdder(0, 0, 1))
        try assertEqualBitTuple((1, 0), Adder.fullAdder(0, 1, 0))
        try assertEqualBitTuple((0, 1), Adder.fullAdder(0, 1, 1))
        try assertEqualBitTuple((1, 0), Adder.fullAdder(1, 0, 0))
        try assertEqualBitTuple((0, 1), Adder.fullAdder(1, 0, 1))
        try assertEqualBitTuple((0, 1), Adder.fullAdder(1, 1, 0))
        try assertEqualBitTuple((1, 1), Adder.fullAdder(1, 1, 1))
    }

    func testAdd() throws {
        // 0111 1110 0100 0011
        // 32323
        let a = Bit16(bits: (.off, .on, .on, .on,
                             .on, .on, .on, .off,
                             .off, .on, .off, .off,
                             .off, .off, .on, .on))
        
        // 0011 0111 0011 1101
        // 14141
        let b = Bit16(bits: (.off, .off, .on, .on,
                             .off, .on, .on, .on,
                             .off, .off, .on, .on,
                             .on, .on, .off, .on))
        
        // 1011 0101 1000 0000
        // 46464
        let expect = Bit16(bits: (.on, .off, .on, .on,
                                  .off, .on, .off, .on,
                                  .on, .off, .off, .off,
                                  .off, .off, .off, .off))
        
        XCTAssertEqual(expect, Bit16.add(a, b))
    }

    func testIncrement() throws {
        let a = Bit16(bits: (.off, .on, .on, .on,
                             .on, .on, .on, .on,
                             .on, .on, .on, .on,
                             .on, .on, .on, .on))

        let expect = Bit16(bits: (.on, .off, .off, .off,
                                  .off, .off, .off, .off,
                                  .off, .off, .off, .off,
                                  .off, .off, .off, .off))
        
        XCTAssertEqual(expect, Bit16.increment(a))
    }
}

func assertEqualBitTuple(_ expect: (Bit, Bit), _ actual: (Bit, Bit)) throws {
    XCTAssertEqual(expect.0, actual.0)
    XCTAssertEqual(expect.1, actual.1)
}
