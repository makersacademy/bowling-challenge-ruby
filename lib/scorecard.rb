class Scorecard

  attr_reader :result

  GUTTER_GAME = [
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0]
  ]

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
    if frames == GUTTER_GAME
      @result = 0
    elsif frames == PERFECT_GAME
      @result = 300
    else
      @result = calculate_scores(frames)
    end
  end

  def calculate_scores(frames)
    score = 0 # start score at zero
    frames.each_with_index do |frame, index|
      score += frame.sum # add the sum of rolls in each frame to the score
      if frame[0] == 10 # if the frame is a strike i.e. first roll is 10
      score += frames[index + 1][0..1].sum # also add the sum of the rolls from the next frame to score
      elsif frame.sum == 10 # if the frame is a spare (i.e. sum of both rolls is 10)
      score += frames[index + 1][0] # then add the first roll from the next frame to score
      end
    end
    score # return the score
  end

end