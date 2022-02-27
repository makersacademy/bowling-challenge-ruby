class Game

    attr_reader :score, :frame_counter
    FRAME_MAX = 3

    def initialize
        @score = 0
        @frame_counter = 0
        @frame_array = []
    end

    def roll(value)
        fail 'This game is over' unless @frame_counter < FRAME_MAX
        if value == 10
           strike_frame
        else
          @frame_array << value
          frame_determiner
        end
    end

    def strike_frame
      @frame_counter += 1
      running_score
    end

    def frame_determiner
        if @frame_array.length  == 2
           @frame_counter += 1
           frame_result
        end
    end

    def frame_result
        @score += @frame_array.sum
        @frame_array = []
        running_score
     end

    def running_score
      if @frame_counter == FRAME_MAX
        "The game is finished - you scored #{@score} points"
      else
        "Your score after frame #{@frame_counter} is #{@score}"
      end
    end

end