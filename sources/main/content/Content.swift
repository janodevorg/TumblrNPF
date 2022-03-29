import Foundation

public enum Content: Codable, Hashable
{
    case audio(AudioContent)
    case image(ImageContent)
    case link(LinkContent)
    case paywall(PaywallContent)
    case text(TextContent)
    case video(VideoContent)
    case unknown

    private struct CodingKeys: CodingKey {
        var intValue: Int? { nil }
        init?(intValue: Int) { nil }
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        static let type = CodingKeys(stringValue: "type")! // swiftlint:disable:this force_unwrapping
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: CodingKeys.type)
        switch type {
        case "audio": self = try .audio(AudioContent(from: decoder))
        case "image": self = try .image(ImageContent(from: decoder))
        case "link": self = try .link(LinkContent(from: decoder))
        case "paywall": self = try .paywall(PaywallContent(from: decoder))
        case "text": self = try .text(TextContent(from: decoder))
        case "video": self = try .video(VideoContent(from: decoder))
        default: self = Content.unknown
        }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .audio(let audioContent): try audioContent.encode(to: encoder)
        case .image(let imageContent): try imageContent.encode(to: encoder)
        case .link(let linkContent): try linkContent.encode(to: encoder)
        case .paywall(let paywallContent): try paywallContent.encode(to: encoder)
        case .text(let textContent): try textContent.encode(to: encoder)
        case .video(let videoContent): try videoContent.encode(to: encoder)
        case .unknown: try JSONEncoder().encode("{}").encode(to: encoder)
        }
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .audio(let audioContent): hasher.combine(audioContent)
        case .image(let imageContent): hasher.combine(imageContent)
        case .link(let linkContent): hasher.combine(linkContent)
        case .paywall(let paywallContent): hasher.combine(paywallContent)
        case .text(let textContent): hasher.combine(textContent)
        case .video(let videoContent): hasher.combine(videoContent)
        case .unknown: hasher.combine(0)
        }
    }
}
