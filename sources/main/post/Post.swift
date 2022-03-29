import Foundation

/// See [Tumblr Neue Post Format (NPF) Specification](https://www.tumblr.com/docs/npf).
public struct Post: Codable, Hashable
{
    public let id: PostId
    public let basePost: BasePost

    public init(id: PostId, basePost: BasePost) {
        self.id = id
        self.basePost = basePost
    }

    // MARK: - Codable

    public enum CodingKeys: String, CodingKey {
        case id
        case basePost
    }

    public init(from decoder: Decoder) throws {
        self.basePost = try BasePost(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(PostId.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws { // swiftlint:disable:this function_body_length
        var thisContainer = encoder.container(keyedBy: CodingKeys.self)
        try thisContainer.encode(id, forKey: CodingKeys.id)

        var container = encoder.container(keyedBy: BasePost.CodingKeys.self)
        try container.encodeIfPresent(basePost.blog, forKey: .blog)
        try container.encodeIfPresent(basePost.blogName, forKey: .blogName)
        try container.encodeIfPresent(basePost.canDelete, forKey: .canDelete)
        try container.encodeIfPresent(basePost.canEdit, forKey: .canEdit)
        try container.encodeIfPresent(basePost.canLike, forKey: .canLike)
        try container.encodeIfPresent(basePost.canReblog, forKey: .canReblog)
        try container.encodeIfPresent(basePost.canReply, forKey: .canReply)
        try container.encodeIfPresent(basePost.canSendInMessage, forKey: .canSendInMessage)
        try container.encodeIfPresent(basePost.classification, forKey: .classification)
        try container.encodeIfPresent(basePost.content, forKey: .content)
        try container.encodeIfPresent(basePost.date, forKey: .date)
        try container.encodeIfPresent(basePost.displayAvatar, forKey: .displayAvatar)
        try container.encodeIfPresent(basePost.embedURL, forKey: .embedURL)
        try container.encodeIfPresent(basePost.followed, forKey: .followed)
        try container.encodeIfPresent(basePost.idString, forKey: .idString)
        try container.encodeIfPresent(basePost.interactabilityReblog, forKey: .interactabilityReblog)
        try container.encodeIfPresent(basePost.isNSFW, forKey: .isNSFW)
        try container.encodeIfPresent(basePost.isPaywalled, forKey: .isPaywalled)
        try container.encodeIfPresent(basePost.layout, forKey: .layout)
        try container.encodeIfPresent(basePost.likeCount, forKey: .likeCount)
        try container.encodeIfPresent(basePost.liked, forKey: .liked)
        try container.encodeIfPresent(basePost.noteCount, forKey: .noteCount)
        try container.encodeIfPresent(basePost.nsfwScore, forKey: .nsfwScore)
        try container.encodeIfPresent(basePost.objectType, forKey: .objectType)
        try container.encodeIfPresent(basePost.originalType, forKey: .originalType)
        try container.encodeIfPresent(basePost.paywallAccess, forKey: .paywallAccess)
        try container.encodeIfPresent(basePost.paywallReblogView, forKey: .paywallReblogView)
        try container.encodeIfPresent(basePost.postURL, forKey: .postURL)
        try container.encodeIfPresent(basePost.reblogCount, forKey: .reblogCount)
        try container.encodeIfPresent(basePost.reblogKey, forKey: .reblogKey)
        try container.encodeIfPresent(basePost.recommendedColor, forKey: .recommendedColor)
        try container.encodeIfPresent(basePost.recommendedSource, forKey: .recommendedSource)
        try container.encodeIfPresent(basePost.replyCount, forKey: .replyCount)
        try container.encodeIfPresent(basePost.shortURL, forKey: .shortURL)
        try container.encodeIfPresent(basePost.shouldOpenInLegacy, forKey: .shouldOpenInLegacy)
        try container.encodeIfPresent(basePost.slug, forKey: .slug)
        try container.encodeIfPresent(basePost.state, forKey: .state)
        try container.encodeIfPresent(basePost.summary, forKey: .summary)
        try container.encodeIfPresent(basePost.tags, forKey: .tags)
        try container.encodeIfPresent(basePost.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(basePost.trail, forKey: .trail)
        try container.encodeIfPresent(basePost.type, forKey: .type)
    }

    // MARK: - Hashable

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}
