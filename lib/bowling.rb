
class BowlingGame

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
			elsif is_spare?(frame)
				frame.push(@score[idx + 1][0])
			end
		end
	end

	def calc_score
		if perfect_game?
			(@score.flatten.compact.sum + bonus_score.flatten.compact.sum)
		else
			bonus_score.flatten.compact.sum
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

game = BowlingGame.new
# game.roll(1)
# game.roll(4)

# game.roll(4)
# game.roll(5)

# game.roll(6)
# game.roll(4)

# game.roll(5)
# game.roll(5)

# game.roll(10)

# game.roll(0)
# game.roll(1)

# game.roll(7)
# game.roll(3)

# game.roll(6)
# game.roll(4)

# game.roll(10)

# game.roll(2)
# game.roll(8)
# game.roll(6)

# 10.times do
# 	game.roll(10)
# end

# p game.calc_score