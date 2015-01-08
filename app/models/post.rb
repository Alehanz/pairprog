class Post < ActiveRecord::Base
  include Bootsy::Container
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 3000 }
end
