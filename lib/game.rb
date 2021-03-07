require_relative 'frame'

class Game
attr_reader :frame_num, :score_card

	def initialize
		@frame_num = 1
		@score_card = []
	end

	def frame_init (roll_1, roll_2 = 0, frame = Frame.new)
		frame.roll(roll_1)
		frame.roll(roll_2)
		@score_card << frame.record_roll
	end

	def play
		while @frame_num < 11 do
			puts "-----------------------"
			puts "**Frame #{@frame_num}**"
			puts "-----------------------"
			puts "Enter First Roll"
			roll_1 = gets.chomp
			return if roll_1 == "exit"
				if roll_1 != 10
					puts "Enter Second Roll"
					roll_2 = gets.chomp 
					return if roll_2 == "exit"
				end
			frame_init(roll_1.to_i, roll_2.to_i)
			@frame_num += 1
		end
		print_score
	end

private

	def print_score
		@score_card.each_with_index do |scores, frame|
			puts "Frame #{1 + frame}, Score: #{scores.sum}"
			if scores[0] == 10
			puts	"Strike!"
			elsif scores.sum == 10 && scores[0] != 10
			puts 	"Spare!"
			end
		end
	end
end