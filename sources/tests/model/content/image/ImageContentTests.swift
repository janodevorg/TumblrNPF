@testable import TumblrNPF
import XCTest

final class ImageContentTests: XCTestCase
{
    func testImageContent() throws {
        guard let _: ImageContent = decode(filename: "ImageContent") else {
            XCTFail("Decoding failed for ImageContent.json")
            return
        }
    }

    func testImageContentGIF() throws {
        guard let _: ImageContent = decode(filename: "ImageContent_GIF") else {
            XCTFail("Decoding failed for ImageContent_GIF.json")
            return
        }
    }

    func testImageWithAttributionObject() {
        guard let _: ImageContent = decode(filename: "ImageContent_with_AttributionObject") else {
            XCTFail("Decoding failed.")
            return
        }
    }
}
