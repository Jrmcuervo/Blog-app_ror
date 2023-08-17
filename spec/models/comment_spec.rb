require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Tom') }
  let(:post) { Post.create(title: 'My First Post', text: 'This is a post text', author: user) }
  
  it 'is valid with an author and post' do
    comment = Comment.new(author: user, post: post, text: 'Nice post!')
    expect(comment).to be_valid
  end

  it 'is not valid without an author' do
    comment = Comment.new(author: nil, post: post, text: 'Nice post!')
    expect(comment).to_not be_valid
  end

  it 'is not valid without a post' do
    comment = Comment.new(author: user, post: nil, text: 'Nice post!')
    expect(comment).to_not be_valid
  end

  describe 'callbacks' do
    it 'increases the post comments_counter by 1 when created' do
      expect { 
        Comment.create(author: user, post: post, text: 'Nice post!') 
      }.to change { post.reload.comments_counter }.by(1)
    end

    it 'decreases the post comments_counter by 1 when destroyed' do
      comment = Comment.create(author: user, post: post, text: 'Nice post!')
      expect { 
        comment.destroy 
      }.to change { post.reload.comments_counter }.by(-1)
    end
  end

end
