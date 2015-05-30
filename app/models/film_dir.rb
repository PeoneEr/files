class FilmDir < ActiveRecord::Base
  attr_accessible :title, :serias_count

  has_many :films

  validates_presence_of :title
  validates_uniqueness_of :title

  searchable do
    text :title

    #integer :user_id, :multiple => true do
      #films.map { |m| m.users.map(&:id) }.flatten
    #end
  end
end
