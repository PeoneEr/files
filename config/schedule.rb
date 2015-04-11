every 3.hours do
  rake 'files:scan'
  rake 'users:update_films'
end
