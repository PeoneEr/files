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
