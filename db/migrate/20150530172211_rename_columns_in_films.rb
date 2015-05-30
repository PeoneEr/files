class RenameColumnsInFilms < ActiveRecord::Migration
  def change
    Film.all.map(&:dir).uniq.each do |dir|
      FilmDir.create! title: dir, serias_count: Film.where(dir: dir).count
    end

    FilmDir.all.each do |dir|
      Film.where(dir: dir.title).each do |film|
        film.update_attribute :dir, FilmDir.where(title: dir.title).first.id
      end
    end

    rename_column :films, :dir, :film_dir_id
  end
end
