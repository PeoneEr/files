require 'scan_file'
require 'configliere'

namespace :files do

  desc 'Запись новых фильмов и сериалов'
  task :scan => :environment do
    Settings.read(Rails.root.join('config', 'settings.yml'))
    ScanFile.new.scan(Settings['dir.films_url'])
    ScanFile.new.scan(Settings['dir.serials_url'])
  end
end
