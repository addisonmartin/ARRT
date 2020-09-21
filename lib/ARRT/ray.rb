class Ray

  attr_accessor :origin, :direction

  def initialize(origin = Vector3.new(0, 0, 0), direction = Vector3.new(0, 0, 0))
    raise ArgumentError, 'origin must be a Vector3' unless origin.is_a? Vector3
    raise ArgumentError, 'direction must be a Vector3' unless direction.is_a? Vector3

    @origin = origin
    @direction = direction
  end

  def to_s
    "ray at #{@origin.to_s} facing #{@direction.to_s}"
  end

  # Returns the point along this ray at the given time.
  def at(time)
    raise ArgumentError, 'must be a Numeric' unless time.is_a? Numeric

    @origin + (time * @direction)
  end

end
