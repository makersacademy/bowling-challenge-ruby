class Scorecard

  def initialize (scores)
    @scores = scores
    @total_score = 0
    @spare = false
    @strike = false
    @strike2 = false
  end

  def score
    @scores.each_with_index do |(frame, roll), index|
      if index == 9
        if @strike && !@strike2
          @total_score += roll[0] * 1
          @total_score += roll[1] * 1
        elsif @strike && @strike2
          @total_score += roll[0] * 2
          @total_score += roll[1] * 1
        elsif @spare
          @total_score += roll[0] * 1
        else
          
        end
        
        @total_score += roll[0]
        @total_score += roll[1]
        @total_score += roll[2]
        
      else
        if @strike && !@strike2 
          @total_score += roll[0] * 2
          @total_score += roll[1] * 2
        elsif @strike && @strike2
          @total_score += roll[0] * 3
          @total_score += roll[1] * 2
        elsif @spare
          @total_score += roll[0] * 2
          @total_score += roll[1]
        else
          @total_score += roll[0]
          @total_score += roll[1]
        end
        
        if @strike && roll[0] == 10
          @strike = true
          @strike2 = true
          @spare = false
        elsif !@strike && roll[0] == 10
          @strike = true
          @strike2 = false
          @spare = false
        elsif roll[0] + roll[1] == 10
          @strike = false
          @strike2 = false
          @spare = true
        else
          @strike = false
          @strike2 = false
          @spare = false
        end
      end
      
    end

    @total_score
  end


end