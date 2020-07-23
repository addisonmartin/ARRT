class Vector3

  attr_accessor :x, :y, :z

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def to_rgb
    { r: @x, g: @y, b: @z }
  end

end