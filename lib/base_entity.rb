require_relative '../components/name_component'
require_relative '../components/shape_component'
require_relative '../components/transform_component'
require_relative '../components/bounding_box_component'
require_relative '../components/color_component'

class BaseEntity
  attr_reader :id, :tag, :alive

  # components
  attr_reader :transform, :name, :shape, :bbox, :color, :mass

  def initialize(id, tag)
    @id, @tag = id, tag
    @alive = true

    @transform = nil
    @name = nil
    @shape = nil
    @bbox = nil
    @color = nil
  end

  def with_name(name)
    @name = NameComponent.new(name)
    self
  end

  def with_bounding_box(pos, size)
    @bbox = BoundingBoxComponent.new(pos, size)
    self
  end

  def with_transform(pos, vel)
    @transform = TransformComponent.new(pos, vel)
    self
  end

  def with_shape(shape)
    @shape = ShapeComponent.new(shape)
    self
  end

  def with_color(color)
    @color = ColorComponent.new(color)
    self
  end

  def with_mass(mass)
    @mass = mass
  end

  def destroy
    @alive = false
  end
end
