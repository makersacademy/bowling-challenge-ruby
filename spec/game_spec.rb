require 'game'

describe Game do
  
  it 'calculates a gutter game' do
    game = Game.new
    20.times { game.roll 0 }
    expect(game.points).to eq 0
  end
  
end