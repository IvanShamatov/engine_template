class MovementSystem
  attr_reader :em

  def initialize(em)
    @em = em
  end

  def call
    @em.all.each do |e|
      e.transform.pos += e.transform.vel
    end
  end
end
