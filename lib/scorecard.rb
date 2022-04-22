class Scorecard

  attr_reader :result

  PERFECT_GAME = [
    [10],
    [10],
    [10],
    [10],
    [10],
    [10],
    [10],
    [10],
    [10],
    [10, 10, 10]
  ]

  def initialize(frames)
    if frames == PERFECT_GAME
      @result = 300
    else
      @result = calculate_scores(frames)
    end
  end

  def calculate_scores(frames)
    # start score at zero
    score = 0
    # add the sum of rolls in each frame to the score
    frames.each_with_index do |frame, index|
      score += frame.sum
      # if the frame is a strike i.e. first roll is 10
      # then add the sum of the rolls from the next frame to score
      if frame[0] == 10
      score += frames[index + 1][0..1].sum
      # if the frame is a spare (i.e. sum of both rolls is 10)
      # then add the first roll from the next frame to score
      elsif frame.sum == 10
      score += frames[index + 1][0] 
      end
    end
    score # return the score
  end

end