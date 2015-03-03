require 'scan_file'
require 'configliere'

namespace :files do

  desc ''
  task :scan => :environment do
    Settings.read(Rails.root.join('config', 'settings.yml'))
    p Settings
    ScanFile.new.scan(Settings['dir.url'])
  end
end
