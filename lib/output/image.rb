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
end