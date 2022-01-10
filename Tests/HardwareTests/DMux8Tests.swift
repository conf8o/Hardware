import XCTest
@testable import Hardware

final class DMux8Tests: XCTestCase {
    func testDMux8() throws {
        let (a, b, c, d, e, f, g, h) = DMux8.dmux8(.on, Bit3(bits: (.on, .off, .off)))
        XCTAssertEqual(a, Bit.off)
        XCTAssertEqual(b, Bit.off)
        XCTAssertEqual(c, Bit.off)
        XCTAssertEqual(d, Bit.off)

        XCTAssertEqual(e, Bit.on)
        XCTAssertEqual(f, Bit.off)
        XCTAssertEqual(g, Bit.off)
        XCTAssertEqual(h, Bit.off) 
    }  
}

