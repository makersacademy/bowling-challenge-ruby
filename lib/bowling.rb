
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

	def bonus_score
		@score.each_with_index do |frame, idx|
			if is_strike?(frame)
				unless @score[idx + 1] == nil
					frame.push(@score[idx + 1][0])
					frame.push(@score[idx + 1][1])
				else 
					frame.push(@score[idx][0])
				end
			end
		end

		@score.each_with_index do |frame, idx|
			if is_spare?(frame)
				frame.push(@score[idx + 1][0])
			end
		end
	end

	private 
	def perfect_game?
		@score.flatten.all? {|el| el == 10} 
	end

	def is_strike?(frame)
		frame.include?(10)
	end

	def is_spare?(frame)
		!frame.include?(10) && frame.compact.sum == 10
	end

end
