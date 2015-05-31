every 3.hours do
  rake 'files:scan'
  rake 'files:reindex'

  rake 'users:update_films'
end
