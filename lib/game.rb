class Game

    attr_reader :score, :frame_counter
    FRAME_MAX = 10
    BONUS_VALUE = 10

    def initialize
        @score = 0
        @frame_counter = 0
        @spare_counter = 0
        @extra_roll = 0
        @results = []
        @frame = []
    end

    def roll(pins)
        fail 'This game is over' if @frame_counter == FRAME_MAX
        @results << pins
        @frame  << pins
        bonus_determiner
    end

    private

    def bonus_determiner
        @length = (@results.length) - 1
        return spare_bonus if @spare_counter == 1
        return strike_bonus if @results[@length - 2] == BONUS_VALUE && @length >= 2
        frame_determiner
    end


    def frame_determiner
        return strike_frame if @results[@length] == BONUS_VALUE
        return nil if @frame.length < 2
        return spare_frame if @frame.sum == BONUS_VALUE
        frame_result
    end

    def frame_result
        @score += @frame.sum
        @frame_counter += 1
        @frame = []
        running_score
    end

    def strike_frame
        @frame_counter += 1
        @frame = []
        return bonus_ball_strike if @frame_counter == FRAME_MAX && @extra_roll == 0
        running_score
    end

    def strike_bonus
        @score += BONUS_VALUE + @results[@length] + @results[@length - 1]
        frame_determiner
    end

    def bonus_ball_strike
        @frame_counter -= 2
        @extra_roll = 1
    end

    def spare_frame
        @spare_counter += 1
        @frame_counter += 1
        @frame = []
        return bonus_ball_spare if @frame_counter == FRAME_MAX
        running_score
    end

    def spare_bonus
        @score += BONUS_VALUE + @results[@length]
        @spare_counter = 0
        return frame_determiner if @extra_roll == 0
        @frame_counter += 1
        running_score
    end

    def bonus_ball_spare
        @frame_counter -= 1
        @extra_roll = 1
    end
    

    def running_score
      return "The game is finished - you scored #{@score} points" if @frame_counter == FRAME_MAX
      return "Strike! Your score after frame #{@frame_counter} is #{@score}" if @results[@length] == BONUS_VALUE
      return "Spare! Your score after frame #{@frame_counter} is #{@score}" if @spare_counter == 1
      return "Your score after frame #{@frame_counter} is #{@score}"
    end

end