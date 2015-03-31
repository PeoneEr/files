class UserFilm < ActiveRecord::Base
  attr_accessible :user_id, :film_id, :watched

  belongs_to :user
  belongs_to :film

  def watched?
    watched
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
#
