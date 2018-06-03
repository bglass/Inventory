include FileSystem

class Item < Pathname

  attr_reader :path

  def name
    basename
  end

  def attachment?
    attachment.count > 0
  end

  def attachment
    child_files.map{|c| Attachment.create(c) }.compact
  end

  def content?
    content.count > 0
  end

  def content
    child_dirs.map { |d| Item.new(d) }
  end

  def url
    "/show/"+ relative_path.to_s
  end

  def location
    Item.new(parent)
  end


  def relative_path
    relative_path_from Pathname(Rails.application.config.inventory_root).expand_path
  end

end
