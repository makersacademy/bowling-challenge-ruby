class Scorecard
  def score(array)
    total = [] # where the score will be returned from
    score = 0 # to calculate the running total
    frames = array.each_slice(2).to_a # to split the array score into frames
    frames.each_with_index do |roll, idx| # seperate out each frame to calculate
      unless roll.sum == 10
        score += roll.sum # calculate the score and add it to the total
      else
        score += (roll.sum + frames[idx+1][0])
      end
      total << score # add the score to the scorecard array
    end
    total #return the scorecard array
  end
end
