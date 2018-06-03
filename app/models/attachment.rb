include FileSystem

class Attachment < Pathname

  def self.create(path)
    case path.extname.downcase
    when ".jpg", ".jpeg"
      Image.new(path)
    else
      nil
    end
  end

  def view
    "Undefined"
  end

end

class Image < Attachment


  def view
    "Image: <img src='#{to_s}' />"
  end

  def url
    URI.encode ("/Inventory/" + relative_path.to_s)
  end

  def thumb(arg)
    image.thumb(arg)
  end

  def image
    Dragonfly.app.fetch_file to_s
  end
  
end
