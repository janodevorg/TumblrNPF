import Foundation

public struct QueryParams: Codable, Hashable {

    public let fields: [String: String]
    public let limit: String

    // not present when we are getting a single blog
    public let offset: String?

    // present when we are getting a single blog
    public let reblogInfo: String? // actually bool
    public let npf: String? // actually bool
    public let includePinnedPosts: String? // actually bool
    public let tumblelog: String?
    public let pageNumber: String?

    public enum CodingKeys: String, CodingKey {
        case fields
        case includePinnedPosts
        case limit
        case npf
        case offset
        case pageNumber
        case reblogInfo
        case tumblelog
    }
}
