class Game

    attr_reader :score, :frame_counter
    FRAME_MAX = 3
    BONUS_VALUE = 10

    def initialize
        @score = 0
        @frame_counter = 0
        @frame_array = []
        @strike_counter = 0
        @spare_counter = 0
    end

    def roll(value)
        fail 'This game is over' unless @frame_counter < FRAME_MAX
        return spare_bonus(value) unless @spare_counter != 1
        return strike_frame unless value != BONUS_VALUE
        @frame_array << value
        frame_determiner
    end

    def strike_frame
      @frame_counter += 1
      @strike_counter += 1
      running_score
    end

    def frame_determiner
        return nil unless @frame_array.length  == 2
        @frame_counter += 1
        frame_result
    end

    def frame_result
        return spare_frame unless @frame_array.sum != BONUS_VALUE
        @score += @frame_array.sum
        @frame_array = []
        running_score
    end

    def spare_frame
        @spare_counter += 1
        @frame_array = []
        running_score
    end

    def spare_bonus(value)
        @score += BONUS_VALUE + value
        @frame_array << value
        @spare_counter = 0
        return nil unless value == BONUS_VALUE
        strike_frame
    end

    def running_score
      return "The game is finished - you scored #{@score} points" unless @frame_counter != FRAME_MAX
      return "Strike! Your score after frame #{@frame_counter} is #{@score}" unless @strike_counter == 0
      return "Spare! Your score after frame #{@frame_counter} is #{@score}" unless @spare_counter == 0
      return"Your score after frame #{@frame_counter} is #{@score}"
    end

end