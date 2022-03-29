import Foundation

public class PaywallBase: Hashable
{
    /// Whether this paywall block is actually visible, default to true.
    public var isVisible: Bool? // swiftlint:disable:this discouraged_optional_boolean

    /// Either cta, divider, or disabled, to denote the paywall block design.
    public var subtype: String

    /// The creator profile url this paywall should link to.
    public var url: URL

    public var type: String

    public init(isVisible: Bool?, subtype: String, type: String, url: URL) { // swiftlint:disable:this discouraged_optional_boolean
        self.isVisible = isVisible
        self.subtype = subtype
        self.type = type
        self.url = url
    }

    public static func == (lhs: PaywallBase, rhs: PaywallBase) -> Bool {
        lhs.isVisible == rhs.isVisible
        && lhs.subtype == rhs.subtype
        && lhs.type == rhs.type
        && lhs.url == rhs.url
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(isVisible)
        hasher.combine(subtype)
        hasher.combine(type)
        hasher.combine(url)
    }
}
