class Sphere

  attr_accessor :center, :radius

  def initialize(center = Vector3.new(0, 0, 0), radius = 0)
    raise ArgumentError, 'center must be a Vector3' unless center.is_a? Vector3

    @center = center
    @radius = BigDecimal(radius)
  end

  def to_s
    "sphere centered at #{@origin.to_s} with radius #{@radius.to_s('F')}"
  end

  def intersection(ray)
    offset = ray.center - @origin

    a = ray.direction.dot(ray.direction)
    b = 2 * offset.dot(ray.direction)
    c = offset.dot(offset) - (@radius * @radius)

    discriminant = (b * b) - (4 * a * c)
    discriminant.positive?
  end

end
