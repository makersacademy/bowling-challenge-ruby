
class Frame
	def initialize
		@score = []
	end

	def score
		@score << first_roll

		if first_roll < 10
			@score << second_roll
		end
	end

	def roll
		first_roll
	end

	def first_roll
		rand(10)
	end

	def second_roll
		rand(10)
	end
end