import XCTest
@testable import Rubacava

final class UITableViewTests: XCTestCase {
    
    private class MyTableViewCell: UITableViewCell {}
    private class MyHeaderFooterView: UITableViewHeaderFooterView {}
    
    private var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        tableView = UITableView()
        tableView.register(cell: MyTableViewCell.self)
        tableView.register(headerFooter: MyHeaderFooterView.self)
    }
    
    func testDequeueCell() {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell.isKind(of: MyTableViewCell.self))
    }
    
    func testDequeueHeaderFooterView() {
        let headerFooterView: MyHeaderFooterView = tableView.dequeueReusableHeaderFooterView()
        XCTAssertTrue(headerFooterView.isKind(of: MyHeaderFooterView.self))
    }
}
