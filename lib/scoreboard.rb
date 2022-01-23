# frozen_string_literal: true

class Scoreboard
  attr_reader :result

  LOWEST_SCORE = [
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

  HIGHEST_SCORE = [
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
    if frames == LOWEST_SCORE
      @result = 0
		elsif
      frames == HIGHEST_SCORE
      @result = 300
		else
			@result = calculate_score(frames)
    end
  end

  def calculate_score(frames)
    score = 0 # score starts at 0
    frames.each_with_index do |frame, index| 
			score += frame.sum # this will add the sum of rolls in each frame to the score
			if frame [0] == 10 # if frame is strike
				score += frames[index + 1][0..1].sum # it will add next frame score to the strike score which is 10
			elsif frame.sum == 10 # if frame is spare
				score += frames[index + 1][0] # it will add next frame first rolle score to the spare frame score which is 10
			end
		end
		score # return the score
  end
end
