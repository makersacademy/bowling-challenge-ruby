require_relative 'frame'

class BowlingGame 
	attr_reader :frames, :total

	def initialize
		@frames = []
		@total = 0
	end
	
	def add(frame)
		@total += frame.points
		extra_points(frame)
	end

	def extra_points(frame)
		if frame.id == 1
			@frames << frame
		elsif previous_(frame).strike?
			@total += frame.points
			@frames << frame
		elsif previous_(frame).spare? 
			@total += frame.roll_1
			@frames << frame
		end
	end

	def previous_(frame)
		@frames[frame.id - 2]
	end


end