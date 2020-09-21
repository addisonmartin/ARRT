class Camera

  attr_accessor :aspect_ratio, :viewport_width, :viewport_height, :focal_length, :location

  def initialize(aspect_ratio = 0, viewport_height = 0, focal_length = 0, location = Vector3.new)
    @aspect_ratio = BigDecimal(aspect_ratio)
    @viewport_height = BigDecimal(viewport_height)
    @viewport_width = BigDecimal(@aspect_ratio * viewport_height)
    @focal_length = BigDecimal(focal_length)
    @location = location
  end

  def to_s
    "camera (#{@viewport_width.to_s('F')} x #{@viewport_height.to_s('F')})(#{@aspect_ratio.to_s('F')}) at #{@location.to_s} with focal length #{@focal_length.to_s('F')}"
  end

end
