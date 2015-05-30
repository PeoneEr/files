class ScanFile
  def scan(file_name)
    accepted_formats = ['.avi', '.mp4', '.mkv']

    if File.ftype(file_name) == 'file'
      f_name = file_name.split('/').last
      if accepted_formats.include? File.extname(f_name)
        dir_name = file_name.split('/')[-2]
        film_dir = FilmDir.find_or_create_by title: dir_name
        film_dir.films.create title: f_name
        film_dir.increment! :serias_count if film_dir.present? && (film_dir.serias_count.to_i < film_dir.films.count.to_i)
      end
    elsif File.ftype(file_name) == 'directory'
      Dir[file_name + "/*"].each { |f| scan(f)  }
    end
  end
end
