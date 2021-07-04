class Frame
	attr_reader :id, :roll_1, :roll_2, :points

	def initialize(id, roll_1 = 0, roll_2 = 0)
		@id = id
		@roll_1 = roll_1
		@roll_2 = roll_2
	end

	def points
		@points = @roll_1 + @roll_2
	end

	def spare?
		points == 10 && @roll_2 != 0 ? true : false
	end

	def strike?
		@roll_1 == 10 ? true : false
	end
end