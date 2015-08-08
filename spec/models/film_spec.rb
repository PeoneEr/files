require 'rails_helper'

RSpec.describe Film, :type => :model do
  it 'существует' do
    Film.new
  end

  it 'создает фильм' do
    film = Film.new(title: 'title', dir: 'dir')
    film.save!

    expect(Film.last.title).to eq('title')
  end
end

# == Schema Information
#
# Table name: films
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  film_dir_id :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
