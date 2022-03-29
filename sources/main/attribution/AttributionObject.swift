import Foundation

/// Objects for type `app`, `blog`, `link`, `post`.
public enum AttributionObject: Codable, Hashable
{
    case app(AppAttributionObject)
    case blog(BlogAttributionObject)
    case link(LinkAttributionObject)
    case post(PostAttributionObject)
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
        case "app": self = try .app(AppAttributionObject(from: decoder))
        case "blog": self = try .blog(BlogAttributionObject(from: decoder))
        case "link": self = try .link(LinkAttributionObject(from: decoder))
        case "post": self = try .post(PostAttributionObject(from: decoder))
        default: self = AttributionObject.unknown
        }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .app(let appAttributionObject): try appAttributionObject.encode(to: encoder)
        case .blog(let blogAttributionObject): try blogAttributionObject.encode(to: encoder)
        case .link(let linkAttributionObject): try linkAttributionObject.encode(to: encoder)
        case .post(let postAttributionObject): try postAttributionObject.encode(to: encoder)
        case .unknown:
            var container = encoder.singleValueContainer()
            try container.encode(CodingKeys.unknown.stringValue)
        }
    }
}
