require_relative 'frame'

class Scorecard

    attr_reader :scorecard

    def initialize
        @scorecard = []
    end

    def add_score(score1,score2)
        add_frame(score1,score2)
    end

    def running_total
        @scorecard.sum
    end

end


private

def add_frame(score1,score2)
    @current_frame = Frame.new(score1,score2)
    @scorecard.push(@current_frame.bowl1)
    @scorecard.push(@current_frame.bowl2)
end
