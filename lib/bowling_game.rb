class BowlingGame
    attr_reader :score, :frame

    def initialize
        @score = []
        @frame = 0
    end


    def new_frame(roll_1, roll_2 = 0)
        @frame += 1
        final_frame

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
   final_score = @score.flatten.inject(:+)
   if final_score == 0
    "Gutter Game! You're terrible, you scored 0 points" 
   else 
    final_score
   end
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

  def final_frame
    if @frame == 11
       raise "Game Over, you have played all your frames" unless strike? || spare?
    elsif @frame == 12
        raise "Game Over, you have played all your frames"
   end
end
   
end

#need to sort out scoring for the final frame