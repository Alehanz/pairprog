class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 3000 }
end
