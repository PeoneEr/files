class CreateUserFilms < ActiveRecord::Migration
  def change
    create_table :user_films do |t|
      t.belongs_to :user
      t.belongs_to :film
      t.boolean :watched
      t.timestamps
    end

    Film.where(watched: true).each do |e|
      UserFilm.create(user_id: 1, film_id: e.id, watched: true)
    end
  end
end
