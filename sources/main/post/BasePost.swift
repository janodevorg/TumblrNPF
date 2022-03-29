// swiftlint:disable discouraged_optional_boolean
import Foundation

/// A post without id.
///
/// This class exists because the post references itself through `paywallReblogView: PostWrap?`
/// except the child post doesn’t have an id unlike its parent. The parent is `Post { id, basePost }`.
///
/// See [Tumblr Neue Post Format (NPF) Specification](https://www.tumblr.com/docs/npf).
public struct BasePost: Codable, Hashable
{
    public let blog: Blog?
    public let blogName: String?
    public let canDelete: Bool?
    public let canEdit: Bool?
    public let canLike: Bool?
    public let canReblog: Bool?
    public let canReply: Bool?
    public let canSendInMessage: Bool?
    public let classification: String?
    public let content: [Content]?
    public let date: String?
    public let displayAvatar: Bool?
    public let embedURL: URL?
    public let followed: Bool?
    public let idString: String?
    public let interactabilityReblog: String?
    public let isNSFW: Bool?
    public let layout: [Layout]?
    public let likeCount: Int?
    public let liked: Bool?
    public let noteCount: Int?
    public let nsfwScore: Int?
    public let objectType: String?
    public let originalType: String?
    public let postURL: URL?
    public let reblogCount: Int?
    public let reblogKey: String?
    public let recommendedColor: String?
    public let recommendedSource: String?
    public let replyCount: Int?
    public let shortURL: URL?
    public let shouldOpenInLegacy: Bool?
    public let slug: String?
    public let state: String?
    public let summary: String?
    public let tags: [String]?
    public let timestamp: Int64?
    public let trail: [Trail]?
    public let type: String?

    // If the user's paywall_access is member or creator, we send an additional object
    // paywall_reblog_view on the post level, which contains the NPF data that a non-member would see.
    // Defined as a class as a workaround so the compiler can calculate the size of this object.
    public let paywallReblogView: PostWrap?

    // extra keys if this post is a trail: isPaywalled, paywallAccess

    public let isPaywalled: Bool?
    public let paywallAccess: PaywallAccess?

    public enum CodingKeys: String, CodingKey
    {
        case blog
        case blogName = "blog_name"
        case canDelete = "can_delete"
        case canEdit = "can_edit"
        case canLike = "can_like"
        case canReblog = "can_reblog"
        case canReply = "can_reply"
        case canSendInMessage = "can_send_in_message"
        case classification
        case content
        case date
        case displayAvatar = "display_avatar"
        case embedURL = "embed_url"
        case followed
        case idString = "id_string"
        case interactabilityReblog = "interactability_reblog"
        case isNSFW = "is_nsfw"
        case isPaywalled = "is_paywalled"
        case layout
        case likeCount = "like_count"
        case liked
        case noteCount = "note_count"
        case nsfwScore = "nsfw_score"
        case objectType = "object_type"
        case originalType = "original_type"
        case paywallAccess = "paywall_access"
        case paywallReblogView = "paywall_reblog_view"
        case postURL = "post_url"
        case reblogCount = "reblog_count"
        case reblogKey = "reblog_key"
        case recommendedColor = "recommended_color"
        case recommendedSource = "recommended_source"
        case replyCount = "reply_count"
        case shortURL = "short_url"
        case shouldOpenInLegacy = "should_open_in_legacy"
        case slug
        case state
        case summary
        case tags
        case timestamp
        case trail
        case type
    }

    public init(blog: Blog?,
                blogName: String?,
                canDelete: Bool?,
                canEdit: Bool?,
                canLike: Bool?,
                canReblog: Bool?,
                canReply: Bool?,
                canSendInMessage: Bool?,
                classification: String?,
                content: [Content]?,
                date: String?,
                displayAvatar: Bool?,
                embedURL: URL?,
                followed: Bool?,
                idString: String?,
                interactabilityReblog: String?,
                isNSFW: Bool?,
                isPaywalled: Bool?,
                layout: [Layout]?,
                likeCount: Int?,
                liked: Bool?,
                noteCount: Int?,
                nsfwScore: Int?,
                objectType: String?,
                originalType: String?,
                paywallAccess: PaywallAccess?,
                paywallReblogView: PostWrap?,
                postURL: URL?,
                reblogCount: Int?,
                reblogKey: String?,
                recommendedColor: String?,
                recommendedSource: String?,
                replyCount: Int?,
                shortURL: URL?,
                shouldOpenInLegacy: Bool?,
                slug: String?,
                state: String?,
                summary: String?,
                tags: [String]?,
                timestamp: Int64?,
                trail: [Trail]?,
                type: String?)
    {
        self.blog = blog
        self.blogName = blogName
        self.canDelete = canDelete
        self.canEdit = canEdit
        self.canLike = canLike
        self.canReblog = canReblog
        self.canReply = canReply
        self.canSendInMessage = canSendInMessage
        self.classification = classification
        self.content = content
        self.date = date
        self.displayAvatar = displayAvatar
        self.embedURL = embedURL
        self.followed = followed
        self.idString = idString
        self.interactabilityReblog = interactabilityReblog
        self.isNSFW = isNSFW
        self.isPaywalled = isPaywalled
        self.layout = layout
        self.likeCount = likeCount
        self.liked = liked
        self.noteCount = noteCount
        self.nsfwScore = nsfwScore
        self.objectType = objectType
        self.originalType = originalType
        self.paywallAccess = paywallAccess
        self.paywallReblogView = paywallReblogView
        self.postURL = postURL
        self.reblogCount = reblogCount
        self.reblogKey = reblogKey
        self.recommendedColor = recommendedColor
        self.recommendedSource = recommendedSource
        self.replyCount = replyCount
        self.shortURL = shortURL
        self.shouldOpenInLegacy = shouldOpenInLegacy
        self.slug = slug
        self.state = state
        self.summary = summary
        self.tags = tags
        self.timestamp = timestamp
        self.trail = trail
        self.type = type
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(blog)
        hasher.combine(blogName)
        hasher.combine(canDelete)
        hasher.combine(canEdit)
        hasher.combine(canLike)
        hasher.combine(canReblog)
        hasher.combine(canReply)
        hasher.combine(canSendInMessage)
        hasher.combine(classification)
        hasher.combine(content)
        hasher.combine(date)
        hasher.combine(displayAvatar)
        hasher.combine(embedURL)
        hasher.combine(followed)
        hasher.combine(idString)
        hasher.combine(interactabilityReblog)
        hasher.combine(isNSFW)
        hasher.combine(layout)
        hasher.combine(likeCount)
        hasher.combine(liked)
        hasher.combine(noteCount)
        hasher.combine(nsfwScore)
        hasher.combine(objectType)
        hasher.combine(originalType)
        hasher.combine(postURL)
        hasher.combine(reblogCount)
        hasher.combine(reblogKey)
        hasher.combine(recommendedColor)
        hasher.combine(recommendedSource)
        hasher.combine(replyCount)
        hasher.combine(shortURL)
        hasher.combine(shouldOpenInLegacy)
        hasher.combine(slug)
        hasher.combine(state)
        hasher.combine(summary)
        hasher.combine(tags)
        hasher.combine(timestamp)
        hasher.combine(trail)
        hasher.combine(type)
        hasher.combine(paywallReblogView)
        hasher.combine(isPaywalled)
        hasher.combine(paywallAccess)
    }
}

