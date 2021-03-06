require_relative 'game'
require_relative 'frame'

class Ui

  attr_reader :game, :scorecard

	def initialize (game = Game)
		@game = game.create
		@scorecard = [[]]
	end

	def play_bowling
		while game.turn < 9 do
			
	
		end
	end

	def throw_ball_1(points = gets.chomp.to_i)	
		game.roll_1(points)
	end

	def throw_ball_2(points = gets.chomp.to_i)	
		game.roll_2(points)
	end

	def add_to_scorecard
		scorecard[-1] << game.get_score
		game.clear_score
		scorecard << []
	end

end