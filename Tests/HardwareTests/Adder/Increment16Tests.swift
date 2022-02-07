import XCTest
@testable import Hardware

final class Increment16Tests: XCTestCase {
    func testIncrement16() throws {
        let a = Bit16(bits: (.off, .on, .on, .on,
                             .on, .on, .on, .on,
                             .on, .on, .on, .on,
                             .on, .on, .on, .on))

        let expect = Bit16(bits: (.on, .off, .off, .off,
                                  .off, .off, .off, .off,
                                  .off, .off, .off, .off,
                                  .off, .off, .off, .off))
        
        XCTAssertEqual(expect, Increment16.increment(a))
    }
}
