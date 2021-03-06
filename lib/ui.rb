require_relative 'game'
require_relative 'frame'

class Ui

  attr_reader :game, :round_points, :scorecard

	def initialize (game = Game)
		@game = game.create
		@round_points = []
		@scorecard = []
	end

	def play_bowling
		while game.turn < 9 do
			game.begin_frame
			mark_points
			
		end
	end

	def mark_points
		round_points << gets.chomp.to_i
		game.current_frame.add_roll(round_points[-1])
		game.spare_or_strike? if round_points.sum == 10
		add_round_to_scorecard
	end

	def add_round_to_scorecard
		scorecard << round_points
	end

end