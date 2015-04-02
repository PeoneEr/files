class RemoveColumnTimingAtFilm < ActiveRecord::Migration
  def change
    remove_column :films, :timing
  end
end
