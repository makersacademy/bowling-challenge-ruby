class Player

  attr_reader :scores, :sum

  def initialize(scores = [], sum = 0)
    @scores = scores
    @sum = sum
  end

  def add(score)
    if @scores.length <= 9

      # check if it's the start of the game or frame
      if !@scores.last || @scores.last.length == 2
        # if a strike, move to next frame
        if score == 10
          @scores.push([10,0])
        else
          @scores.push([score])
        end
      
        # check for strike or spare in previous frame
        if @scores.length >= 2
          if (@scores[@scores.length - 2].sum == 10)
            # increase score of previous game
            @scores[@scores.length - 2][1] += score
          end
        end
        return scores
      # second roll of frame  
      else
        # push score into frame array
        @scores.last.push(score)

        # check for strike only in previous frame
        if @scores.length >= 2
          if (@scores[@scores.length - 2][0] == 10)
            # increase score of previous game
            @scores[@scores.length - 2][1] += score
          end
        end
        return scores
      end
    end 

    # second roll of 10th frame
    if (@scores.length == 10 && @scores.last.length == 1)
      @scores.last.push(score)
    end

    # if 10 frames have been played and no spares or strikes, end the game
    if (@scores.length == 10 && @scores.last.sum != 10)
      return 'The game has finished'
    end

    if @scores.length == 10
      # if a strike in the last frame of the game
      if (@scores[@scores.length - 1] == [10,0])
        # add score of first roll after strike
        @scores[@scores.length - 1][1] += score
      elsif (@scores[@scores.length - 1][0] == 10)
        # add the score of second roll after strike
        @scores[@scores.length - 1][1] += score
        return 'The game has finished'
      # if a spare in the last frame of the game
      elsif (@scores[@scores.length - 1].sum == 10)
        # add score of one more roll
        @scores[@scores.length - 1][1] += score
        return 'The game has finished'
      end
    end  
  end

  def sum
    @scores.flatten.sum
  end
end
