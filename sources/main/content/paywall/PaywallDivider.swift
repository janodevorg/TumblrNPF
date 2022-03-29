import Foundation

public final class PaywallDivider: PaywallBase, Codable
{
    /// For subtype `cta` or `disabled` it is the main description text.
    /// For subtype `divider` it is the label text.
    public let text: String

    /// The hex color for the label and divider, e.g. #eeeeee.
    public let color: String?

    public enum CodingKeys: String, CodingKey {
        case color
        case isVisible = "is_visible"
        case subtype
        case text
        case type
        case url
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
        let isVisible = try container.decodeIfPresent(Bool.self, forKey: .isVisible)
        let subtype = try container.decode(String.self, forKey: .subtype)
        self.text = try container.decode(String.self, forKey: .text)
        let type = try container.decode(String.self, forKey: .type)
        let url = try container.decode(URL.self, forKey: .url)
        super.init(isVisible: isVisible, subtype: subtype, type: type, url: url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(color, forKey: .color)
        try container.encodeIfPresent(isVisible, forKey: .isVisible)
        try container.encode(subtype, forKey: .subtype)
        try container.encode(text, forKey: .text)
        try container.encode(type, forKey: .type)
        try container.encode(url, forKey: .url)
    }

    public init?(color: String?,
                 text: String,
                 isVisible: Bool?,
                 subtype: String,
                 type: String,
                 url: URL) {
        self.color = color
        self.text = text
        super.init(isVisible: isVisible, subtype: subtype, type: type, url: url)
    }
}
