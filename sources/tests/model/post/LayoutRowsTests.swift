@testable import TumblrNPF
import XCTest

final class LayoutRowsTests: XCTestCase
{
    private let layoutRows = """
        {
            "type": "rows",
            "display": [
                {"blocks": [0, 1]},
                {"blocks": [2]}
            ]
        }
        """

    func testLayoutRows() {
        let jsonData = layoutRows.data(using: .utf8)!
        let layout = try! JSONDecoder().decode(Layout.self, from: jsonData)
        guard case Layout.rows(let rowsLayout) = layout else {
            XCTFail("Expected Layout.rows")
            return
        }
        XCTAssertEqual(rowsLayout.type, "rows")
        XCTAssertNil(rowsLayout.truncateAfter)
        XCTAssertEqual(rowsLayout.display[0].blocks, [0,1])
        XCTAssertEqual(rowsLayout.display[0].mode, RowLayoutMode(type: "weighted"))
        XCTAssertEqual(rowsLayout.display[1].blocks, [2])
        XCTAssertEqual(rowsLayout.display[1].mode, RowLayoutMode(type: "weighted"))

        let expectedLayout = Layout.rows(
            RowsLayout(
                display: [
                    RowLayout(blocks: [0,1], mode: RowLayoutMode(type: "weighted")),
                    RowLayout(blocks: [2], mode: RowLayoutMode(type: "weighted"))
                ],
                truncateAfter: nil,
                type: "rows"
            )
        )
        XCTAssertEqual(layout, expectedLayout)
    }
}
