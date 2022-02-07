import XCTest
@testable import Hardware

func bit16AllOn() -> Bit16 {
    Bit16(
        bits: (
            .on, .on, .on, .on,
            .on, .on, .on, .on,
            .on, .on, .on, .on,
            .on, .on, .on, .on 
        )
    )
}
final class RAM8Tests: XCTestCase {
    func testRAM8() throws {
        var ram = RAM8()
        
        let first = Bit3(bits: (.off, .off, .off))
        var bits = ram.access(bit16AllOn(), first, .on)  // 1111 1111 1111 1111 を0番目のレジスタに書き込み。読み込まれるのは初期値の0000 0000 0000 0000
        XCTAssertEqual(Bit16.allOff, bits)
        bits = ram.access(Bit16.allOff, first, .off) // Bit16.allOffは無視。保持していた1111 1111 1111 1111を取得
        XCTAssertEqual(bit16AllOn(), bits)

        let fourth = Bit3(bits: (.on, .off, .off))
        bits = ram.access(bit16AllOn(), fourth, .on)  // 1111 1111 1111 1111 を4番目のレジスタに書き込み。読み込まれるのは初期値の0000 0000 0000 0000
        XCTAssertEqual(Bit16.allOff, bits)
        bits = ram.access(Bit16.allOff, fourth, .off) // Bit16.allOffは無視。保持していた1111 1111 1111 1111を取得
        XCTAssertEqual(bit16AllOn(), bits)

        bits = ram.access(Bit16.allOff, first, .off) // Bit16.allOffは無視。以前0番目に保持していた1111 1111 1111 1111を取得
        XCTAssertEqual(bit16AllOn(), bits)
    }   
}
