namespace :users do

  desc 'Обновление серий сериалов'
  task :update_films => :environment do
    User.all.each do |user|
      dirs = user.user_films.map(&:dir).uniq

      FilmDir.where(title: dirs).each do |filmdir|
        filmdir.films.each do |film|
          film.user_films.delay.create(user_id: user.id, film_id: film.id, dir: film.title)
        end
      end
    end
  end
end
