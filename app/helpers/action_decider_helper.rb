module ActionDeciderHelper
  def like_action_decider(post, current_user)
    if post.likes.find_by(author_id: current_user.id)
      {
        method: 'delete',
        url: user_post_like_path(user_id: post.author.id, post_id: post.id),
        button_text: 'Dislike'
      }
    else
      {
        method: 'post',
        url: user_post_likes_path(user_id: post.author.id, post_id: post.id),
        button_text: 'Like'
      }
    end
  end
end
