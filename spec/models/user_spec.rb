require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'существует' do
    User.new
  end

  it 'пользователь = пользователь'  do
    user = User.new(email: 'qq@qq.qq', password: '12345678')
    user.save!

    expect(user).to be_a(User)
  end

  it 'первый пользователь с мылом qqq@qq.qq' do
    user = User.new(email: 'qqq@qq.qq', password: '12345678')
    user.save!

    expect(User.last.email).to eq('qqq@qq.qq')
  end
end
