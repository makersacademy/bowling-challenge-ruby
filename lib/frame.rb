class Frame

    attr :first_input, :second_input

    def play
        first_message
        if @first_input != "strike" then 
        second_message
        end 
    end 

    def first_message 
        puts "Please enter the result of your 1st Roll"
        @first_input = gets.chomp
    end

    def second_message
        puts "Please enter the result of your 2nd Roll"
        @second_input = gets.chomp
    end 

end 

# This class Frame is only responsible for asking the user for their input for the 1st Roll &
# the 2nd roll. 
# It records the 1st roll and 2nd roll as a hash 
# It should do nothing else but that!