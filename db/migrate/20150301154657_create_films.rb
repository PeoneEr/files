class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.string :dir
      t.boolean :watched
      t.timestamps
    end
  end
end
