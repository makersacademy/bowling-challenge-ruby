require_relative 'game'
require_relative 'frame'

class Ui

  attr_reader :game, :scoreboard

	def initialize (game = Game)
		@game = game.create
		@scoreboard = [[], [], [], [], [], [], [], [], [], []]
	end

	def play_bowling
		while game.turn < 9 do

		end
	end

end