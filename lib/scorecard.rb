require_relative 'frame'

class Scorecard

    attr_reader :scorecard

    def initialize
        @scorecard = []
        @current_frame = 0
    end

    def add_score(score1,score2,*score3)
        round_10? == true ? game_over : add_score_based_on_round(score1,score2,*score3) 
    end

    def running_total
        @scorecard.sum
    end


private

    def add_frame(score1,score2,*score3)
        if round_10? == true
            @current_frame = Frame.new(score1,*score2,*score3)
            @scorecard.push(@current_frame.bowl1)
            @scorecard.push(@current_frame.bowl2)
            @scorecard.push(@current_frame.bowl3)
        elsif round_10? == false
            @current_frame = Frame.new(score1,*score2)
            @scorecard.push(@current_frame.bowl1)
            @scorecard.push(@current_frame.bowl2)
        end
    end

    def current_frame?
        if @scorecard.count/2 <= 18
            @current_frame = @scorecard.count/2 + 1
        elsif @scorecard.count/2 == 21
            @current_frame = @scorecard.count/2 - 0.5
        elsif @scorecard.count/2 == 20
            @current_frame = @scorecard.count/2
        end
    end

    def round_10?
        if current_frame? < 10
            false
        elsif current_frame?  == 10
            true
        elsif current_frame? == 11
            "Game is over! You score #{running_total}"
        end
    end

    def add_score_based_on_round(score1,score2,*score3)
        if round_10? == true
            add_frame(score1,score2,score3.pop)
        elsif round_10? == false
            add_frame(score1,score2)
        end
    end

    def game_over
        "Game is over! You score #{running_total}"
    end

    def score_with_strikes
    end

end