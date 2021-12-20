import XCTest
@testable import Hardware

final class RegisterTests: XCTestCase {
    func testRegister() throws {
        var register = Register<Bit>()
        let x0 = register.call(1, 1) // 1 (第一引数)を書き込む(第二引数 = 1)。取り出されるのは初期状態の 0
        XCTAssertEqual(Bit.off, x0)
        let x1 = register.call(0, 0) // 前回の 1 を保持(第二引数 = 0)。第一引数の 0 は無視。取り出されるのは前回書き込んだ 1
        XCTAssertEqual(Bit.on, x1)
        let x2 = register.call(0, 1) // 0 を書き込む。取り出されるのは保持してる 1
        XCTAssertEqual(Bit.on, x2)
        let x3 = register.call(1, 0) // 前回の書き込んだ 0 を保持。1 は無視。取り出されるのは前回書き込んだ 0
        XCTAssertEqual(Bit.off, x3)
        let x4 = register.call(0, 0) // 保持。前回と同じ
        XCTAssertEqual(x3, x4)
    }
}
