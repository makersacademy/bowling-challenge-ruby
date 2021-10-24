class Score

  def game_total(frames)
    add_bonuses(frames)
    frames.flatten.compact.sum
  end

  def add_bonuses(frames)
    frames.each_with_index do |frame, i|
      if strike?(frame)
        unless frames[i + 1][1] == nil
          frame << frames[i + 1][0]
          frame << frames[i + 1][1]
        else
          frame << frames[i + 1][0]
          frame << frames[i + 2][0]
        end
      end
    end

    frames.each_with_index do |frame, i|
      frame << frames[i + 1][0]  if spare?(frame) 
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