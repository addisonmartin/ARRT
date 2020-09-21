class Vector3

  attr_accessor :x, :y, :z

  def initialize(x = 0.0, y = 0.0, z = 0.0)
    @x = BigDecimal(x)
    @y = BigDecimal(y)
    @z = BigDecimal(z)
  end

  def to_s
    "<#{@x.to_s('F')}, #{@y.to_s('F')}, #{@z.to_s('F')}>"
  end

  def ==(other)
    return false unless other.is_a? Vector3

    ((@x == other.x) and (@y == other.y) and (@z == other.z))
  end

  def length
    Math.sqrt(squared_length)
  end

  def squared_length
    ((@x * @x) + (@y * @y) + (@z * @z))
  end

  def unit_vector
    self / length
  end

  def -@
    self * -1
  end

  def +(other)
    raise ArgumentError, 'must be a Vector3' unless other.is_a? Vector3

    Vector3.new(@x + other.x, @y + other.y, @z + other.z)
  end

  def -(other)
    raise ArgumentError, 'must be a Vector3' unless other.is_a? Vector3

    Vector3.new(@x - other.x, @y - other.y, @z - other.z)
  end

  def *(other)
    if other.is_a? Numeric
      other = BigDecimal(other)

      Vector3.new(@x * other, @y * other, @z * other)
    elsif other.is_a? Vector3
      Vector3.new(@x * other.x, @y * other.y, @z * other.z)
    else
      raise ArgumentError, 'must be a Vector3 or Numeric'
    end
  end

  def /(other)
    if other.is_a? Numeric
      other = BigDecimal(other)

      Vector3.new(@x / other, @y / other, @z / other)
    elsif other.is_a? Vector3
      Vector3.new(@x / other.x, @y / other.y, @z / other.z)
    else
      raise ArgumentError, 'must be a Vector3 or Numeric'
    end
  end

  # Adds support for 3 * vector3, instead of just vector3 * 3, etc.
  def coerce(other)
    raise TypeError, "#{self.class} can't be coerced into #{other.class}" unless other.is_a? Numeric

    [self, other]
  end

  def dot(other)
    ((@x * other.x) + (@y * other.y) + (@z * other.z))
  end

  def cross(other)
    Vector3.new(
      ((@y * other.z) - (@z * other.y)),
      ((@z * other.x) - (@x * other.z)),
      ((@x * other.y) - (@y * other.x))
    )
  end

end
