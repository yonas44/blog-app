require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'creates a post for a user' do
    it 'displays the post created' do
      # display a page
      visit users_path

      # assert the displayed page
      assert_text 'Katie'

      # navigate to the new post template
      click_on 'Katie'

      # use pagination
      sleep(1)
      click_button 'Show all posts'

      # assert the displayed page
      assert_text 'My first post'
    end
  end

  describe 'displays detailed page of a single post' do
    it 'displays a single post' do
      # navigate to the posts page
      visit users_path

      # assert the displayed page
      assert_text 'Yonas'

      sleep(1)
      click_on 'Yonas'

      # page.click_link(:id => 'post_link')
      sleep(1)
      click_button 'Show all posts'

      sleep(1)
      click_on 'first'

      # assert the displayed page
      assert_text 'Katie'
    end
  end
end
