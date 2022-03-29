@testable import TumblrNPF
import XCTest

final class TrailTests: XCTestCase
{
    func testPostTrail() throws {
        try decodeTrail("Post+Trail")
    }

    func testBrokenTrail() throws {
        try decodeTrailArray("BrokenTrailArray")
    }

    private func decodePost(_ filename: String) throws {
        guard let _: BasePost = decode(filename: filename) else {
            XCTFail("Decoding failed for \(filename).")
            return
        }
    }
    private func decodeTrail(_ filename: String) throws {
        guard let _: Trail = decode(filename: filename) else {
            XCTFail("Decoding failed for \(filename).")
            return
        }
    }
    private func decodeTrailArray(_ filename: String) throws {
        guard let _: [Trail] = decode(filename: filename) else {
            XCTFail("Decoding failed for \(filename).")
            return
        }
    }
}
