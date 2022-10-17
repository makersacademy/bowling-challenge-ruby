require './lib/frame.rb'
class Scorecard 
    def initialize
        @frames = []
    end

    def add(frame)
        @frames << frame
    end

    def scoring_frames(number)
        if @frames[number - 1].strike?
            if @frames[number].strike?
                20 + @frames[number + 1].roll_one
            end
        end

         @frames[number].sum + 10

        elsif @frames[number - 1].spare?
            @frames[number].roll_one + 10
        else
            @frames[number - 1].sum
        end
    end

    def total_score
        total = (1..10).map do |number|
            scoring_frames(number)   
        end
        total.sum
    end

end



