require 'bundler'
Bundler.require
require_relative 'utils/setup_dll'
require_relative 'utils/vec'
require_relative 'game'
require_relative 'lib/config'
require_relative 'lib/window'

game = Game.new
Window.new(game).run!
