require 'rgeo'

class Bowling

    attr_accessor :ball1, :ball2, :score, :frame_score

    STARTINGSCORE = 0
    
    def initialize
        @score = 0
        @frame_score = 0
        # @ball1 = ball1
        # @ball2 = ball2
    end

    # def ball1
    #     ball1 = gets.chomp
    # end

    # def ball2
    #     ball2 = gets.chomp
    # end

    def strike
        if ball1 == 10
          return "You Scored A Strike!"
        end
    end

    def test_points
        @score = 10
    end

    def spare
        score = ball1 + ball2
        if score == 10
          return "Spare!"
        end
    end
     
    def frame
        if spare? @frame_score << (ball1 + ball1 + ball2)
        elsif strike? @frame_score << (ball1 + ball2) * 2
        else
        @frame_score << ball1 + ball2
        end
    end
  
    def points
        @score << @frame_score
    end

    def perfect_game
        if @score = 300
            return "PERFECT GAME!!!"
        end
    end

    def gutter_game
        if @score == 0
            return "BAD LUCK!!!"
        end
    end
end