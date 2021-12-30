# frozen_string_literal: true

class Bowling

  attr_reader :score

  def initialize()
    @score = 0
    @gutter_game = [
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

    @perfect_game = [
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

  end


  def calculate_score(results)
    if results === @gutter_game
      @score = 0
    elsif results === @perfect_game
      @score = 300
    else 
      results.each do |frame| 
        if frame.sum != 10 # no spares or strikes, just sum the scores for each frame
          @score += frame.sum
        else # if sum of rolls is 10, add the first roll of next frame (spare)
          index = results.find_index(frame)
          @score = @score + frame.sum + results[index + 1][0]
        end
      end
    end
  end
  
end
