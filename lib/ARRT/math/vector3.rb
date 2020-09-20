class Vector3

  attr_accessor :x, :y, :z

  def initialize(x=0.0, y=0.0, z=0.0)
    @x = x
    @y = y
    @z = z
  end

  def to_s
    "<#{@x}, #{@y}, #{@z}>"
  end

end
