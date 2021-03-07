require_relative 'frame'

class Game
attr_reader :frame_num, :score_card

	def initialize
		@frame_num = 0
		@score_card = []
	end

	def frame_init (roll_1, roll_2, frame = Frame.new)
		frame.roll(roll_1)
		frame.roll(roll_2)
		@score_card << frame.record_roll
	end


end