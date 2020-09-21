class PPM

  attr_accessor :width, :height, :pixels

  def initialize(width = 0, height = 0)
    @width = Integer(width)
    @height = Integer(height)
    @pixels = Array.new(@height) { Array.new(@width) { Vector3.new } }
  end

  def to_s
    output = "PPM Image (#{@width} x #{@height}): {\n"

    (0...@height).each do |y|
      (0...@width).each do |x|
        output += "#{@pixels[y][x].to_s} "
      end
      output += "\n"
    end

    output += "}"
  end

  def write(path)
    File.open(path, 'w') do |file|
      file << "P3\n"
      file << "#{@width} #{@height} \n"
      file << "255\n"

      (0...@height).each do |y|
        (0...@width).each do |x|
          file << "#{Integer(@pixels[y][x].x)} #{Integer(@pixels[y][x].y)} #{Integer(@pixels[y][x].z)}\n"
        end
      end
    end
  end
end
