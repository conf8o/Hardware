import XCTest
@testable import Hardware

func bit3(_ a: Bit, _ b: Bit, _ c: Bit) -> Bit3 { Bit3(bits: (a, b, c)) }

func bit9(
    _ a: Bit, _ b: Bit, _ c: Bit,
    _ d: Bit, _ e: Bit, _ f: Bit,
    _ g: Bit, _ h: Bit, _ i: Bit
) -> Bit9 {
    Bit9(bit3(a, b, c), bit3(d, e, f), bit3(g, h, i))
}

final class RAM512Tests: XCTestCase {
    func testRAM512() throws {
        var ram = RAM512()

        let first = bit9(.off, .off, .off,
                         .off, .off, .off,
                         .off, .off, .off) /// 000 000 000 (最初の3bitsはRAM64のアドレス、二番目の3bitsはRAM8のアドレス、三番目の3bitsはregisterのアドレス)
        var bits = ram.access(bit16AllOn(), first, .on)  // 1111 1111 1111 1111 を0番目のレジスタに書き込み。読み込まれるのは初期値の0000 0000 0000 0000
        XCTAssertEqual(Bit16.allOff, bits)
        bits = ram.access(Bit16.allOff, first, .off) // Bit16.allOffは無視。保持していた1111 1111 1111 1111を取得
        XCTAssertEqual(bit16AllOn(), bits)

        let address = bit9(.on, .off, .off,
                          .on, .off, .on,
                          .on, .on, .off) // 4番目のRAM64, 5番目のRAM8, 6番目のregister

        bits = ram.access(bit16AllOn(), address, .on)  // 1111 1111 1111 1111 を上記のレジスタに書き込み。読み込まれるのは初期値の0000 0000 0000 0000
        XCTAssertEqual(Bit16.allOff, bits)
        bits = ram.access(Bit16.allOff, address, .off) // Bit16.allOffは無視。保持していた1111 1111 1111 1111を取得
        XCTAssertEqual(bit16AllOn(), bits)

        bits = ram.access(Bit16.allOff, first, .off) // Bit16.allOffは無視。以前0番目に保持していた1111 1111 1111 1111を取得
        XCTAssertEqual(bit16AllOn(), bits)
    }
}
