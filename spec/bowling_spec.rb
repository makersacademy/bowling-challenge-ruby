require 'bowling'

describe "Bowling" do

  let(:game) {Bowling.new}

  describe "#roll" do
    it 'Should be able to make a roll' do
      game.roll(5)
      expect(game.score).to eq(5)
    end
  end

  describe "#score" do
    it 'Should be able to calculate a full game of bowling' do
      20.times{game.roll(1)}
      expect(game.score).to eq(20)
    end

    it 'Should be able to roll a gutter game' do
      20.times{game.roll(0)}
      expect(game.score).to eq(0)
    end

    it 'You can roll a spare' do
      game.roll(5)
      game.roll(5)
      game.roll(3)
      17.times{game.roll(0)}
      expect(game.score).to eq(16)
    end
  end
end
