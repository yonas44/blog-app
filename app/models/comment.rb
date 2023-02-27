class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_initialize do |_post|
    update_post_comments_counter unless Comment.exists?(id:)
  end

  def update_post_comments_counter
    post.increment_comments_counter
  end
end
