require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Tom') }

  it 'is valid with a title' do
    post = Post.new(title: 'My First Post', author: user)
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = Post.new(title: nil, author: user)
    expect(post).to_not be_valid
  end

  it 'is not valid with a title longer than 250 characters' do
    long_title = 'a' * 251
    post = Post.new(title: long_title, author: user)
    expect(post).to_not be_valid
  end

  it 'is valid with comments_counter as an integer greater than or equal to zero' do
    post = Post.new(title: 'Test', author: user, comments_counter: 0)
    expect(post).to be_valid
  end

  it 'is not valid with comments_counter as a negative integer' do
    post = Post.new(title: 'Test', author: user, comments_counter: -1)
    expect(post).to_not be_valid
  end

  it 'is valid with likes_counter as an integer greater than or equal to zero' do
    post = Post.new(title: 'Test', author: user, likes_counter: 0)
    expect(post).to be_valid
  end

  it 'is not valid with likes_counter as a negative integer' do
    post = Post.new(title: 'Test', author: user, likes_counter: -1)
    expect(post).to_not be_valid
  end
end
