# frozen_string_literal: true

class Bowling

  attr_reader :score

  def initialize()
    @score = 0
    @gutter_game = { 
      frame_1: [0, 0],
      frame_2: [0, 0],
      frame_3: [0, 0],
      frame_4: [0, 0],
      frame_5: [0, 0], 
      frame_6: [0, 0], 
      frame_7: [0, 0], 
      frame_8: [0, 0], 
      frame_9: [0, 0], 
      frame_10: [0, 0]
    }

    @perfect_game = { 
      frame_1: [10],
      frame_2: [10],
      frame_3: [10],
      frame_4: [10],
      frame_5: [10], 
      frame_6: [10], 
      frame_7: [10], 
      frame_8: [10], 
      frame_9: [10], 
      frame_10: [10, 10, 10]
    }

  end


  def calculate_score(results)
    if results === @gutter_game
      @score = 0
    elsif results === @perfect_game
      @score = 300
    else # no spares or strikes, just sum the scores for each frame
      results.each_value{|frame| @score += frame.sum}
    end
  end
  
end
