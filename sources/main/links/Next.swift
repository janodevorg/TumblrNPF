import Foundation

public struct Next: Codable, Hashable
{
    public let href: String
    public let method: String
    public let queryParams: QueryParams

    public enum CodingKeys: String, CodingKey {
        case href
        case method
        case queryParams = "query_params"
    }
}
