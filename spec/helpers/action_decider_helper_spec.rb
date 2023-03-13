require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ActionDeciderHelper. For example:
#
# describe ActionDeciderHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ActionDeciderHelper, type: :helper do
  let(:user) { User.create(name: 'Yonas', bio: 'bio here', photo: 'https://avatars.githubusercontent.com/u/72081991?v=4', email: "test3@gmail.com", password: '123123') }
  let(:post) { Post.create(author: user, title: 'Post title', text: 'Post text') }
  it 'renders the correct object' do
    expect(like_action_decider(post, user)[:button_text]).to include('Like')
  end
end
