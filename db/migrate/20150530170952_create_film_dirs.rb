class CreateFilmDirs < ActiveRecord::Migration
  def change
    create_table :film_dirs do |t|
      t.string :title
      t.integer :serias_count

      t.timestamps null: false
    end

  end
end
