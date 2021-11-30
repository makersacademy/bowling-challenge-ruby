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

  end


  def calculate_score(results)
    if results === @gutter_game
      @score = 0
    end
  end
  
end
