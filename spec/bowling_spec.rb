# frozen_string_literal: true

require 'bowling'

describe BowlingGame do
  context 'no strikes or spares' do 
    it 'returns a total of all the pins knocked down simply added together' do 
      game = BowlingGame.new(Kernel, [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
      expect(game.score).to eq(20)
    end

    it 'returns a total of all the pins knocked down simply added together' do 
      game = BowlingGame.new(Kernel, [3, 1, 4, 5, 8, 0, 2, 2, 1, 7, 4, 2, 5, 4, 3, 0, 0, 0, 7, 1])
      expect(game.score).to eq(59)
    end
  end

  context 'normal game plus some strikes' do
    it 'returns the score + when theres a strike it applies a bonus to that frame (10 + following 2 rolls)' do
      game = BowlingGame.new(Kernel, [1, 4, 4, 5, 6, 3, 5, 3, 10, 0, 1, 7, 2, 6, 2, 10, 2, 7])
      expect(game.score).to eq(88)
    end

    it 'returns the score + when theres a strike it applies a bonus to that frame (10 + following 2 rolls)' do 
      game = BowlingGame.new(Kernel, [4, 3, 6, 0, 7, 2, 10, 3, 1, 6, 3, 10, 10, 10, 3, 1])
      expect(game.score).to eq(120)
    end
  end

  context 'normal game plus some spares' do 
    it 'returns the score + when theres a spare it applies a bonus to that frame (10 + first roll of the next frame)' do 
      game = BowlingGame.new(Kernel, [8, 0, 5, 3, 9, 1, 5, 5, 1, 3, 0, 4, 5, 5, 1, 3, 9, 0, 3, 4])
      expect(game.score).to eq(81)
    end
  end

  context 'more examples' do 
    it 'returns 300 for a perfect game' do
      game = BowlingGame.new(Kernel, [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
      expect(game.score).to eq(300)
    end

    it 'returns 0 for a game of zeros' do
      game = BowlingGame.new(Kernel, Array.new(20, 0))
      expect(game.score).to eq(0)
    end

    it 'returns the correct score for a game involving normal frames + strikes + spares' do 
      game = BowlingGame.new(Kernel, [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6])
      expect(game.score).to eq(133)
    end
  end

  context 'output' do
    it 'takes values user input and calculates the score' do
      io = double(:io)
      expect(io).to receive(:puts).with('Input the score for each frame...')
      expect(io).to receive(:puts).with('If you scored a strike simply input 10')
      expect(io).to receive(:puts).with('Otherwise input 2 numbers seperated by a comma')
      expect(io).to receive(:puts).with('Examples:')
      expect(io).to receive(:puts).with('4,3 if you knocked 4 pins followed by 3')
      expect(io).to receive(:puts).with('or')
      expect(io).to receive(:puts).with('3,7 if you knocked 3 pins followed by 7')
      expect(io).to receive(:puts).with('Final frame could be 1. if you get strikes or 2. if you get a spare or 3. if not a strike or a spare:')
      expect(io).to receive(:puts).with('1. 10,10,10')
      expect(io).to receive(:puts).with('or')
      expect(io).to receive(:puts).with('2. 3,7,5')
      expect(io).to receive(:puts).with('or')
      expect(io).to receive(:puts).with('3. 4,3')
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
