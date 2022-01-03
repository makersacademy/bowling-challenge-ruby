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
    # it 'adds two rolls together for a frame' do
    #   game.roll(4)
    #   game.roll(2)
    #   expect(game.score).to eq(6)
    # end

    it 'gives a total running score after each frame' do
      game.roll(4)
      game.roll(2)
      game.score
      game.roll(5)
      game.roll(3)
      game.score
      expect(game.score).to include(14)
    end
  end
end
