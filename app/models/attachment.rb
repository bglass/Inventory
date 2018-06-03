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

end
