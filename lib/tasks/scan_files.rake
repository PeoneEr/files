require 'scan_file'
require 'configliere'

namespace :files do

  desc 'Запись новых фильмов и сериалов'
  task :scan => :environment do
    Settings.read(Rails.root.join('config', 'settings.yml'))
    if Rails.env.production?
      ScanFile.new.scan(Settings['dir.films_url'])
      ScanFile.new.scan(Settings['dir.serials_url'])
    else
      ScanFile.new.scan(Settings['dir.url'])
    end
  end

  desc 'Реиндекс фильмов'
  task :reindex => :environment do
    FilmDir.delay(:queue => :critical).index
  end
end
