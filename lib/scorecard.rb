require_relative 'frame'

class Scorecard

    attr_reader :scorecard, :strike_points, :spare_points, :store_frame

    def initialize
        @scorecard = []
        @current_frame = 0
        @store_frame = []
        @strike_points = 0
        @spare_points = 0
        @running_total = 0
    end

    def add_score(score1,score2,*score3)
        game_over? == true ? "Game is over! You score #{running_total}": add_score_based_on_round(score1,score2,*score3) 
    end

    def running_total
        count_strikes
        count_spares
        @running_total = @scorecard.flatten.sum + @strike_points + @spare_points
    end

    def current_frame?
        @scorecard.count
    end


private

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
            running_total
        elsif round_10? == false
            add_frame(score1,score2)
            running_total
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
        if @scorecard.count < 10
            @scorecard.each_cons(3) do |frame1, frame2, frame3|
                if frame1[0] == 10 && frame2[0] == 10 && frame3[0] == 10
                    @strike_points += frame2[0] + frame3[0]
                elsif frame1[0] == 10 && frame2[0] == 10 && frame3[0] != 10
                    @strike_points += frame2[0] + frame3[0]
                elsif frame1[0] == 10 && frame2[0] != 10
                    @strike_points += frame2.sum
                end
            end

        elsif @scorecard.count == 10
            if @scorecard[9][0] == 10
                @strike_points += @scorecard[9][1] + @scorecard[9][2]
            end
        end 
    end

    def strikes_maximum_30
        
    end

    def count_spares
        @spare_points = 0
        @scorecard.each_cons(2) do |frame1, frame2|
            if frame1.sum == 10 && frame1[0] != 10
                @spare_points += frame2[0]
            end
        end
    end

    def game_outcome
        if running_total == 300
            "You scored a perfect 300!"
        elsif
            running_total == 0
            "Gutter game! You scored 0!"
        else 
            "Game is over! You score #{running_total}"
        end
    end

end