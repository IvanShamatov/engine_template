class BoundingBoxComponent
  attr_accessor :pos, :size

  def initialize(pos, size)
    @pos, @size = pos, size
  end
end
