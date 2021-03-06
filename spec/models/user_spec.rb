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

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
