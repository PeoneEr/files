class FilmDir < ActiveRecord::Base
  attr_accessible :title, :serias_count

  has_many :films

  validates_presence_of :title
  validates_uniqueness_of :title

  searchable do
    text :title

    integer :user_id, :multiple => true do
      films.map { |m| m.users.map(&:id) }.flatten
    end
  end
end

# == Schema Information
#
# Table name: film_dirs
#
#  id           :integer          not null, primary key
#  title        :string
#  serias_count :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
