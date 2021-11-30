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

    it 'calculates the total score of a perfect game to be 300:' do
      game = Bowling.new()
      game.calculate_score({ 
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
      })
      
      expect(game.score).to eq 300
    end

    it 'calculates the total score of a game with no spares:' do
      game = Bowling.new()
      game.calculate_score({ 
        frame_1: [2,5],
        frame_2: [2,5],
        frame_3: [2,5],
        frame_4: [7,1],
        frame_5: [3,0], 
        frame_6: [1,1], 
        frame_7: [1,5], 
        frame_8: [9,0], 
        frame_9: [6,1], 
        frame_10: [5,2]
      })
      
      expect(game.score).to eq 63
    end
  end
end
