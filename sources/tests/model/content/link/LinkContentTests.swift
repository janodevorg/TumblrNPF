@testable import TumblrNPF
import XCTest

final class LinkContentTests: XCTestCase
{
    func testLinkContent() throws {
        guard let _: LinkContent = decode(filename: "LinkContent") else {
            XCTFail("Decoding failed for LinkContent.json")
            return
        }
    }
}
