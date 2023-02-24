class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  def increment_posts_counter
    update(posts_counter: self.posts_counter += 1)
  end
end
