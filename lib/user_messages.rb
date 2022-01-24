class Messages

    def play
        frame_message
        first_message
        if @@first_input != "strike" then 
        second_message
        end 
    end 

    def frame_message
        puts "Please enter the frame number"
        @@frame_number = gets.chomp
    end 

    def first_message 
        puts "Please enter the result of your 1st Roll"
        @@first_input = gets.chomp
    end

    def second_message
        puts "Please enter the result of your 2nd Roll"
        @second_input = gets.chomp
    end 

    def save_input 
        frame_record = {
    
        }
        frame_record[:frame_number] = @@frame_number
        frame_record[:roll_1] = @@first_input
        frame_record[:roll_2] = @@second_input

        puts frame_record
    end 

end 