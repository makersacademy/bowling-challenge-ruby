# frozen_string_literal: true

require_relative '../lib/bowling'

describe Bowling do
  describe '.score' do
    it 'returns the total score of the game' do
      game = Bowling.new({ 
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
      })
      expect(game.score).to eq 133
    end
  end
end
