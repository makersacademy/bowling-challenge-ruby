class BowlingGame
    attr_reader :score, :frame

    def initialize
        @score = []
        @frame = 0
    end


    def new_frame(roll_1, roll_2 = 0)
        @frame += 1
       
        if @frame == 11
            raise "Game Over, you have played all your frames" unless @score[9].include?(10)
        end

        if @frame > 1 && strike?
             @score[@frame -2] << [roll_1 , roll_2]
             add_to_score(roll_1, roll_2)
        elsif @frame > 1 && spare?
            @score[@frame -2] << [roll_1] 
            add_to_score(roll_1, roll_2) 
        else
            add_to_score(roll_1, roll_2)
        end
     end

  def total_score
    @score.flatten.inject(:+)
  end

  private

  def add_to_score(roll_1, roll_2)
    @score << [roll_1, roll_2]
  end

  def strike?
    @score[@frame -2].include?(10)
  end

  def spare?
    @score[@frame -2].inject(:+) == 10
  end
   
end