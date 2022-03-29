import Foundation

public final class MediaObjectWrap: Codable, Hashable
{
    public let media: MediaObject

    public init(media: MediaObject) {
        self.media = media
    }
    
    public enum CodingKeys: String, CodingKey {
        case media
    }

    public required init(from decoder: Decoder) throws {
        self.media = try MediaObject(from: decoder)
    }

    public func encode(to encoder: Encoder) throws { // swiftlint:disable:this function_body_length
        var container = encoder.container(keyedBy: MediaObject.CodingKeys.self)
        try container.encodeIfPresent(media.cropped, forKey: .cropped)
        try container.encodeIfPresent(media.hasOriginalDimensions, forKey: .hasOriginalDimensions)
        try container.encodeIfPresent(media.height, forKey: .height)
        try container.encodeIfPresent(media.originalDimensionsMissing, forKey: .originalDimensionsMissing)
        try container.encodeIfPresent(media.type, forKey: .type)
        try container.encodeIfPresent(media.url, forKey: .url)
        try container.encodeIfPresent(media.width, forKey: .width)
    }

    public static func == (lhs: MediaObjectWrap, rhs: MediaObjectWrap) -> Bool {
        lhs.media == rhs.media
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(media)
    }
}
