module FileSystem

  def child_files
    child_node_paths.select do |n|
      n.file?
    end
  end

  def child_dirs
    child_node_paths.select do |n|
      n.directory? && !dotfile?(n)
    end
  end

  def child_node_paths
    children.map {|p| p} rescue binding.pry
  end

  def dotfile?(fname)
    basename.to_s[0] == '.'
  end

  def stem
    basename extname
  end

  def relative_path
    relative_path_from Pathname(Rails.application.config.inventory_root).expand_path
  end


end
