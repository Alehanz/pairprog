class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :comment_body, presence: true, length: { maximum: 3000 }
end
