// swiftlint:disable discouraged_optional_boolean
import Foundation

/**
 Tapping the "Learn more" in the paywall block subtype cta will open up
 a full modal with more info about the subscription plan.

 The API page says these elements are always present but doesn’t indicate
 which ones are required, so I set everything to optional.
*/
public struct SubscriptionPlan: Codable, Hashable
{
    public let checkoutLabels: CheckoutLabels?

    /// The 3-letter ISO code for the currency.
    public let currencyCode: String?

    /// The subscription plan's description (shown in "About" tab).
    public let desc: String?

    /// Whether this is a valid subscription plan that Supporters can checkout from.
    public let isValid: Bool?

    /// List of perks this blog offers.
    public let memberPerks: [String]?

    /// The monthly price in cents.
    public let monthlyPrice: String?

    /// The modal title (e.g. "Show your support")
    public let subscriptionLabel: String?

    /// The yearly price in cents, only if this blog supports a yearly plan.
    public let yearlyPrice: String?

    public init(
        checkoutLabels: CheckoutLabels,
        currencyCode: String,
        desc: String,
        isValid: Bool,
        memberPerks: [String],
        monthlyPrice: String,
        subscriptionLabel: String,
        yearlyPrice: String
    ) {
        self.checkoutLabels = checkoutLabels
        self.currencyCode = currencyCode
        self.desc = desc
        self.isValid = isValid
        self.memberPerks = memberPerks
        self.monthlyPrice = monthlyPrice
        self.subscriptionLabel = subscriptionLabel
        self.yearlyPrice = yearlyPrice
    }

    enum CodingKeys: String, CodingKey {
        case checkoutLabels = "checkout_labels"
        case currencyCode = "currency_code"
        case desc = "description"
        case isValid = "is_valid"
        case memberPerks = "member_perks"
        case monthlyPrice = "monthly_price"
        case yearlyPrice = "yearly_price"
        case subscriptionLabel = "subscription_label"
    }
}
