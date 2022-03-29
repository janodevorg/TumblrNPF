import Foundation

/// The layout of the post content.
public enum Layout: Codable, Hashable
{
    case ask(AskLayout)
    case condensed(CondensedLayout)
    case rows(RowsLayout)
    case unknown

    private struct CodingKeys: CodingKey
    {
        var intValue: Int? { nil }
        init?(intValue: Int) { nil }
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        static let type = CodingKeys(stringValue: "type")! // swiftlint:disable:this force_unwrapping
        static let unknown = CodingKeys(stringValue: "unknown")! // swiftlint:disable:this force_unwrapping
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: CodingKeys.type)
        switch type {
        case "ask": self = try .ask(AskLayout(from: decoder))
        case "condensed": self = try .condensed(CondensedLayout(from: decoder))
        case "rows": self = try .rows(RowsLayout(from: decoder))
        default: self = Layout.unknown
        }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .ask(let askLayout): try askLayout.encode(to: encoder)
        case .condensed(let condensedLayout): try condensedLayout.encode(to: encoder)
        case .rows(let rowsLayout): try rowsLayout.encode(to: encoder)
        case .unknown:
            var container = encoder.singleValueContainer()
            try container.encode(CodingKeys.unknown.stringValue)
        }
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .ask(let askLayout): hasher.combine(askLayout)
        case .condensed(let condensedLayout): hasher.combine(condensedLayout)
        case .rows(let rowsLayout): hasher.combine(rowsLayout)
        case .unknown: hasher.combine(0)
        }
    }
}
