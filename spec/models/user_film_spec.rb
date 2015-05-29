require 'rails_helper'

RSpec.describe UserFilm, :type => :model do
  it 'существует' do
    UserFilm.new
  end
end

# == Schema Information
#
# Table name: user_films
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  film_id    :integer
#  watched    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dir        :string(255)
#
