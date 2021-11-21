require 'game'

describe Game do
  
  it 'calculates a gutter game' do
    game = Game.new
    20.times { game.roll(0) }
    expect(game.points).to eq 0
  end

  it 'calculates all ones' do
    game = Game.new
    20.times { game.roll(1) }
    expect(game.points).to eq 20
  end  

  it 'calculates a spare' do
    game = Game.new
    game.roll(5)
    game.roll(5)
    game.roll(3)
    17.times { game.roll(0) }
    expect(game.points).to eq 16
  end

end