// swiftlint:disable discouraged_optional_boolean
import UIKit

/**
 Media objects are used for image blocks, all kinds of posters (GIF, video, etc),
 native audio, native video, and some trusted third-party content.

 It appears inside `Post.content` as `media: MediaObject`, `poster: [MediaObject]`, `filmstrip: MediaObject`.
*/
public struct MediaObject: Codable, Hashable
{
    /// is this a cropped version of the original media?
    public let cropped: Bool?

    /// does it have the same dimensions as the original media?
    public let hasOriginalDimensions: Bool?

    /// The height of the media asset, if that makes sense (for images and videos, but not for audio)
    public let height: Int?

    /// HD flag for media type video
    public let hd: Bool?

    /// For display purposes, this indicates whether the dimensions are defaults
    public let originalDimensionsMissing: Bool?

    /// Single-frame image for GIF objects
    public let poster: MediaObjectWrap?

    // The MIME type of the media asset, or a best approximation will be made based on the given URL
    public let type: String?
    
    /// The canonical URL of the media asset
    public let url: URL

    /// The width of the media asset, if that makes sense (for images and videos, but not for audio)
    public let width: Int?

    public var size: CGSize? {
        guard let width = width, let height = height else {
            return nil
        }
        return CGSize(width: width, height: height)
    }

    public enum CodingKeys: String, CodingKey
    {
        case cropped
        case hasOriginalDimensions = "has_original_dimensions"
        case hd
        case height
        case originalDimensionsMissing = "original_dimensions_missing"
        case poster
        case type
        case url
        case width
    }

    public init(
        cropped: Bool?,
        hasOriginalDimensions: Bool?,
        hd: Bool?,
        height: Int?,
        originalDimensionsMissing: Bool?,
        poster: MediaObjectWrap?,
        type: String?,
        url: URL,
        width: Int?
    ) {
        self.cropped = cropped
        self.hasOriginalDimensions = hasOriginalDimensions
        self.hd = hd
        self.height = height
        self.originalDimensionsMissing = originalDimensionsMissing
        self.poster = poster
        self.type = type
        self.url = url
        self.width = width
    }

    // MARK: - Equatable

    public static func == (lhs: MediaObject, rhs: MediaObject) -> Bool {
        lhs.cropped == rhs.cropped
        && lhs.hasOriginalDimensions == rhs.hasOriginalDimensions
        && lhs.hd == rhs.hd
        && lhs.height == rhs.height
        && lhs.originalDimensionsMissing == rhs.originalDimensionsMissing
        && lhs.poster == rhs.poster
        && lhs.type == rhs.type
        && lhs.url == rhs.url
        && lhs.width == rhs.width
    }
}
