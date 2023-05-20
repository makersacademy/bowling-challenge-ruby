require 'bowling_game'

RSpec.describe BowlingGame do
  # defines the class being tested
  let(:scorecard) { double :scorecard }
  let(:game) { BowlingGame.new(scorecard) }

  it 'constructs' do
    expect(game.rolls).to eq []
    expect(game.scorecard).to eq scorecard
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


  describe '#total_score' do
    it 'returns the total score of a regular bowling game with no strikes or spares' do

      expect(scorecard).to receive(:calculate_total_score)
        .and_return(55)
        
      game.roll(3)
      game.roll(4)
      game.roll(1)
      game.roll(7)
      game.roll(0)
      game.roll(3)
      game.roll(2)
      game.roll(6)
      game.roll(8)
      game.roll(0)
      game.roll(1)
      game.roll(0)
      game.roll(0)
      game.roll(0)
      game.roll(1)
      game.roll(5)
      game.roll(7)
      game.roll(2)
      game.roll(4)
      game.roll(1)
      
      expect(game.total_score).to eq 55   
    end
  end
end
