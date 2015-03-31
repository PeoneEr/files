class ScanFile
  def scan(file_name)
    accepted_formats = ['.avi', '.mp4', '.mkv']
    if File.ftype(file_name) == 'file'
      f_name = file_name.split('/').last
      #if accepted_formats.include? File.extname(f_name)
      dir_name = file_name.split('/')[-2]
      Film.delay.create(title: f_name, dir: dir_name)
      #end
    elsif File.ftype(file_name) == 'directory'
      Dir[file_name + "/*"].each { |f| scan(f)  }
    end
  end
end
