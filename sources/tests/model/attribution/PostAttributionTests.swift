@testable import TumblrNPF
import XCTest

final class PostAttributionTests: XCTestCase
{
    func testPostAttribution() throws
    {
        guard let _: AttributionObject = decode(filename: "PostAttribution") else {
            XCTFail("Decoding failed.")
            return
        }
    }
}
