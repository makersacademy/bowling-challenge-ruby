class Frame
	attr_reader :roll_count, :pin_count, :record_roll

	def initialize
		@roll_count = 1
		@pin_count = 10
		@record_roll = []
	end

	def roll(roll_input)
		return if @record_roll[0] == 10
		@pin_count -= roll_input
		@record_roll << roll_input
		strike_check
	end	
	
private 	

	def strike_check
		@record_roll << 0 if @record_roll[0] == 10
	end

end