import XCTest
@testable import Rubacava

final class RCImageViewTests: XCTestCase {
    func testContentMode() {
        let imageViewParameters = RCImageView.RCImageViewParameters()
        let imageView = RCImageView(parameters: imageViewParameters)
        XCTAssertEqual(imageView.contentMode, UIView.ContentMode.scaleAspectFill)
    }
    
    func testCornerRadius() {
        let imageViewParameters = RCImageView.RCImageViewParameters(cornerRadius: 10)
        let imageView = RCImageView(parameters: imageViewParameters)
        XCTAssertEqual(imageView.layer.cornerRadius, 10)
    }
}
