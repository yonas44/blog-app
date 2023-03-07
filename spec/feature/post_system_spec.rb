require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'creates a post for a user' do
    it 'displays the post created' do
      # display a page
      visit users_path

      # navigate to the new post template
      click_on 'Katie'

      sleep(2)
      click_on(id: 'create_post')

      # fill the form with text
      sleep(1)
      fill_in 'post[title]', with: 'Yet another post..'
      fill_in 'post[text]', with: 'This is another post hope you like reading..'

      sleep(1)
      click_on 'Add post'

      # use pagination
      sleep(1)
      click_link 'Next'

      # select a post
      sleep(1)
      click_on 'Yet'

      # add a comment
      sleep(1)
      fill_in 'comment[text]', with: 'I like your post, thanks for sharing!'

      sleep(1)
      click_on(id: 'add_comment_btn')

      # assert the displayed page
      sleep(1)
      assert_text 'Comment saved successfully'
    end
  end

  describe 'displays detailed page of a single post' do
    it 'displays a single post' do
      # navigate to the posts page
      visit users_path

      sleep(1)
      click_on 'Yonas'

      # page.click_link(:id => 'post_link')
      sleep(1)
      click_button 'Show all posts'

      sleep(1)
      click_on 'first'

      # add a comment
      sleep(1)
      fill_in 'comment[text]', with: 'My pleasure Katie!'

      sleep(1)
      click_on(id: 'add_comment_btn')

      # assert the displayed page
      sleep(1)
      assert_text 'Comment saved successfully'
    end
  end
end
