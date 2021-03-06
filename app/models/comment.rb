class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post, counter_cache: true

    validates :content, presence: true, length: {in: 1..100}
    validates :post_id, presence: true
    
end
