# frozen_string_literal: true

require 'bowling'

describe BowlingGame do
  context 'score' do
    it 'returns a total score of 133' do
      game = BowlingGame.new(Kernel, [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6])
      expect(game.score).to eq(133)
    end

    it 'returns 300 for a perfect game' do
      game = BowlingGame.new(Kernel, [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
      expect(game.score).to eq(300)
    end

    it 'returns 0 for a game of zeros' do
      game = BowlingGame.new(Kernel, Array.new(20, 0))
      expect(game.score).to eq(0)
    end
  end
  context 'output' do
    it 'takes values user input and calculates the score' do
      io = double(:io)
      expect(io).to receive(:puts).with('Input the score for each frame...')
      expect(io).to receive(:puts).with('If you scored a strike simply input 10')
      expect(io).to receive(:puts).with('Otherwise input 2 numbers seperated by a comma')
      expect(io).to receive(:puts).with('Examples:')
      expect(io).to receive(:puts).with('4,3')
      expect(io).to receive(:puts).with('or')
      expect(io).to receive(:puts).with('3,7')
      expect(io).to receive(:puts).with('Final frame could be 1. if you get strikes or 2. if you get a spare:')
      expect(io).to receive(:puts).with('1. 10,10,10')
      expect(io).to receive(:puts).with('or')
      expect(io).to receive(:puts).with('2. 3,7,5')
      expect(io).to receive(:puts).with('What was you score for Frame 1?')
      expect(io).to receive(:gets).and_return('1,4')
      expect(io).to receive(:puts).with('What was you score for Frame 2?')
      expect(io).to receive(:gets).and_return('4,5')
      expect(io).to receive(:puts).with('What was you score for Frame 3?')
      expect(io).to receive(:gets).and_return('6,4')
      expect(io).to receive(:puts).with('What was you score for Frame 4?')
      expect(io).to receive(:gets).and_return('5,5')
      expect(io).to receive(:puts).with('What was you score for Frame 5?')
      expect(io).to receive(:gets).and_return('10')
      expect(io).to receive(:puts).with('What was you score for Frame 6?')
      expect(io).to receive(:gets).and_return('0,1')
      expect(io).to receive(:puts).with('What was you score for Frame 7?')
      expect(io).to receive(:gets).and_return('7,3')
      expect(io).to receive(:puts).with('What was you score for Frame 8?')
      expect(io).to receive(:gets).and_return('6,4')
      expect(io).to receive(:puts).with('What was you score for Frame 9?')
      expect(io).to receive(:gets).and_return('10')
      expect(io).to receive(:puts).with('What was you score for Frame 10?')
      expect(io).to receive(:gets).and_return('2,8,6')
      expect(io).to receive(:puts).with('Score after Frame 1: 5')
      expect(io).to receive(:puts).with('Score after Frame 2: 14')
      expect(io).to receive(:puts).with('Score after Frame 3: 29')
      expect(io).to receive(:puts).with('Score after Frame 4: 49')
      expect(io).to receive(:puts).with('Score after Frame 5: 60')
      expect(io).to receive(:puts).with('Score after Frame 6: 61')
      expect(io).to receive(:puts).with('Score after Frame 7: 77')
      expect(io).to receive(:puts).with('Score after Frame 8: 97')
      expect(io).to receive(:puts).with('Score after Frame 9: 117')
      expect(io).to receive(:puts).with('Score after Frame 10: 133')
      expect(io).to receive(:puts).with('You final score for this game was: 133')

      game = BowlingGame.new(io)
      game.input_score_for_frames
    end
  end
end
