# Portable PixMap image file format.
# Data is stored in plain-text, for ease of human readability.
class PPMImage < Image

  # P3 must be written at the top of the file.
  # This identifies that pixel data is written with ASCII encoding.
  PPM_HEADER = 'P3\n'
  # MAX_COLOR_VALUE must be written at the top of the file, beneath the image's width and height.
  # This denotes the maximum RGB color value.
  MAX_COLOR_VALUE = '255'

  # File extension for the PPM image format.
  FILE_EXTENSION = '.ppm'

  # Outputs the image's pixels data to the given file path.
  # If pixels are not passed in, then the pixels class variable is used.
  def write(file_path, pixels=nil)

    if pixels
      @pixels = pixels
    end

    puts file_path
    check_file_extension(file_path, FILE_EXTENSION)
    puts file_path

    File.open(file_path, 'w') do |output_file|

      write_header(output_file)
      write_pixels(output_file)

    end

  end

  private

  # Outputs the required metadata for the file to properly be read in PPM format.
  def write_header(output_file)

    output_file.write(PPM_HEADER)
    output_file.write("#{width} #{height}\n")
    output_file.write("#{MAX_COLOR_VALUE}\n")

  end

  def write_pixels(output_file)

    pixels.each do |pixel|

      rgb = pixel.to_rgb
      output_file.write("#{rgb.r} #{rgb.g} #{rgb.b}")

    end

  end

end