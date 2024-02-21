class RenderSystem
  attr_reader :em

  def initialize(em)
    @em = em
  end

  def call
    @em.all.each do |e|
      case e.tag
      when :rectangle
        DrawRectangle(e.transform.pos.x, e.transform.pos.y, e.bbox.size.x, e.bbox.size.y, e.color.color)
      when :circle
        DrawCircle(e.transform.pos.x, e.transform.pos.y, e.bbox.size.x, e.color.color)
        # DrawText("#{e.id}", e.transform.pos.x, e.transform.pos.y, 30, RAYWHITE)
      end
      DrawFPS(50, 50)
    end
  end
end
