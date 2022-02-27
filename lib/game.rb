class Game

    attr_reader :score, :frame_counter, :frame, :results
    FRAME_MAX = 4
    BONUS_VALUE = 10

    def initialize
        @score = 0
        @frame_counter = 0
        @spare_counter = 0
        @results = []
        @frame = []
    end

    def roll(pins)
        fail 'This game is over' unless @frame_counter < FRAME_MAX
        @results << pins
        @frame  << pins
        bonus_determiner
    end

    def bonus_determiner
        @length = @results.length
        if @spare_counter == 1
            spare_bonus
        elsif @results[@length - 3] == 10 && @length >= 3
            strike_bonus
        else
           frame_determiner
        end
    end


    def frame_determiner
        return strike_frame unless @results[@length - 1] != BONUS_VALUE
        return nil unless @frame.length == 2
        return spare_frame unless @frame.sum != 10
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
        running_score
    end

    def strike_bonus
        @score += BONUS_VALUE + @results[@length - 1] + @results[@length - 2]
        frame_determiner
    end

    def spare_frame
        @spare_counter += 1
        @frame_counter += 1
        @frame = []
        running_score
    end

    def spare_bonus
        @score += BONUS_VALUE + @results[@length - 1]
        @spare_counter = 0
        frame_determiner
    end

    def running_score
      return "The game is finished - you scored #{@score} points" unless @frame_counter != FRAME_MAX
      return "Strike! Your score after frame #{@frame_counter} is #{@score}" unless @results[@length - 1] != BONUS_VALUE
      return "Spare! Your score after frame #{@frame_counter} is #{@score}" unless @spare_counter == 0
      return"Your score after frame #{@frame_counter} is #{@score}"
    end

end