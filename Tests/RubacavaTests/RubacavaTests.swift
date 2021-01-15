import XCTest
@testable import Rubacava

final class RubacavaTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Rubacava().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
