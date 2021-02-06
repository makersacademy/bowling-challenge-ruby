# frozen_string_literal: true

class Scorecard
  def score(array)
    find_strikes(array)
    total = bowling_calulation(array)
    ten_frames(total)
  end

  private

  def find_strikes(array)
    strikes = [] # to store strikes in the array
    array.each_with_index do |roll, idx|
      strikes << idx if roll == 10
    end
    strikes.reverse.each do |str_idx|
      array.insert((str_idx + 1), 0)
    end
  end

  def ten_frames(total)
    total.pop unless total.length <= 10
    total
  end

  def bowling_calulation(array)
    total = [] # where the score will be returned from
    score = 0 # to calculate the running total
    frames = array.each_slice(2).to_a # to split the array score into frames
    frames.each_with_index do |roll, idx| # seperate out each frame to calculate
      score += if roll.sum == 10 && (roll[1]).zero? # for a strike
                 if frames[idx + 1].sum == 10 && (roll[1]).zero? # roll 2 is strike
                   if frames[idx + 2].sum == 10 && (roll[1]).zero? # roll 3 is a strike
                     (roll.sum + frames[idx + 1].sum + frames[idx + 2].sum)
                   else
                     (roll.sum + frames[idx + 1].sum + frames[idx + 2][0])
                   end
                 else # roll 2 is not a strike
                   (roll.sum + frames[idx + 1].sum)
                 end
               elsif roll.sum == 10 # for a spare
                 (roll.sum + frames[idx + 1][0])
               else
                 roll.sum # calculate the score and add it to the total
               end
      total << score # add the score to the scorecard array
    end
    total
  end
end
