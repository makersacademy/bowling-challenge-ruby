require_relative 'game'
require_relative 'frame'

class Ui

  attr_reader :game, :scorecard

	def initialize (game = Game)
		@game = game.create
		@scorecard = []
	end

	def play_bowling
		while game.turn < 9 do
			
	
		end
	end

	def throw_1(points = gets.chomp.to_i)	
		game.roll(points)
	end

	def throw_2(points = gets.chomp.to_i)	
		game.roll(points)
	end

	def add_to_scorecard
		scorecard[-1] << game.get_score
	end

	def begin_frame
		game.begin_frame
		scorecard << [] 
	end

	def bonus
		strike_bonus = scorecard[-1]
		return scorecard[-2] = scorecard[-2] + strike_bonus  if scorecard[-2] == ([10] || [0,10])
		spare_bonus = scorecard[-2][0]
		scorecard[-2] = scorecard[-2] + spare_bonus  if scorecard[-2].sum == 10
	end

end