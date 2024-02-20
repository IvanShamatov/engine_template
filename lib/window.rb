class Window
  def initialize(game)
    @game = game
  end

  def run!
    SetTargetFPS(FPS)

    InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_TITLE)
      @game.setup

      until WindowShouldClose()
        @game.update

        BeginDrawing()
          ClearBackground(CLEAR_BACKGROUND_COLOR)
          @game.draw
        EndDrawing()
      end
    CloseWindow()
  end
end
