@testable import TumblrNPF
import XCTest

final class BlogTests: XCTestCase
{
    func testBlog() throws
    {
        guard let _: Blog = decode(filename: "Blog") else {
            XCTFail("Decoding failed.")
            return
        }
    }
}
