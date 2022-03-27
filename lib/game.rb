class Game
  def initialize
    @scorecard = [
      {game_total: 0},
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
    # frame each bowl should be attributed to excluding game_total:
    frame_index = @scorecard.drop(1).find_index do |frame|
      frame[:pins].sum < 10 && frame[:pins].size < 2
    end   

    # now add the pins_down 
    # to the appropriate frame, allowing for up to 3 shots on final frame:
    if frame_index != nil
      @scorecard.drop(1)[frame_index][:pins] << pins_down
    
      # now to determine points,
      # if no spare scored previously:
      if @scorecard.drop(1)[frame_index - 1][:pins].sum < 10
        # no bonuses are scored:
        @scorecard.drop(1)[frame_index][:total] = @scorecard.drop(1)[frame_index][:pins].sum
      # elsif previous turn was a spare:
      elsif @scorecard.drop(1)[frame_index - 1][:pins].sum == 10 && @scorecard.drop(1)[frame_index - 1][:pins].size == 2
        # add the new score as normal
        @scorecard.drop(1)[frame_index][:total] = @scorecard.drop(1)[frame_index][:pins].sum
        # if this is the first bowl of the next turn...
        if @scorecard.drop(1)[frame_index][:pins].size == 1
          # then add the score as a bonus to the previous total
          @scorecard.drop(1)[frame_index - 1][:total] += @scorecard.drop(1)[frame_index][:pins][0]
          # if this is the 2nd bowl of the next turn then do nothing...
          else
        end
      # elsif previous turn was a strike
      elsif @scorecard.drop(1)[frame_index - 1][:pins][0] == 10
        # check to see if turn before that is also a strike
        if @scorecard.drop(1)[frame_index - 2][:pins][0] == 10
          # add new score as normal
          @scorecard.drop(1)[frame_index][:total] = @scorecard.drop(1)[frame_index][:pins].sum
          # if this is the first bowl of the new frame...
          if @scorecard.drop(1)[frame_index][:pins].size == 1
            # then add the score as a bonus to the previous 2 totals
            @scorecard.drop(1)[frame_index - 1][:total] += @scorecard.drop(1)[frame_index][:pins][0]
            @scorecard.drop(1)[frame_index - 2][:total] += @scorecard.drop(1)[frame_index][:pins][0]
          # if this is the 2nd bowl of the new frame...
          elsif @scorecard.drop(1)[frame_index][:pins].size == 2
            # then add the score as a bonus to the previous total
            @scorecard.drop(1)[frame_index - 1][:total] += @scorecard.drop(1)[frame_index][:pins][1]
          end
        # else (if 2 turns ago was not a strike)
        else
          # add the new score as normal
          @scorecard.drop(1)[frame_index][:total] = @scorecard.drop(1)[frame_index][:pins].sum
          # if this is the first bowl of the new frame...
          if @scorecard.drop(1)[frame_index][:pins].size == 1
            # then add the score as a bonus to the previous total
            @scorecard.drop(1)[frame_index - 1][:total] += @scorecard.drop(1)[frame_index][:pins][0]
          # if this is the 2nd bowl of the next turn...
          elsif @scorecard.drop(1)[frame_index][:pins].size == 2
            # then add the score as a bonus to the previous total
            @scorecard.drop(1)[frame_index - 1][:total] += @scorecard.drop(1)[frame_index][:pins][1]
          end
        end
      end

    # LOGIC FOR FINAL FRAME
    else
      @scorecard.drop(1)[9][:pins] << pins_down
      # now to determine points,
      # if no spare scored previously:
      if @scorecard.drop(1)[8][:pins].sum < 10
        # no bonuses are scored:
        @scorecard.drop(1)[9][:total] = @scorecard.drop(1)[9][:pins].sum
      # elsif previous turn was a spare:
      elsif @scorecard.drop(1)[8][:pins].sum == 10 && @scorecard.drop(1)[8][:pins].size == 2
        # add the new score as normal
        @scorecard.drop(1)[9][:total] = @scorecard.drop(1)[9][:pins].sum
        # if this is the first bowl of the next turn...
        if @scorecard.drop(1)[9][:pins].size == 1
          # then add the score as a bonus to the previous total
          @scorecard.drop(1)[8][:total] += @scorecard.drop(1)[9][:pins][0]
          # if this is the 2nd bowl of the next turn then do nothing...
          else
        end
      # elsif previous turn was a strike
      elsif @scorecard.drop(1)[8][:pins][0] == 10
        # check to see if turn before that is also a strike
        if @scorecard.drop(1)[7][:pins][0] == 10
          # add new score as normal
          @scorecard.drop(1)[9][:total] = @scorecard.drop(1)[9][:pins].sum
          # if this is the first bowl of the new frame...
          if @scorecard.drop(1)[9][:pins].size == 1
            # then add the score as a bonus to the previous 2 totals
            @scorecard.drop(1)[8][:total] += @scorecard.drop(1)[9][:pins][0]
            @scorecard.drop(1)[7][:total] += @scorecard.drop(1)[9][:pins][0]
          # if this is the 2nd bowl of the new frame...
          elsif @scorecard.drop(1)[9][:pins].size == 2
            # then add the score as a bonus to the previous total
            @scorecard.drop(1)[8][:total] += @scorecard.drop(1)[9][:pins][1]
          end
        # else (if 2 turns ago was not a strike)
        else
          # add the new score as normal
          @scorecard.drop(1)[9][:total] = @scorecard.drop(1)[9][:pins].sum
          # if this is the first bowl of the new frame...
          if @scorecard.drop(1)[9][:pins].size == 1
            # then add the score as a bonus to the previous total
            @scorecard.drop(1)[8][:total] += @scorecard.drop(1)[9][:pins][0]
          # if this is the 2nd bowl of the next turn...
          elsif @scorecard.drop(1)[9][:pins].size == 2
            # then add the score as a bonus to the previous total
            @scorecard.drop(1)[8][:total] += @scorecard.drop(1)[9][:pins][1]
          end
        end
      end
    end

    game_total = 0
    @scorecard.drop(1).each do |frame|
      game_total += frame[:total]
      end
    # display scorecard and score:
    @scorecard[0][:game_total] = game_total
    @scorecard
  end

end
