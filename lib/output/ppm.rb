# Portable PixMap image file format.
# Data is stored in plain-text, for ease of human readability.
class PPMImage < Image

  # P3 must be written at the top of the file.
  # This identifies that pixel data is written in RGB with ASCII encoding.
  PPM_HEADER = 'P3\n'

  # Outputs the image's pixels data to the given file path.
  # If pixels are not passed in, then the pixels class variable is used.
  def write(file_path, pixels=nil)

    unless pixels
      @pixels = pixels
    end

    File.open(file_path, 'w') do |output_file|

      write_header(output_file)
      write_pixels(output_file)

    end

  end

  private

  # Outputs the required metadata for the file to properly be read in PPM format.
  def write_header(output_file)

    output_file.write(PPM_HEADER)
    output_file.write("#{width} #{height}")

  end

  def write_pixels(output_file)

    pixels.each do |pixel|

      output_file.write(pixel.to_rgb)

    end

  end

end