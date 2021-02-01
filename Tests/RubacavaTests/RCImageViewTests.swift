import XCTest
@testable import Rubacava

final class RCImageViewTests: XCTestCase {
    func testContentMode() {
        let imageView = RCImageView()
        XCTAssertEqual(imageView.contentMode, UIView.ContentMode.scaleAspectFill)
    }
    
    func testCornerRadius() {
        let imageView = RCImageView(cornerRadius: 10)
        XCTAssertEqual(imageView.layer.cornerRadius, 10)
    }
}
