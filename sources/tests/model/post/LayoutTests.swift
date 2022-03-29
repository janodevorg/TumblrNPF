@testable import TumblrNPF
import XCTest

final class LayoutTests: XCTestCase
{
    func testPaywallReblogView() throws {
        guard let _: Post = decode(filename: "PaywallReblogView") else {
            XCTFail("Decoding failed for PaywallReblogView.json")
            return
        }
    }

    func testPostLayoutRows1() throws {
        try decodeBasePost("Post+LayoutRows1")
    }
    func testPostLayoutRows2() throws {
        try decodeBasePost("Post+LayoutRows2")
    }
    func testPostLayoutRows3() throws {
        try decodeBasePost("Post+LayoutRows3")
    }
    func testPostLayoutReadMore() throws {
        try decodeBasePost("Post+LayoutReadMore")
    }
    func testLayoutCarousel() throws {
        try decodeLayout("LayoutCarousel")
    }
    func testLayoutCondensed1() throws {
        try decodeLayout("LayoutCondensed1")
    }
    func testLayoutCondensed2() throws {
        try decodeLayout("LayoutCondensed2")
    }
    func testLayoutAsk() throws {
        try decodeLayout("LayoutAsk")
    }

    private func decodeLayout(_ filename: String) throws {
        guard let _: Layout = decode(filename: filename) else {
            XCTFail("Decoding failed for \(filename).")
            return
        }
    }

    private func decodeBasePost(_ filename: String) throws {
        guard let _: BasePost = decode(filename: filename) else {
            XCTFail("Decoding failed for \(filename).")
            return
        }
    }
}
