class Vec
  def self.zero
    new(0.0, 0.0)
  end

  def self.one
    new(1.0, 1.0)
  end

  attr_accessor :x, :y

  def initialize(x = 0.0, y = 0.0)
    @x, @y = x, y
  end

  def self.[](x,y)
    new(x, y)
  end

  def to_s
    "<Vec:#{object_id} (#{x}, #{y})>"
  end

  def add(v2)
    self.class.new(x + v2.x, y + v2.y)
  end
  alias_method :+, :add

  def sub(v2)
    self.class.new(x - v2.x, y - v2.y)
  end
  alias_method :-, :sub

  def mul(v2)
    self.class.new(x * v2.x, y * v2.y)
  end

  def scale(val)
    self.class.new(x*val, y*val)
  end

  def normalize
    l = length
    self.class.new(x / l, y / l) if  l > 0
  end

  def negate
    scale(-1)
  end

  def invert
    self.class.new(1.0 / x.to_f, 1.0 / y.to_f)
  end

  def clamp(min, max)
    l = length
    scale_fact = if l < min
                  min / length
                elsif l > max
                  max / length
                else
                  1
                end

    scale(scale_fact)
  end

  def clamp_vec(min_vec, max_vec)
    self.class.new(
      [max.x, [min.x, x].max].min,
      [max.y, [min.y, y].max].min
    )
  end

  def dot(v2)
    x * v2.x + y * v2.y
  end

  def length
    Math.sqrt(sqrlen)
  end

  def sqrlen
    x * x + y * y
  end

  def distance(v2)
    Math.sqrt((x - v2.x) * (x - v2.x) + (y - v2.y) * (y - v2.y))
  end

  def sqrdist(v2)
    (x - v2.x) * (x - v2.x) + (y - v2.y) * (y - v2.y)
  end
end
