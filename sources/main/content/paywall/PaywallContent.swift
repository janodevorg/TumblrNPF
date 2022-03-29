import Foundation

public enum PaywallContent: Decodable, Hashable
{
    case cta(PaywallCTA)
    case disabled(PaywallDisabled)
    case divider(PaywallDivider)
    case unknown

    private struct CodingKeys: CodingKey
    {
        var intValue: Int? { nil }
        init?(intValue: Int) { nil }
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        static let type = CodingKeys(stringValue: "subtype")! // swiftlint:disable:this force_unwrapping
        static let unknown = CodingKeys(stringValue: "unknown")! // swiftlint:disable:this force_unwrapping
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: CodingKeys.type)
        switch type {
        case "cta": self = try .cta(PaywallCTA(from: decoder))
        case "disabled": self = try .disabled(PaywallDisabled(from: decoder))
        case "divider": self = try .divider(PaywallDivider(from: decoder))
        default: self = PaywallContent.unknown
        }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .cta(let paywallCTA): try paywallCTA.encode(to: encoder)
        case .disabled(let paywallDisabled): try paywallDisabled.encode(to: encoder)
        case .divider(let paywallDivider): try paywallDivider.encode(to: encoder)
        case .unknown:
            var container = encoder.singleValueContainer()
            try container.encode(CodingKeys.unknown.stringValue)
        }
    }
}
