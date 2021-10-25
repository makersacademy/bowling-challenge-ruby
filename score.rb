class Score

  def game_total(frames)
    add_bonuses(frames)
    frames.flatten.compact.sum
  end

  def add_bonuses(frames)
    frames.each_with_index do |frame, i|
      if strike?(frame)
        frame << frames[i + 1][0] # add pins from next roll
        unless frames[i + 1][1] == nil # if second roll is in the next frame
          frame << frames[i + 1][1] # add pins from 1st roll from next frame
        else
          frame << frames[i + 2][0] # or add pins from the second roll
        end
      end
    end

    frames.each_with_index do |frame, i|
      frame << frames[i + 1][0]  if spare?(frame) # add pins from next roll
    end
  end

  private

  def spare?(frame)
    !frame.include?(10) && frame.compact.sum == 10
  end

  def strike?(frame)
    frame.include?(10)
  end

end
