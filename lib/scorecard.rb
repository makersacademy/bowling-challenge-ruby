class Scorecard
  def score(array)
    find_strikes(array)
    total = bowling_game(array)
    ten_frames(total)
  end

  private

  def find_strikes(array)
    strikes = [] # to store strikes in the array
    array.each_with_index do |roll, idx|
        if roll == 10
          strikes << idx
        end
      end
    set_up_strike(strikes, array)
  end

  def set_up_strike(strikes, array)
    strikes.reverse.each do |str_idx|
       array.insert((str_idx+1), 0)
    end
  end

  def ten_frames(total)
    unless total.length <= 10
      total.pop
    end
    total
  end

  def bowling_game(array)
    frames = array.each_slice(2).to_a # to split the array score into frames
    total = bowling_calculation(frames)
  end

  def bowling_calculation(frames)
    total = [] # where the score will be returned from
    score = 0 # to calculate the running total
    frames.each_with_index do |roll, idx| # seperate out each frame to calculate
      if idx < 8
        result = standard_roll(roll, frames, idx, score, total)
        total << result
        score = result
      elsif idx == 8
        result = penultimate_roll(roll, frames, idx, score, total)
        total << result
        score = result
      elsif idx == 9
        result = final_roll(roll, frames, idx, score, total)
        total << result
        score = result
      end
    end
    total
  end

  def strike?(roll)
    roll.sum == 10 && roll[0] == 10
  end

  def second_strike?(roll, idx, frames)
    frames[idx+1].sum == 10 && roll[0] == 10
  end

  def third_strike?(roll, idx, frames)
    frames[idx+2].sum == 10 && roll[0] == 10
  end

  def final_roll(roll, frames, idx, score, total)
    if strike?(roll)
      if frames[idx+1][0] == 10
        if frames[idx+2][0] == 10
          score += (roll.sum + frames[idx+1].sum + frames[idx+2].sum)
        else
        # if 3rd roll is not a strike
          score += (roll.sum + frames[idx+1].sum + frames[idx+2][0])
        end
      else
      # if 2nd roll is not a strike
        score += (roll.sum + frames[idx+1].sum)
      end
    elsif roll.sum == 10 # for a spare
      score += (roll.sum + frames[idx+1][0])
    else
      score += roll.sum # calculate the score and add it to the total
    end
    score # add the score to the scorecard array
  end

  def penultimate_roll(roll, frames, idx, score, total)
    if strike?(roll)
      if second_strike?(roll, idx, frames)
        if third_strike?(roll, idx, frames)
          score += (roll.sum + frames[idx+1].sum + frames[idx+2][0])
        else
          score += (roll.sum + frames[idx+1].sum + frames[idx+2][0])
        end
          elsif roll.sum == 10 # for a spare
        score += (roll.sum + frames[idx+1].sum)
      else
        score += (roll.sum + frames[idx+1][0])
      end
    elsif roll.sum == 10 # for a spare
      score += (roll.sum + frames[idx+1][0])
    else
      score += roll.sum # calculate the score and add it to the total
    end
    score # add the score to the scorecard array
  end

  def standard_roll(roll, frames, idx, score, total)
    if strike?(roll)
      if second_strike?(roll, idx, frames)
        if third_strike?(roll, idx, frames)
          score += (roll.sum + frames[idx+1].sum + frames[idx+2].sum)
        else
          score += (roll.sum + frames[idx+1].sum + frames[idx+2][0])
        end
      else
        score += (roll.sum + frames[idx+1].sum)
      end
    elsif roll.sum == 10
      score += (roll.sum + frames[idx+1][0])
    else
      score += roll.sum
    end
    score
  end
end
