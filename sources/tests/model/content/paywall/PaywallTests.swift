@testable import TumblrNPF
import XCTest

final class PaywallTests: XCTestCase
{
    // The full paywall CTA - not sent are button copy (fixed, price can be pulled
    // from subscription info below) and background/accent color (already on blog)
    func testPaywallCTA() throws {
        try decode("Paywall1")
    }

    // The simple teaser divider for Creators looking at their own +Posts
    func testSimpleTeaserDivider() throws {
        try decode("Paywall2")
    }

    // The disabled type
    func testDisabledType() throws {
        try decode("Paywall3")
    }

    private func decode(_ filename: String) throws {
        guard let _: PaywallContent = decode(filename: filename) else {
            XCTFail("Decoding failed for \(filename).")
            return
        }
    }
}
