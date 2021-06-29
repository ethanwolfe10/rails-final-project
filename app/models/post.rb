class Post < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_many :comments
    has_many :likes

    validates :title, presence: true, length: { maximum: 30, too_long: "{%count} characters is the maximum allowed." }
    validates :content, presence: true, length: { maximum: 500,
    too_long: "{%count} characters is the maximum allowed."}
    validates :user_id, presence: true
    validates :group_id, presence: true
    # validates :cleared_to_post

    # scope :desc, order("posts.created_at DESC")

    private

    def cleared_to_post
        if !Group.find(self.group_id).subscribers.include?(User.find(self.user_id))
            errors.add(:base, "Not Permitted to Post")
        end
    end
end
