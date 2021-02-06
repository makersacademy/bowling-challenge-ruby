class Scorecard
  def score(array)
    total = [] # where the score will be returned from
    score = 0 # to calculate the running total
    strikes = []
    array.each_with_index do |roll, idx|
        if roll == 10
          strikes << idx
        end
      end
    strikes.reverse.each do |str_idx|
       array.insert((str_idx+1), 0)
    end
    frames = array.each_slice(2).to_a # to split the array score into frames
    frames.each_with_index do |roll, idx| # seperate out each frame to calculate
      if roll.sum == 10 && roll[1] == 0 # for a strike
        score += (roll.sum + frames[idx+1].sum)
      elsif roll.sum == 10 # for a spare
        score += (roll.sum + frames[idx+1][0])
      else
        score += roll.sum # calculate the score and add it to the total
      end
      total << score # add the score to the scorecard array
    end
    unless total.length <= 10
      total.pop
    end
    total
  end
end
