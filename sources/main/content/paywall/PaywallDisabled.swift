import Foundation

public class PaywallDisabled: PaywallBase, Codable
{
    /// The CTA title that appears above the main text. Only for subtype `cta` or `disabled`.
    public let title: String

    /// For subtype `cta` or `disabled` it is the main description text.
    /// For subtype `divider` it is the label text.
    public let text: String

    public enum CodingKeys: String, CodingKey {
        case isVisible = "is_visible"
        case subtype
        case text
        case title
        case type
        case url
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.text = try container.decode(String.self, forKey: .text)
        self.title = try container.decode(String.self, forKey: .title)

        let isVisible = try container.decodeIfPresent(Bool.self, forKey: .isVisible)
        let subtype = try container.decode(String.self, forKey: .subtype)
        let type = try container.decode(String.self, forKey: .type)
        let url = try container.decode(URL.self, forKey: .url)

        super.init(isVisible: isVisible, subtype: subtype, type: type, url: url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encodeIfPresent(isVisible, forKey: .isVisible)
        try container.encode(subtype, forKey: .subtype)
        try container.encode(text, forKey: .text)
        try container.encode(type, forKey: .type)
        try container.encode(url, forKey: .url)
    }

    public init(isVisible: Bool?,
                subtype: String,
                text: String,
                title: String,
                type: String,
                url: URL) {
        self.text = text
        self.title = title
        super.init(isVisible: isVisible, subtype: subtype, type: type, url: url)
    }
}
