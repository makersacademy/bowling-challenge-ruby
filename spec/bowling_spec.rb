require 'bowling'

describe "Bowling" do
  game = Bowling.new
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
  end
end
