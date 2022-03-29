import Foundation

public struct CheckoutLabels: Codable, Hashable
{
    /// Translated label for the monthly checkout button. "%s" denotes placeholder for the price.
    public let monthly: String

    /// Translated label for the "Support from.." button before checkout. "%s" denotes placeholder for the price.
    public let support: String

    /// Translated label for the yearly checkout button. "%s" denotes placeholder for the price.
    public let yearly: String

    public init(monthly: String, support: String, yearly: String) {
        self.monthly = monthly
        self.support = support
        self.yearly = yearly
    }
}
