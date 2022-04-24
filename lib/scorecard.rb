require_relative 'frame'

class Scorecard

    attr_reader :scorecard, :strike_points, :spare_points, :store_frame

    def initialize
        @scorecard = []
        @current_frame = 0
        @strike_points = 0
        @spare_points = 0
    end

    def add_score(score1,score2,*score3)
        game_over? == true ? "Game is over! You scored #{game_outcome}": add_score_based_on_round(score1,score2,*score3) 
    end

private

    def add_frame(score1,score2,*score3)
        @store_frame = []
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

    def add_score_based_on_round(score1,score2,*score3)
        if round_10? == true
            add_frame(score1,score2,score3.pop)
            final_score
            "Game is over! You scored #{game_outcome}"
        elsif round_10? == false
            add_frame(score1,score2)
            running_total
        end
    end

    def current_frame?
        @scorecard.count
    end

    def round_10?
        if current_frame? < 9
            false
        elsif current_frame? == 9
            true
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
            @store_strike_points = 0
            @scorecard.each_cons(3) do |frame1, frame2, frame3|
                if frame1[0] == 10 && frame2[0] != 10 
                    @store_strike_points += frame2[0] + frame2[1]
                    store_strike_points
                elsif frame1[0] == 10 && frame2[0] == 10 && frame3[0] == 10
                    @store_strike_points += frame2[0] + frame3[0]
                    store_strike_points
                elsif frame1[0] == 10 && frame2[0] == 10 && frame3[0] != 10
                    @store_strike_points += frame2[0] + frame3[0]
                    store_strike_points
                end
            end
        elsif @scorecard.count == 10
            if @scorecard[9][0] == 10 && @scorecard[9][1] != 10
                @store_strike_points += @scorecard[9][1] + @scorecard[9][2]
                store_strike_points
            elsif @scorecard[9][0] == 10 && @scorecard[9][1] == 10
                @store_strike_points += @scorecard[9][1] + @scorecard[9][2]
                store_strike_points
            end
        end 
        if @scorecard.count == 10 && @scorecard[8][0] == 10
            @store_strike_points += @scorecard[9][0] + @scorecard[9][1]
            store_strike_points
        end
    end

    def count_spares
        @store_spare_points = 0
        if @scorecard.count <= 9
            @scorecard.each_cons(2) do |frame1, frame2|
            if @scorecard.count <= 9
                if frame1.sum == 10 && frame1[0] != 10
                    @store_spare_points += frame2[0]
                    store_spare_points
                    end
                end
            end
        elsif @scorecard.count == 10
            if @scorecard[8].sum == 10 && @scorecard[8][0] != 10
                @store_spare_points += @scorecard[9][0]
                store_spare_points
            end
            if @scorecard[9][0] + @scorecard[9][1] == 1 && @scorecard[9][0] != 10
                @store_spare_points += @scorecard[9][2]
                store_spare_points
            end
        end
    end

    def running_total
        @strike_points = 0
        count_strikes
        @spare_points = 0
        count_spares
        @running_total = @scorecard.flatten.sum + @strike_points + @spare_points
    end

    def final_score
        count_strikes
        count_spares
        @running_total = @scorecard.flatten.sum + @strike_points + @spare_points
    end

    def game_outcome
        if @running_total == 300
            "a perfect 300!"
        elsif
            @running_total == 0
            "0! Gutter game!"
        else 
            "#{@running_total}!"
        end
    end

    def store_strike_points
        @strike_points += @store_strike_points
        @store_strike_points = 0
    end

    def store_spare_points
        @spare_points += @store_spare_points
        @store_spare_points = 0
    end
end