class Film < ActiveRecord::Base
  attr_accessor :serias_count

  attr_accessible :title, :dir, :timing,
                  :serias_count

  validates_presence_of :title, :dir
  validates_uniqueness_of :title

  has_many :user_films
  has_many :users, :through => :user_films

  scope :ordered, order(:title)

end

# == Schema Information
#
# Table name: films
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  dir        :string(255)
#  watched    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  timing     :string(255)      default("Просмотр не начат")
#
