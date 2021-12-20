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
}

func assertEqualBitTuple(_ expect: (Bit, Bit), _ actual: (Bit, Bit)) throws {
    XCTAssertEqual(expect.0, actual.0)
    XCTAssertEqual(expect.1, actual.1)
}
