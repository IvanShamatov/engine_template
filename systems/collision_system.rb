class CollisionSystem
  attr_reader :em

  def initialize(em)
    @em = em
  end

  def call
    @em.by_tag(:circle)&.each do |e|
      if e.transform.pos.x <= e.bbox.size.x || e.transform.pos.x >= WINDOW_WIDTH - e.bbox.size.x
        e.transform.vel.x *= -1
      end

      if e.transform.pos.y <= e.bbox.size.x || e.transform.pos.y >= WINDOW_HEIGHT - e.bbox.size.x
        e.transform.vel.y *= -1
      end

      # @em.by_tag(:circle).each do |other|
      #   next if other.id == e.id
      #   if e.transform.pos.sqrdist(other.transform.pos) <= (e.bbox.size.x + other.bbox.size.x)**2
      #     balls_collide(e, other)
      #   end
      # end
    end

    @em.by_tag(:rectangle)&.each do |e|
      if e.transform.pos.x <= 0 || e.transform.pos.x >= WINDOW_WIDTH - e.bbox.size.x
        e.transform.vel.x *= -1
      end

      if e.transform.pos.y <= 0 || e.transform.pos.y >= WINDOW_HEIGHT - e.bbox.size.y
        e.transform.vel.y *= -1
      end

      @em.by_tag(:rectangle).each do |other|
        next if other.id == e.id
        e.tranform.pos => x1, y1
        if e.transform.pos.sqrdist(other.transform.pos) <= (e.bbox.size.x + other.bbox.size.x)**2
          balls_collide(e, other)
        end
      end
    end
  end

  def balls_collide(e1, e2)
    m1, m2 = e1.mass, e2.mass
    u1, u2 = e1.transform.vel, e2.transform.vel
    v1 = u1.scale((m1-m2)/(m1+m2).to_f) + u2.scale(2*m2/(m1+m2).to_f)
    v2 = u2.scale((m2-m1)/(m1+m2).to_f) + u1.scale(2*m1/(m1+m2).to_f)
    e1.transform.vel = v1
    e2.transform.vel = v2
    while e1.transform.pos.sqrdist(e2.transform.pos) <= (e1.bbox.size.x + e2.bbox.size.x)**2
      e1.transform.pos += e1.transform.vel
      e2.transform.pos += e2.transform.vel
    end
  end
end
