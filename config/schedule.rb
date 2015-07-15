every :day, :at => '5:00 AM' do
  rake 'files:scan'

end

every :dat, :at => '5:45 AM' do
  rake 'users:update_films'
end
