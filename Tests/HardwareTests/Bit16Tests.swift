import XCTest
@testable import Hardware

extension Bit16: Equatable {
    public static func == (lhs: Bit16, rhs: Bit16) -> Bool {
        let l = lhs.bits
        let r = rhs.bits
        return (l.0 == r.0 &&
                l.1 == r.1 &&
                l.2 == r.2 &&
                l.3 == r.3 &&
                
                l.4 == r.4 &&
                l.5 == r.5 &&
                l.6 == r.6 &&
                l.7 == r.7 &&
                
                l.8 == r.8 &&
                l.9 == r.9 &&
                l.10 == r.10 &&
                l.11 == r.11 &&
                
                l.12 == r.12 &&
                l.13 == r.13 &&
                l.14 == r.14 &&
                l.15 == r.15)
    }
}

final class Bit16NandTests: XCTestCase {
    func testNand() throws {
        let a = Bit16(bits: (.off, .off, .on, .on,
                             .off, .off, .off, .off,
                             .off, .off, .off, .off,
                             .off, .off, .off, .off))
        let b = Bit16(bits: (.off, .on, .off, .on,
                             .off, .off, .off, .off,
                             .off, .off, .off, .off,
                             .off, .off, .off, .off))
        let expect = Bit16(bits: (.on, .on, .on, .off,
                                  .on, .on, .on, .on,
                                  .on, .on, .on, .on,
                                  .on, .on, .on, .on))
        XCTAssertEqual(expect, Bit16.nand(a, b))
    }
    
    func testXor() throws {
        let a = Bit16(bits: (.off, .off, .on, .on,
                             .off, .off, .off, .off,
                             .off, .off, .off, .off,
                             .off, .off, .off, .off))
        let b = Bit16(bits: (.off, .on, .off, .on,
                             .off, .off, .off, .off,
                             .off, .off, .off, .off,
                             .off, .off, .off, .off))
        let expect = Bit16(bits: (.off, .on, .on, .off,
                                  .off, .off, .off, .off,
                                  .off, .off, .off, .off,
                                  .off, .off, .off, .off))
        XCTAssertEqual(expect, Bit16.xor(a, b))
    }
}
