require_relative 'lib/entity_manager'
require_relative 'systems/collision_system'
require_relative 'systems/movement_system'
require_relative 'systems/user_input_system'
require_relative 'systems/render_system'

class Game
  def setup
    @manager = EntityManager.new
    # 5.times do |i|
    #   size = Vec[rand(300), rand(300)]
    #   pos = Vec[rand(WINDOW_WIDTH-size.x), rand(WINDOW_HEIGHT-size.y)]
    #   vel = Vec[rand(10)-10, rand(10)-10]
    #   @manager.add(:rectangle)
    #           .with_name("Rectangle #{i}")
    #           .with_transform(pos, vel)
    #           .with_bounding_box(pos, size)
    #           .with_color([RED, GREEN, BLUE, YELLOW, GOLD, GRAY, DARKBLUE, DARKGREEN].sample)
    # end

    10.times do |i|
      size = Vec[rand(50), 0]
      pos = Vec[rand(WINDOW_WIDTH-2*size.x)+size.x, rand(WINDOW_HEIGHT-2*size.x)+size.x]
      vel = Vec[rand(10)-10, rand(10)-10]
      @manager.add(:circle)
              .with_name("circle #{i}")
              .with_transform(pos, vel)
              .with_bounding_box(pos, size)
              .with_color([GREEN, RED, GOLD, YELLOW, BLUE, WHITE].sample)
              .with_mass(size.x*size.x)
    end

    @update_systems = [
      UserInputSystem.new(@manager),
      CollisionSystem.new(@manager),
      MovementSystem.new(@manager),
    ]
    @draw = RenderSystem.new(@manager)
  end

  def update
    @manager.update
    @update_systems.each(&:call)
  end

  def draw
    @draw.call
  end
end
