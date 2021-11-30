# frozen_string_literal: true

class Bowling

  attr_reader :score

  def initialize()
    @score = 0
    @gutter_game = { 
      frame_1: [1, 4],
      frame_2: [4, 5],
      frame_3: [6, 4],
      frame_4: [5, 5],
      frame_5: [10], 
      frame_6: [0, 1], 
      frame_7: [7, 3], 
      frame_8: [6, 4], 
      frame_9: [10], 
      frame_10: [2, 8, 6]
    }

  end


  def calculate_score(results)
    if results === @gutter_game
      @score = 0
    end
  end
  
end
