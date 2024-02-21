class MovementSystem
  attr_reader :em

  def initialize(em)
    @em = em
  end

  def call
    @em.all.each do |e|
      e.transform.pos += e.transform.vel
      # e.transform.vel.y += 0.5 # gravity
    end
  end
end
