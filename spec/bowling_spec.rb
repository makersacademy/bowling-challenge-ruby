# frozen_string_literal: true

require_relative '../lib/bowling'

describe Bowling do
  describe '.score' do
    it 'calculates the total score of a gutter game to be 0:' do
      game = Bowling.new()
      game.calculate_score([
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
      ])
      
      expect(game.score).to eq 0
    end

    it 'calculates the total score of a perfect game to be 300:' do
      game = Bowling.new()
      game.calculate_score([
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
      ])
      
      expect(game.score).to eq 300
    end

    it 'calculates the total score of a game with no spares:' do
      game = Bowling.new()
      game.calculate_score( [
        [2,5], # 7
        [2,5], # 7
        [2,5], # 7
        [7,1], # 8
        [3,0], # 3
        [1,1], # 2
        [1,5], # 6
        [9,0], # 9
        [6,1], # 7
        [5,2] # 7
      ])
      
      expect(game.score).to eq 63
    end

    it 'calculates the total score of a game with a spare:' do
      game = Bowling.new()
      game.calculate_score([
        [5,5], # 12
        [2,5], # 7
        [2,5], # 7
        [7,1], # 8
        [3,0], # 3
        [1,1], # 2
        [1,5], # 6
        [9,0], # 9
        [6,1], # 7
        [5,2] # 7
      ])
      
      expect(game.score).to eq 68
    end
  end
end
