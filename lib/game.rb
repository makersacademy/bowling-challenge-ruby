require_relative './frame'
require_relative './roll'
require_relative './scorecard'

class Game 

    attr_reader :scorecard
    
    def initialize 
        @round = 1 
        @scorecard = Scorecard.new
    end

    def run_game 

        while @round < 10 do
            frame = Frame.new
            puts "Input roll"
            roll_1 = gets.chomp.to_i
            frame.add_roll_1(roll_1)
            unless roll_1 == 10 
                puts "Input roll"
                roll_2 = gets.chomp.to_i
                frame.add_roll_2(roll_2)
            end
            frame.end_frame
            @scorecard.add_frame(frame)
            @scorecard.update_score
            puts "At the end of frame #{@round}, your total score is #{@scorecard.total_score}"
            @round += 1 
        end
    end

end
