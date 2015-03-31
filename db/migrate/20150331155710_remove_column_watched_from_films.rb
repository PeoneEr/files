class RemoveColumnWatchedFromFilms < ActiveRecord::Migration
  def change
    remove_column :films, :watched
  end
end
