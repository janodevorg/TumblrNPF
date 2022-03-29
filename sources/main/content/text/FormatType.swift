import Foundation

public enum FormatType: String, Codable, CaseIterable, Hashable, Equatable
{
    case bold
    case color
    case italic
    case link
    case mention
    case strikethrough
    case small

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self).lowercased()
        guard let formatType = FormatType(rawValue: value) else {
            let allowedTypes = Self.allCases.map { $0.rawValue }.joined(separator: ",")
            throw DecodingError.valueNotFound(
                FormatType.self,
                DecodingError.Context(
                    codingPath: [],
                    debugDescription: "Got \(value). Expected one of \(allowedTypes).",
                    underlyingError: nil
                )
            )
        }
        self = formatType
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.rawValue)
    }
}
