class Post < ApplicationRecord
  belongs_to :user
  has_many :tag_to_posts, dependent: :destroy
  has_many :tags, through: :tag_to_posts
  validates :title, :content, :date, presence: true
  validates :title, uniqueness: true
  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [:title],
                  associated_against: {
                    tag: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
