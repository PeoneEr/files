every :day, :at => '5:00 am' do
  rake 'files:scan'

end

every :day, :at => '5:45 am' do
  rake 'users:update_films'
end
