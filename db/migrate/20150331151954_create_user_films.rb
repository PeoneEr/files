class CreateUserFilms < ActiveRecord::Migration
  def change
    create_table :user_films do |t|
      t.belongs_to :user
      t.belongs_to :film
      t.boolean :watched
      t.timestamps
    end
  end
end
