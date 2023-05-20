require 'bowling_game'
require 'bowling_scorecard'

RSpec.describe 'scoring integration' do
  it 'calculates the score of a regular bowling game with no strikes or spares' do
    game = BowlingGame.new

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

  xit 'calculates the score of a regular bowling game with spares but no strikes' do
    game = BowlingGame.new

    game.roll(3)
    game.roll(4)
    game.roll(1)
    game.roll(7)
    game.roll(0)
    game.roll(3)
    game.roll(2)
    game.roll(6)
    # first spare
    game.roll(0)
    game.roll(10)
    # next roll doubled
    game.roll(1)
    game.roll(0)
    game.roll(0)
    game.roll(0)
    # second spare
    game.roll(1)
    game.roll(9)
    # next roll doubled
    game.roll(7)
    game.roll(2)
    game.roll(4)
    game.roll(1)
    
    expect(game.total_score).to eq 69
  end
  
end
