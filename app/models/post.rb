class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  after_initialize do |_post|
    update_user_post_counter unless Post.exists?(id: id)
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
    p 'Hellooo'
    comments.order(created_at: :desc).limit(limit)
  end
end
