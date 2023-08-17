require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Tom') }
  let(:post) { Post.create(title: 'My First Post', text: 'This is the content of the post.', author: user) }

  it 'is valid with an author and post' do
    like = Like.new(author: user, post:)
    expect(like).to be_valid
  end

  it 'is not valid without an author' do
    like = Like.new(author: nil, post:)
    expect(like).to_not be_valid
  end

  it 'is not valid without a post' do
    like = Like.new(author: user, post: nil)
    expect(like).to_not be_valid
  end

  describe 'callbacks' do
    it 'increases the post likes_counter by 1 when created' do
      expect do
        Like.create(author: user, post:)
      end.to change { post.reload.likes_counter }.by(1)
    end

    it 'decreases the post likes_counter by 1 when destroyed' do
      like = Like.create(author: user, post:)
      expect do
        like.destroy
      end.to change { post.reload.likes_counter }.by(-1)
    end
  end
end
