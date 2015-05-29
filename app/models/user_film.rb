class UserFilm < ActiveRecord::Base
  attr_accessible :user_id, :film_id, :watched, :dir

  validates_presence_of :film_id, :dir, :user_id

  validates_uniqueness_of :film_id, scope: :user_id

  belongs_to :user
  belongs_to :film

  def watched?
    watched
  end

  searchable do
    integer :user_id
    integer :film_id
    boolean :watched
    string :dir
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
