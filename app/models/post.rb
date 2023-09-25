class Post < ApplicationRecord
  belongs_to :user
  has_many :tag_to_posts, dependent: :destroy
  has_many :tags, through: :tag_to_posts
  validates :title, :content, :date, presence: true
end
