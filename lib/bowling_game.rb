require_relative 'frame'

class BowlingGame 
	attr_reader :frames, :total

	def initialize
		@frames = []
		@total = 0
	end
	
	def counting_points
		@frames.each do |frame|
			@total += frame.points
		end
		@total
	end

	def add(frame)
		if frame.id == 1
			@frames << frame
		elsif @frames[frame.id - 2].strike?
			@total += frame.points
			@frames << frame
		else
			@frames << frame
		end
	end
end