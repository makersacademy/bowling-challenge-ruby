# frozen_string_literal: true

require 'game'

describe Game do
  let(:game) { Game.new }

  describe '#initialize' do
    it 'it initializes with no rolls played' do
      expect(game.rolls).to eq []
    end
  end

  describe '#roll' do
    it { is_expected.to respond_to(:roll).with(1).argument }

    it 'it can roll and knock down 10 pins' do
      game.roll(10)
      expect(game.roll(10)).to include 10
    end
  end

  describe '#score' do
    context 'when player never hits a pin' do
      it 'rolls a gutter game' do
      20.times { game.roll(0) }
      expect(game.score).to eq 0
      end
    end
    
    context 'when player rolls a spare' do
      it 'calculates the running score after a spare is rolled' do
        game.roll(6)
        game.roll(4) # spare
        game.roll(3) # 2nd frame & bonus points for the spare
        game.roll(2)
        16.times { game.roll(0) }  # need to test a whole game of 10 frames to get our end score
        expect(game.score).to eq 18
      end
    end

    context 'when player rolls a strike' do
      it 'calculates the running score after a strike is rolled' do
        game.roll(10)
        game.roll(4)
        game.roll(2)
        17.times { game.roll(0) }
        expect(game.score).to eq 22
      end
    end

    context 'when player rolls 12 strikes' do
      it 'scores a perfect game with 300 points ' do
        12.times { game.roll(10) } # 10 rolls + 2 strikes for bonus in 10th frame
        expect(game.score).to eq 300
      end
    end
  end
end
