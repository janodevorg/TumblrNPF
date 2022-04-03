@testable import TumblrNPF
import XCTest

final class BlogTests: XCTestCase
{
    func testBlog1() throws
    {
        guard let _: Blog = decode(filename: "Blog1") else {
            XCTFail("Decoding failed.")
            return
        }
    }

    func testBlog2() throws
    {
        guard let _: Blog = decode(filename: "Blog2") else {
            XCTFail("Decoding failed.")
            return
        }
    }
}
