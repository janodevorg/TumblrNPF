@testable import TumblrNPF
import XCTest

final class MediaObjectTests: XCTestCase
{
    func testMediaObject() throws {
        guard let _: MediaObject = decode(filename: "MediaObject") else {
            XCTFail("Decoding failed.")
            return
        }
    }
}
