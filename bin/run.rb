require 'lib/output'

rainbow_gradient = PPMImage.new(256, 256)

pixels = []

(0..rainbow_gradient.height).each do |h|
  (0..rainbow_gradient.width).each do |w|
    pixels[h][w].r = 1
    pixels[h][w].g = 1
    pixels[h][w].b = 1
  end
end

output_path = File.join('~', 'RubymineProjects', 'ARRT', 'examples', 'rainbow_gradient.ppm')

rainbow_gradient.write(output_path, pixels)