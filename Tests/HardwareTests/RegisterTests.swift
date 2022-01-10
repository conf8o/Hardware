import XCTest
@testable import Hardware

final class RegisterTests: XCTestCase {
    func testRegister() throws {
        var register = Register<Bit>()
        let x0 = register.access(1, 1) // 1 (第一引数)を書き込む(第二引数 = 1)。取り出されるのは初期状態の 0
        XCTAssertEqual(Bit.off, x0)
        let x1 = register.access(0, 0) // 前回の 1 を保持(第二引数 = 0)。第一引数の 0 は無視。取り出されるのは前回書き込んだ 1
        XCTAssertEqual(Bit.on, x1)
        let x2 = register.access(0, 1) // 0 を書き込む。取り出されるのは保持してる 1
        XCTAssertEqual(Bit.on, x2)
        let x3 = register.access(1, 0) // 前回の書き込んだ 0 を保持。1 は無視。取り出されるのは前回書き込んだ 0
        XCTAssertEqual(Bit.off, x3)
        let x4 = register.access(0, 0) // 保持。前回と同じ
        XCTAssertEqual(x3, x4)
    }

    func testRegister3() throws {
        var register = Register<Bit3>()
        let four = Bit3(bits: (1, 0, 0))
        let seven = Bit3(bits: (1, 1, 1))
        let x0 = register.access(four, 1) // 100 (第一引数)を書き込む(第二引数 = 1)。取り出されるのは初期状態の 000
        XCTAssertEqual(Bit3.allOff, x0)
        var x1 = register.access(Bit3.allOff, 0) // 前回の 100 を保持(第二引数 = 0)。第一引数の 0 は無視。取り出されるのは前回書き込んだ 1
        XCTAssertEqual(four, x1)
        x1 = register.access(Bit3.allOff, 0) // 連続での保持を確認
        XCTAssertEqual(four, x1)

        let x2 = register.access(Bit3.allOff, 1) // 000 を書き込む。取り出されるのは保持してる 100
        XCTAssertEqual(four, x2)
        let x3 = register.access(seven, 0) // 前回の書き込んだ 000 を保持。111 は無視。取り出されるのは前回書き込んだ 000
        XCTAssertEqual(Bit3.allOff, x3)
        let x4 = register.access(Bit3.allOff, 0) // 保持。前回と同じ
        XCTAssertEqual(x3, x4)
    }
}
