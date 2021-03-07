class BowlingGame
    attr_reader :score, :frame

    def initialize
        @score = []
        @frame = 0
    end


    def new_frame(roll_1, roll_2 = 0)
        @frame += 1
        @score << [roll_1, roll_2]

        
        if @frame == 11
            raise "Game Over, you have played all your frames" unless @score[9].include?(10)
        end

    
        if @frame > 1 && @score[@frame -2].include?(10)
             @score[@frame -2] << [roll_1 ,roll_2]
        end

    end

  def total_score
  end


    #if previous index includes strike or spare when frame = 2 previous index = 0??

   
end