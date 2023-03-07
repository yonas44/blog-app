require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'displays all users' do
    it 'displays all users' do
      # display a page
      visit users_path

      # assert the displayed page
      assert_text 'Yonas'

      # navigate to the show page
      sleep(1)
      click_link(id: 'Yonas')

      # assert the displayed page
      sleep(1)
      assert_text 'Bio'
    end
  end

  describe 'shows detail page for a user' do
    it 'displays the user with their posts' do
      # display a all users
      visit users_path

      # assert the displayed page
      assert_text 'Yonas'

      # click on a user from the displayed page
      sleep(1)
      click_link(id: 'Yonas')

      # assert the displayed page has a post with text 'second' and 'Show'
      assert_text 'super'
      assert_text 'second'
      assert_text 'Show all posts'

      # click on a post from the list of posts
      sleep(1)
      page.click_on 'first'

      # assert the displayed page
      sleep(1)
      assert_text 'Yonas'
    end

    it 'displays the index page of the post' do
      # display a all users
      visit users_path

      # assert the displayed page
      assert_text 'Yonas'

      # click on a user from the displayed page
      sleep(1)
      click_on 'Yonas'

      # navigate to posts path
      sleep(1)
      click_button 'Show all posts'

      # assert the displayed page
      sleep(1)
      assert_text 'List of all posts:'
    end
  end
end
