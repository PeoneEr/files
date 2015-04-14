require 'rails_helper'

RSpec.describe UserFilm, :type => :model do
  it 'существует' do
    UserFilm.new
  end
end
