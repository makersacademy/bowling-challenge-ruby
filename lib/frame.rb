class Frame
	attr_reader :id, :roll_1, :roll_2, :roll_3

	def initialize(id, roll_1 = 0, roll_2 = 0, roll_3 = 0)
		@id = id
		@roll_1 = roll_1
		@roll_2 = roll_2
		@roll_3 = roll_3
	end

	def points
		@points = @roll_1 + @roll_2 + @roll_3
	end

	def spare?
		@roll_1 + @roll_2 == 10 
	end

	def strike?
		@roll_1 == 10 
	end

	def rolling?
		@id == 10 && spare? || strike?
	end
end