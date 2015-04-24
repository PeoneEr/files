namespace :users do

  desc 'Обновление серий сериалов'
  task :update_films => :environment do
    User.all.each do |user|
      dirs = user.user_films.map(&:dir).uniq

      Film.where(dir: dirs).each do |film|
        film.user_films.delay.create(user_id: user.id, film_id: film.id, dir: film.dir)
      end
    end
  end
end
