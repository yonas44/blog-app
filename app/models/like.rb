class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_create do |_like|
    update_post_likes_counter
  end

  def update_post_likes_counter
    post.increment_likes_counter
  end
end
