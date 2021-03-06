require_relative 'game'
require_relative 'frame'

class Ui

  attr_reader :game, :scorecard, :user_input

	def initialize (game = Game)
		@game = game.create
		@scorecard = [[]]
		@user_input
	end

	def play_bowling
		while game.turn < 9 do

			game.begin_frame
			user_input = gets.chomp.to_i
			game.roll_1(user_input)
			add_round_to_scorecard
			
			break if user_input == "11" #for testing
		end
	end

	def add_round_to_scorecard
		scorecard[-1] << user_input
		scorecard << []
	end

end