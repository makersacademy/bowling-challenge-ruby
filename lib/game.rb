class Game
  attr_accessor :scorecard
  def initialize
    @scorecard = [
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 }
    ]
  end

  def bowl(pins_down)
    # frame index required to determine which 
    # frame each bowl should be attributed to:
    frame_index = @scorecard.find_index do |frame|
      frame[:pins].sum < 10 && frame[:pins].size < 2
    end
    
    # now add the pins_down 
    # to the appropriate frame, allowing for up to 3 shots on final frame:
    if frame_index != nil
      @scorecard[frame_index][:pins] << pins_down
    
      # now to determine points,
      # if no spare scored previously:
      if @scorecard[frame_index - 1][:pins].sum < 10
        # no bonuses are scored:
        @scorecard[frame_index][:total] = @scorecard[frame_index][:pins].sum
      # elsif previous turn was a spare:
      elsif @scorecard[frame_index - 1][:pins].sum == 10 && @scorecard[frame_index - 1][:pins].size == 2
        # add the new score as normal
        @scorecard[frame_index][:total] = @scorecard[frame_index][:pins].sum
        # if this is the first bowl of the next turn...
        if @scorecard[frame_index][:pins].size == 1
          # then add the score as a bonus to the previous total
          @scorecard[frame_index - 1][:total] += @scorecard[frame_index][:pins][0]
          # if this is the 2nd bowl of the next turn then do nothing...
          else
        end
      # elsif previous turn was a strike
      elsif @scorecard[frame_index - 1][:pins][0] == 10
        # check to see if turn before that is also a strike
        if @scorecard[frame_index - 2][:pins][0] == 10
          # add new score as normal
          @scorecard[frame_index][:total] = @scorecard[frame_index][:pins].sum
          # if this is the first bowl of the new frame...
          if @scorecard[frame_index][:pins].size == 1
            # then add the score as a bonus to the previous 2 totals
            @scorecard[frame_index - 1][:total] += @scorecard[frame_index][:pins][0]
            @scorecard[frame_index - 2][:total] += @scorecard[frame_index][:pins][0]
          # if this is the 2nd bowl of the new frame...
          elsif @scorecard[frame_index][:pins].size == 2
            # then add the score as a bonus to the previous total
            @scorecard[frame_index - 1][:total] += @scorecard[frame_index][:pins][1]
          end
        # else (if 2 turns ago was not a strike)
        else
          # add the new score as normal
          @scorecard[frame_index][:total] = @scorecard[frame_index][:pins].sum
          # if this is the first bowl of the new frame...
          if @scorecard[frame_index][:pins].size == 1
            # then add the score as a bonus to the previous total
            @scorecard[frame_index - 1][:total] += @scorecard[frame_index][:pins][0]
          # if this is the 2nd bowl of the next turn...
          elsif @scorecard[frame_index][:pins].size == 2
            # then add the score as a bonus to the previous total
            @scorecard[frame_index - 1][:total] += @scorecard[frame_index][:pins][1]
          end
        end
      end

    # LOGIC FOR FINAL FRAME
    else
      @scorecard[9][:pins] << pins_down
      # now to determine points,
      # if no spare scored previously:
      if @scorecard[8][:pins].sum < 10
        # no bonuses are scored:
        @scorecard[9][:total] = @scorecard[9][:pins].sum
      # elsif previous turn was a spare:
      elsif @scorecard[8][:pins].sum == 10 && @scorecard[8][:pins].size == 2
        # add the new score as normal
        @scorecard[9][:total] = @scorecard[9][:pins].sum
        # if this is the first bowl of the next turn...
        if @scorecard[9][:pins].size == 1
          # then add the score as a bonus to the previous total
          @scorecard[8][:total] += @scorecard[9][:pins][0]
          # if this is the 2nd bowl of the next turn then do nothing...
          else
        end
      # elsif previous turn was a strike
      elsif @scorecard[8][:pins][0] == 10
        # check to see if turn before that is also a strike
        if @scorecard[7][:pins][0] == 10
          # add new score as normal
          @scorecard[9][:total] = @scorecard[9][:pins].sum
          # if this is the first bowl of the new frame...
          if @scorecard[9][:pins].size == 1
            # then add the score as a bonus to the previous 2 totals
            @scorecard[8][:total] += @scorecard[9][:pins][0]
            @scorecard[7][:total] += @scorecard[9][:pins][0]
          # if this is the 2nd bowl of the new frame...
          elsif @scorecard[9][:pins].size == 2
            # then add the score as a bonus to the previous total
            @scorecard[8][:total] += @scorecard[9][:pins][1]
          end
        # else (if 2 turns ago was not a strike)
        else
          # add the new score as normal
          @scorecard[9][:total] = @scorecard[9][:pins].sum
          # if this is the first bowl of the new frame...
          if @scorecard[9][:pins].size == 1
            # then add the score as a bonus to the previous total
            @scorecard[8][:total] += @scorecard[9][:pins][0]
          # if this is the 2nd bowl of the next turn...
          elsif @scorecard[9][:pins].size == 2
            # then add the score as a bonus to the previous total
            @scorecard[8][:total] += @scorecard[9][:pins][1]
          end
        end
      end
    end
    # display scorecard:
    @scorecard
  end

end
