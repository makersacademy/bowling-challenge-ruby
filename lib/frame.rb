class Frame
	attr_reader :roll_1, :roll_2

	def initialize(roll_1 = 0, roll_2 = 0)
		@roll_1 = roll_1
		@roll_2 = roll_2
	end

	def points
		@roll_1 + @roll_2
	end

	def spare
		true if points == 10
	end

	def strike
		true if @roll_1 == 10
	end
end