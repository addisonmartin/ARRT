# Image is the abstract base class for all output image formats.
class Image
  # Width and height represent the width and height of the image in pixels.
  attr_accessor :width, :height

  # Pixels stores the RGB values for each pixel within the image.
  attr_accessor :pixels

  def initialize(width, height, pixels=[])
    @width = width
    @height = height

    @pixels = pixels
  end

  # Checks if the given file path ends with the given file extension.
  # If the file path doesn't end with the file extension, it appends it.
  def check_file_extension(file_path, file_extension)

    unless file_path.end_with?(file_extension)
      file_path << file_extension
    end

  end

end