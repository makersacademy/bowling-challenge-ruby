require 'bowling_game'

RSpec.describe BowlingGame do
  # defines the class being tested
  let(:game) { BowlingGame.new }

  it 'constructs' do
    expect(game.rolls).to eq []
  end
  
  describe "#roll" do
    it 'adds the result of a single roll to the rolls array' do
      game.roll(5)

      expect(game.rolls).to eq [5]
    end

    it 'adds multiple results to the rolls array' do
      game.roll(5)
      game.roll(0)
      game.roll(3)

      expect(game.rolls).to eq [5, 0, 3]
    end
  end
end
