require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name' do
    user = User.new(name: 'Tom')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end
  
  it 'is valid with posts_counter as an integer greater than or equal to zero' do
    user = User.new(name: 'Tom', posts_counter: 0)
    expect(user).to be_valid
  end

  it 'is not valid with posts_counter as a negative integer' do
    user = User.new(name: 'Tom', posts_counter: -1)
    expect(user).to_not be_valid
  end

  it 'is not valid with posts_counter as a non-integer' do
    user = User.new(name: 'Tom', posts_counter: 'string')
    expect(user).to_not be_valid
  end

end
