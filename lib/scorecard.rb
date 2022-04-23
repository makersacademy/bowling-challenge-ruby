require_relative 'frame'

class Scorecard

    attr_reader :scorecard, :strike_points, :spare_points, :store_frame

    def initialize
        @scorecard = []
        @current_frame = 0
        @store_frame = []
        @strike_points = 0
        @spare_points = 0
    end

    def add_score(score1,score2,*score3)
        game_over? == true ? "Game is over! You score #{running_total}": add_score_based_on_round(score1,score2,*score3) 
    end

    def running_total
        count_strikes
        count_spares
        @scorecard.flatten.sum + @strike_points + @spare_points
    end


private

    def current_frame?
        @scorecard.count
    end

    def add_frame(score1,score2,*score3)
        if round_10? == true
            @current_frame = Frame.new(score1,score2,*score3)
            @store_frame.push(@current_frame.bowl1)
            @store_frame.push(@current_frame.bowl2)
            @store_frame.push(@current_frame.bowl3)
            store_frame = @store_frame.compact
            @scorecard.push(store_frame)
        elsif round_10? == false
            @current_frame = Frame.new(score1,score2)
            @store_frame.push(@current_frame.bowl1)
            @store_frame.push(@current_frame.bowl2)
            store_frame = @store_frame
            @store_frame = []
            @scorecard.push(store_frame)
        end
    end

    def round_10?
        if current_frame? < 9
            false
        elsif current_frame? == 9
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

    def game_over?
        if current_frame? == 10
            true
        else
            false
        end
    end

    def count_strikes
        if round_10? == false
            @strike_points = 0
            @scorecard.each_cons(2) do |frame1, frame2|
                if frame1[0] == 10
                    @strike_points += frame2.sum
                end
            end 
        end
    end

    def count_spares
        @spare_points = 0
        @scorecard.each_cons(2) do |frame1, frame2|
            if frame1.sum == 10 && frame1[0] != 10
                @spare_points += frame2[0]
            end
        end
    end

end