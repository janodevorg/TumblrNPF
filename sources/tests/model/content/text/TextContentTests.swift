@testable import TumblrNPF
import XCTest

final class TextContentTests: XCTestCase
{
    func testTextContent() throws {
        try decode("TextContent")
    }
    func testChat() throws {
        try decode("TextContent_Subtype_chat")
    }
    func testHeading1() throws {
        try decode("TextContent_Subtype_heading1")
    }
    func testHeading2() throws {
        try decode("TextContent_Subtype_heading2")
    }
    func testIndented() throws {
        try decode("TextContent_Subtype_indented")
    }
    func testOrderedListItem() throws {
        try decode("TextContent_Subtype_ordered-list-item")
    }
    func testUnorderedListItem() throws {
        try decode("TextContent_Subtype_unordered-list-item")
    }
    func testFormatting() throws {
        try decode("Formatting")
    }

    private func decode(_ filename: String) throws {
        guard let _: TextContent = decode(filename: filename) else {
            XCTFail("Decoding failed for \(filename).")
            return
        }
    }
}
