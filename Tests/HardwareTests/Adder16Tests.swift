import XCTest
@testable import Hardware

final class Adder16Tests: XCTestCase {
    func testAdder16() throws {
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
        
        XCTAssertEqual(expect, Adder16.add(a, b))
    }
}
