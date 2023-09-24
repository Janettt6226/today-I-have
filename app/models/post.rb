class Post < ApplicationRecord
  belongs_to :user
  has_many :tag_to_posts
  has_many :tags, through: :tag_to_posts
  validates :title, :content, presence: true
end
