import Foundation

/// A post wrapper that allows a post to refer to itself.
///
/// Encoding and decoding will behave as if this was a Post object, meaning
/// it will produce the variables of the `Post` object instead of the `post` variable.
public final class PostWrap: Codable, Hashable
{
    public let post: BasePost

    public init(post: BasePost) {
        self.post = post
    }

    // MARK: - Codable
    
    public enum CodingKeys: String, CodingKey {
        case post
    }

    public required init(from decoder: Decoder) throws {
        self.post = try BasePost(from: decoder)
    }

    public func encode(to encoder: Encoder) throws { // swiftlint:disable:this function_body_length
        var container = encoder.container(keyedBy: BasePost.CodingKeys.self)
        try container.encodeIfPresent(post.blog, forKey: .blog)
        try container.encodeIfPresent(post.blogName, forKey: .blogName)
        try container.encodeIfPresent(post.canDelete, forKey: .canDelete)
        try container.encodeIfPresent(post.canEdit, forKey: .canEdit)
        try container.encodeIfPresent(post.canLike, forKey: .canLike)
        try container.encodeIfPresent(post.canReblog, forKey: .canReblog)
        try container.encodeIfPresent(post.canReply, forKey: .canReply)
        try container.encodeIfPresent(post.canSendInMessage, forKey: .canSendInMessage)
        try container.encodeIfPresent(post.classification, forKey: .classification)
        try container.encodeIfPresent(post.content, forKey: .content)
        try container.encodeIfPresent(post.date, forKey: .date)
        try container.encodeIfPresent(post.displayAvatar, forKey: .displayAvatar)
        try container.encodeIfPresent(post.embedURL, forKey: .embedURL)
        try container.encodeIfPresent(post.followed, forKey: .followed)
        try container.encodeIfPresent(post.idString, forKey: .idString)
        try container.encodeIfPresent(post.interactabilityReblog, forKey: .interactabilityReblog)
        try container.encodeIfPresent(post.isNSFW, forKey: .isNSFW)
        try container.encodeIfPresent(post.isPaywalled, forKey: .isPaywalled)
        try container.encodeIfPresent(post.layout, forKey: .layout)
        try container.encodeIfPresent(post.likeCount, forKey: .likeCount)
        try container.encodeIfPresent(post.liked, forKey: .liked)
        try container.encodeIfPresent(post.noteCount, forKey: .noteCount)
        try container.encodeIfPresent(post.nsfwScore, forKey: .nsfwScore)
        try container.encodeIfPresent(post.objectType, forKey: .objectType)
        try container.encodeIfPresent(post.originalType, forKey: .originalType)
        try container.encodeIfPresent(post.paywallAccess, forKey: .paywallAccess)
        try container.encodeIfPresent(post.paywallReblogView, forKey: .paywallReblogView)
        try container.encodeIfPresent(post.postURL, forKey: .postURL)
        try container.encodeIfPresent(post.reblogCount, forKey: .reblogCount)
        try container.encodeIfPresent(post.reblogKey, forKey: .reblogKey)
        try container.encodeIfPresent(post.recommendedColor, forKey: .recommendedColor)
        try container.encodeIfPresent(post.recommendedSource, forKey: .recommendedSource)
        try container.encodeIfPresent(post.replyCount, forKey: .replyCount)
        try container.encodeIfPresent(post.shortURL, forKey: .shortURL)
        try container.encodeIfPresent(post.shouldOpenInLegacy, forKey: .shouldOpenInLegacy)
        try container.encodeIfPresent(post.slug, forKey: .slug)
        try container.encodeIfPresent(post.state, forKey: .state)
        try container.encodeIfPresent(post.summary, forKey: .summary)
        try container.encodeIfPresent(post.tags, forKey: .tags)
        try container.encodeIfPresent(post.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(post.trail, forKey: .trail)
        try container.encodeIfPresent(post.type, forKey: .type)
    }

    public static func == (lhs: PostWrap, rhs: PostWrap) -> Bool {
        lhs.post == rhs.post
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(post)
    }
}
