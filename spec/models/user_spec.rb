require 'rails_helper'

RSpec.describe User, type: :model do
  it 'ensures email presence' do
    user = User.new(email: 'sample@example.com', password: '123456', password_confirmation: '123456').save
    expect(user).to eq(false)
  end

  it 'ensures username presence' do
    user = User.new(username: 'username', password: '123456', password_confirmation: '123456').save
    expect(user).to eq(false)
  end

  it 'ensures password presence' do
    user = User.new(username: 'username', email: 'sample@example.com').save
    expect(user).to eq(false)
  end

  it 'should save user successfully' do
    user = User.new(username: 'username', email: 'sample@example.com', password: '123456', password_confirmation: '123456').save
    expect(user).to eq(true)
  end

  it 'avoid email duplicates' do
    User.create(username: 'username', email: 'sample@example.com', password: '123456', password_confirmation: '123456')
    user = User.new(username: 'username', email: 'sample@example.com', password: '123456', password_confirmation: '123456').save
    expect(user).to eq(false)
  end
end
