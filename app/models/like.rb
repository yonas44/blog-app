class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_create do |_like|
    update_post_likes_counter(true)
  end

  after_destroy do |_like|
    update_post_likes_counter(false)
  end

  def update_post_likes_counter(input)
    post.increment_likes_counter(input)
  end
end
