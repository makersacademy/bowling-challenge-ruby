
class BowlingGame
	STARTINGSCORE = 0

	attr_reader :score, :frame_num_score

	def initialize
		@score = Array.new(10) { [] }
		@frame_num = 1
		@roll_num = 1
	end

	def roll(pins) 
		if @frame_num < 10
			p @roll_num
			if @roll_num == 1
				@score[@frame_num - 1].push(pins)
				@roll_num += 1
			elsif @roll_num == 2
				@score[@frame_num - 1].push(pins)
				@frame_num += 1
				@roll_num -= 1
			end
		end
	end

	
end
