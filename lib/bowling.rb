
class BowlingGame
	STARTINGSCORE = 0

	attr_reader :score

	def initialize
		@score = Array.new(10) { [] }
		@frame_num = 1
		@roll_num = 1
	end

	def roll(pins) 
		if @frame_num < 10
			if pins < 10 && @roll_num == 1
				@score[@frame_num - 1].push(pins)
				@roll_num += 1
			elsif pins < 10 && @roll_num == 2
				@score[@frame_num - 1].push(pins)
				@frame_num += 1
				@roll_num -= 1
			else 
				@score[@frame_num - 1].push(pins)
				@frame_num += 1
			end
		else
			@score[9].push(pins)
		end
	end


end
