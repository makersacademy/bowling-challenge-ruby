require 'game'

class Ui

  attr_reader :game

	def initialize (game = Game)
		@game = game.create
	end

end