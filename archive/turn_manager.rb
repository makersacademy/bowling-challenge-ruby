class TurnManager
  STARTING_POINT = 1

  attr_reader :frame, :turn, :pins

    def initialize
      @frame = STARTING_POINT
      @turn = STARTING_POINT
      @pins = []
    end

    def move(number)
      @pins << number
      if @pins.sum < 10 && turn >= 2
        end_turn
      elsif @pins.sum < 10
        @turn += 1
      else
        end_turn
      end
    end

    def final(number)
      loop do
        @pins << number
        p @pins
        if @turn == 3
          end_turn
        elsif @pins[@turn - 1] == 10
          @turn += 1
        elsif @pins[@turn - 1] < 10 && @pins.sum % 10 == 0
          @turn += 1
        else
          end_turn
        end
        break if self.frame > 10
      end
    end


    def end_turn
      @frame += 1
      @pins = []
      @turn = STARTING_POINT
    end

end
