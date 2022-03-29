@testable import TumblrNPF
import XCTest

final class VideoContentTests: XCTestCase
{
    func testVideoContentNative() throws {
        guard let _: VideoContent = decode(filename: "VideoContentNative") else {
            XCTFail("Decoding failed for VideoContentNative.json")
            return
        }
    }
    func testVideoContentYoutube() throws {
        guard let _: VideoContent = decode(filename: "VideoContentYoutube") else {
            XCTFail("Decoding failed for VideoContentYoutube.json")
            return
        }
    }
}
