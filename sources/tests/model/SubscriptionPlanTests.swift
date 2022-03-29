@testable import TumblrNPF
import XCTest

final class SubscriptionPlanTests: XCTestCase
{
    func testSubscriptionPlan() throws
    {
        guard let _: SubscriptionPlan = decode(filename: "SubscriptionPlan") else {
            XCTFail("Decoding failed.")
            return
        }
    }
}
