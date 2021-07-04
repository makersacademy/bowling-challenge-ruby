class Frame
	attr_reader :id, :roll_1, :roll_2

	def initialize(id, roll_1 = 0, roll_2 = 0)
		@id = id
		@roll_1 = roll_1
		@roll_2 = roll_2
	end

	def points
		@points = @roll_1 + @roll_2
	end

	def spare
		true if points == 10
	end

	def strike
		true if @roll_1 == 10
	end

	def additional_points(extra_1, extra_2)
		@total = @points + extra_1 + extra_2
	end

	def total_points
		spare || strike ? @total : @points
	end
end