require 'frame'

class Game
    def initialize
        @frames = []
        @frames_played = 0
        @frame_totals = []
    end

    def add_frame(frame)
        return 'START NEW GAME' if @frames_played == 10
        
        frame_total = sum_frame(frame)
        @frame_totals << frame_total
        
        @frame_totals[-1] += frame.roll1 if last_frame_spare?
        @frame_totals[-2] += frame.roll1 if double_strike?
        @frame_totals[-1] += last_frame_strike_bonus(frame)

        @frames << frame
        @frames_played += 1
        return nil
    end

    def last_frame_strike_bonus(frame)
        if last_frame_strike?
            if @frames_played < 9
                return sum_frame(frame)
            else
                return frame.roll1 + frame.roll2.to_i
            end
        else
            return 0
        end
    end

    def last_frame_spare?
        if @frames_played > 0
            last_frame = @frames.last
            last_frame_total = sum_frame(last_frame)
            return last_frame_total == 10 && last_frame.roll1 != 10
        end
    end

    def last_frame_strike?
        if @frames_played > 0
            last_frame = @frames.last
            return last_frame.roll1 == 10
        end 
    end

    def double_strike?
        if @frames_played > 1
            second_last_frame = @frames[-2]
            return second_last_frame.roll1 == 10 && last_frame_strike?
        end 
    end

    def sum_frame(frame)
        return frame.roll1 + frame.roll2.to_i + frame.roll3.to_i
    end

    def calculate_score
        return @frame_totals.sum
    end

    def frames_played
        return @frames_played
    end
end