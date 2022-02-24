require_relative 'frame'

class BowlingGame 
	attr_reader :frames, :total

	def initialize
		@frames = []
		@total = 0
	end
	
	def add(frame)
		@frames << frame
		@total += frame.points
		extra_points(frame) if frame.id != 1
		result
	end

	private

	def extra_points(frame)
		regular_(frame)
		@total += frame.roll_1 if frame.id > 2 && previous_2_(frame).strike?
	end

	def regular_(frame)
		if previous_(frame).strike?
			@total += frame.points
		elsif previous_(frame).spare? 
			@total += frame.roll_1
		end
	end

	def previous_(frame)
		@frames[frame.id - 2]
	end

	def previous_2_(frame)
		@frames[frame.id - 3]
	end

	def perfect_game
		"Perfect Game!" if @total == 300
	end

	def gutter_game
		"Aim for the white things in the middle, next time!" if @total == 0
	end

	def regular_game
		"Great job, your final score is #{@total}" if @frames.length == 10 && !perfect_game || !gutter_game
	end

	def result
		regular_game
		perfect_game
		gutter_game
	end
end
