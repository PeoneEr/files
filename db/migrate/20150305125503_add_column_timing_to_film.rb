class AddColumnTimingToFilm < ActiveRecord::Migration
  def change
    add_column :films, :timing, :string, :default => 'Просмотр не начат'
  end
end
