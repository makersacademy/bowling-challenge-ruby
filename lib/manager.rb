require './lib/user_messages.rb'

    def store_frame 
        scorecard = []
        scorecard << @frame_record
    end 



# What is the purpose or SINGLE responsibility for this Class? We might need to consider re-factoring it at some point.
# It should keep track what Frame we are on
# It should store the frame records in a hash
# It should keep the running total of the game score