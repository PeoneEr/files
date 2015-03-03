class ScanFile
  def scan(file_name)
    if File.ftype(file_name) == 'file'
      f_name = file_name.split('/').last
      dir_name = file_name.split('/')[-2]
      Film.create(title: f_name, dir: dir_name)
    elsif File.ftype(file_name) == 'directory'
      Dir[file_name + "/*"].each { |f| scan(f)  }
    end
  end
end
