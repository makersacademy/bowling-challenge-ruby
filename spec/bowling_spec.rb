# frozen_string_literal: true

require_relative '../lib/bowling'

describe Bowling do
  describe '.score' do
    it 'calculates the total score of a gutter game to be 0:' do
      game = Bowling.new()
      game.calculate_score({ 
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
      })
      
      expect(game.score).to eq 0
    end

    
  end
end
