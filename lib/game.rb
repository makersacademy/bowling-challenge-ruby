class Game

  attr_reader :scores, :sum

  def initialize(scores = [], sum = 0)
    @scores = scores
    @sum = sum
    @valid_scores = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  #################################
  ## helper functions ##

  def previous_frame
    @scores[@scores.length - 2]
  end

  def previous_previous_frame
    @scores[@scores.length - 3]
  end
  
  def previous_frame_spare?
    @scores[@scores.length - 2].sum == 10
  end

  def previous_frame_strike?
    @scores[@scores.length - 2][0] == 10
  end

  def previous_two_frames_strike?
    (@scores[@scores.length - 2][0] == 10 &&
      @scores[@scores.length - 3][0] == 10)
  end

  def new_frame?
    !@scores.last || @scores.last.length == 2
  end

  #################################

  def add(score)
    fail 'Please enter a number from 0 to 10' if !@valid_scores.include?(score)

    if @scores.length <= 9
      # check if it's the start of the game or frame
      if new_frame?
        # if a strike, move to next frame
        score == 10 ? @scores.push([10,0]) : @scores.push([score])

        @first_roll = score
      
        # check for strike or spare in previous frame
        # need to be in at least the second frame
        if @scores.length > 1
          if previous_frame_strike? || previous_frame_spare?
              previous_frame[1] += score
          end
        end
        # check for two strikes in previous two frames
        if @scores.length > 2
          if previous_two_frames_strike?
            # increase score of previous game
            previous_previous_frame[1] += score
          end
        end

        return scores
      # second roll of frame  
      else
        valid_second_roll = @valid_scores.filter{ |n| n <= (10 - @first_roll) }
        fail "Please enter a number from 0 to #{10-@first_roll}" if !(valid_second_roll.include?(score))
       
        # push score into frame array
        @scores.last.push(score)

        # check for strike only in previous frame
        if @scores.length >= 2
          if previous_frame_strike?
            # increase score of previous game
            previous_frame[1] += score
          end
        end
        return scores
      end
    end 

    # second roll of 10th frame
    if (@scores.length == 10 && @scores.last.length == 1)
      @scores.last.push(score)
      # if previous_frame_strike?
      #   previous_frame[1] += score
      # end
    end


      
      #   if previous_frame_strike? && previous_two_frames_strike?
      #   # increase score of previous game
      #   previous_previous_frame[1] += score
      # end
    # if (@scores[@scores.length - 2].sum == 10)
    #   # increase score of previous game
    #   @scores[@scores.length - 2][1] += score
    # end

    # if 10 frames have been played and no spares or strikes, end the game
    if (@scores.length == 10 && @scores.last.sum != 10)
      return 'The game has finished'
    end

    # tenth frame
    if @scores.length == 10
      tenth_frame = @scores[@scores.length - 1]
      # if a strike in the last frame of the game
      if (tenth_frame == [10,0])
        # add score of first roll after strike
        tenth_frame[1] += score
      elsif (tenth_frame[0] == 10)
        # add the score of second roll after strike
        tenth_frame[1] += score
        return 'The game has finished'
      # if a spare in the last frame of the game
      elsif (tenth_frame.sum == 10)
        # add score of one more roll
        tenth_frame[1] += score
        return 'The game has finished'
      end
    end  
  end

  def sum
    @scores.flatten.sum
  end

  
end
