class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, comparison: { greater_than_or_equal_to: 0 },
                                               numericality: { only_integer: true }

  after_initialize do |_post|
    update_user_post_counter unless Post.exists?(id:)
  end

  def increment_likes_counter
    update(likes_counter: self.likes_counter += 1)
  end

  def increment_comments_counter
    update(comments_counter: self.comments_counter += 1)
  end

  def update_user_post_counter
    author.increment_posts_counter
  end

  def most_recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
