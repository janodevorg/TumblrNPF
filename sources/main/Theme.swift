import CodableHelpers
import Foundation

public struct Theme: Codable, Hashable
{
    public let avatarShape: String
    public let backgroundColor: String
    public let bodyFont: String
    public let headerBounds: CodableIntOrString
    public let headerFullHeight: Int?
    public let headerFullWidth: Int?
    public let headerImage: String
    public let headerImageFocused: String
    public let headerImagePoster: String
    public let headerImageScaled: String
    public let headerStretch: Bool
    public let linkColor: String
    public let showAvatar: Bool
    public let showDescription: Bool
    public let showHeaderImage: Bool
    public let showTitle: Bool
    public let titleColor: String
    public let titleFont: String
    public let titleFontWeight: String

    public enum CodingKeys: String, CodingKey {
        case avatarShape = "avatar_shape"
        case backgroundColor = "background_color"
        case bodyFont = "body_font"
        case headerBounds = "header_bounds"
        case headerFullHeight = "header_full_height"
        case headerFullWidth = "header_full_width"
        case headerImage = "header_image"
        case headerImageFocused = "header_image_focused"
        case headerImagePoster = "header_image_poster"
        case headerImageScaled = "header_image_scaled"
        case headerStretch = "header_stretch"
        case linkColor = "link_color"
        case showAvatar = "show_avatar"
        case showDescription = "show_description"
        case showHeaderImage = "show_header_image"
        case showTitle = "show_title"
        case titleColor = "title_color"
        case titleFont = "title_font"
        case titleFontWeight = "title_font_weight"
    }

    public init(
        avatarShape: String,
        backgroundColor: String,
        bodyFont: String,
        headerBounds: CodableIntOrString,
        headerFullHeight: Int?,
        headerFullWidth: Int?,
        headerImage: String,
        headerImageFocused: String,
        headerImagePoster: String,
        headerImageScaled: String,
        headerStretch: Bool,
        linkColor: String,
        showAvatar: Bool,
        showDescription: Bool,
        showHeaderImage: Bool,
        showTitle: Bool,
        titleColor: String,
        titleFont: String,
        titleFontWeight: String
    ) {
        self.avatarShape = avatarShape
        self.backgroundColor = backgroundColor
        self.bodyFont = bodyFont
        self.headerBounds = headerBounds
        self.headerFullHeight = headerFullHeight
        self.headerFullWidth = headerFullWidth
        self.headerImage = headerImage
        self.headerImageFocused = headerImageFocused
        self.headerImagePoster = headerImagePoster
        self.headerImageScaled = headerImageScaled
        self.headerStretch = headerStretch
        self.linkColor = linkColor
        self.showAvatar = showAvatar
        self.showDescription = showDescription
        self.showHeaderImage = showHeaderImage
        self.showTitle = showTitle
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.titleFontWeight = titleFontWeight
    }
}
