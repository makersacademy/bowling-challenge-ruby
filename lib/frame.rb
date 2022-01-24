require './lib/user_messages'

class Frame 
    
    def save_input 
        frame_record = {}
        frame_record[:frame_number] = @@frame_number
        frame_record[:roll_1] = @@first_input
        frame_record[:roll_2] = @@second_input
    end 

end 
