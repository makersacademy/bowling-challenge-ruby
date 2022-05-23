class Bowling

  attr_reader :score_card, :frame, :frame_attempts, :frame_pins

  def initialize
    @frame = 1
    @frame_pins = 0
    @frame_attempts = 0
    @score_card = []
  end

  def enter_score(score)
      if score > 10 || score < 0
        return 'Score can not be higher than 10 or less than Zero'  
    #if frame is equal to 13, all possible frames have been played, defualt to your_score message 
      elsif @frame >= 13
          your_score
      elsif score == 10
        if @frame >= 10
          @score_card << 10
          @frame += 1
        else 
          @score_card << 30
          @score_card
          @frame += 1
        end
      elsif @frame_attempts != 1
        #frame attempts help us keep track of spares, a score is added to frame pins variable, 
        #which is only then appended if frame pins score equals 10(spare)
        @frame_attempts += 1
        @frame_pins += score
      
      elsif @frame_attempts == 1 && @frame_pins != 10
        #below follows the logic of standard spares throughout the game
        @frame_pins += score
          if @frame_pins == 10
            @score_card << 15
            @frame_attempts = 0
            @frame_pins = 0
            @frame += 1
          else
            @score_card << @frame_pins
            @frame_attempts = 0
            @frame_pins = 0
            @frame += 1
          end


      end

    end

  def final_score
    @score_card.reduce(:+)
  end

  def your_score
    "Game finished! Your score was #{final_score}!" 
  end

end