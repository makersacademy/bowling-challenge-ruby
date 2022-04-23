require_relative 'frame'

class Scorecard

    attr_reader :scorecard, :strike_points

    def initialize
        @scorecard = []
        @current_frame = 0
        @store_frame = []
    end

    def add_score(score1,score2,*score3)
        round_10? == true ? game_over : add_score_based_on_round(score1,score2,*score3) 
    end

    def running_total
        count_strikes
        @scorecard.flatten.sum + @strike_points
    end


private

    def add_frame(score1,score2,*score3)
        if round_10? == true
            @current_frame = Frame.new(score1,*score2,*score3)
            @store_frame.push(@current_frame.bowl1)
            @store_frame.push(@current_frame.bowl2)
            @store_frame.push(@current_frame.bowl3)
            store_frame = @store_frame
            @store_frame = []
            @scorecard.push(store_frame)
        elsif round_10? == false
            @current_frame = Frame.new(score1,*score2)
            @store_frame.push(@current_frame.bowl1)
            @store_frame.push(@current_frame.bowl2)
            store_frame = @store_frame
            @store_frame = []
            @scorecard.push(store_frame)
        end
    end

    def current_frame?
        @scorecard.count + 1
    end

    def round_10?
        if current_frame? < 10
            false
        elsif current_frame? == 10
            true
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

    def count_strikes
        @strike_points = 0
        @scorecard.each_cons(2) do |frame1, frame2|
            if frame1[0] == 10
                @strike_points += frame2.sum
            end
        end
    end


end