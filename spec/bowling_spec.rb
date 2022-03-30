require './lib/bowling'

describe Bowling do
  it 'it responds to add_roll' do
    expect(subject).to respond_to :add_roll
  end

  it 'add_roll adds to the total' do
    game = Bowling.new
    game.add_roll(6)
    expect(game.total).to eq 6
  end

  it 'scoring a spare adds bonus' do
    game = Bowling.new
    game.add_roll(6)
    game.add_roll(4)
    expect(game.bonus).to eq 1
  end

  it 'scoring a spare doubles next roll' do
    game = Bowling.new
    game.add_roll(3)
    game.add_roll(7)
    game.add_roll(3)
    expect(game.total).to eq 16
  end

  it 'spare bonus only lasts 1 round' do
    game = Bowling.new
    game.add_roll(6)
    game.add_roll(4)
    game.add_roll(4)
    expect(game.bonus).to eq 0
  end

  it 'scoring a stike gives 2 rounds of bonus scores' do
    game = Bowling.new
    game.add_roll(6)
    game.add_roll(4)
    game.add_roll(10)
    expect(game.bonus).to eq 2
  end

  it 'gutter game gives you 0 points' do
    game = Bowling.new
    20.times { game.add_roll(0) }
    expect(game.total).to eq 0
  end

  it 'rolling after the game is over gives you an error' do
    game = Bowling.new
    20.times { game.add_roll(0) }
    expect { game.add_roll(0) }.to raise_error 'The game is over!'
  end

  it 'perfect game scores 300' do
    game = Bowling.new
    12.times { game.add_roll(10) }
    expect(game.total).to eq 300
  end

end
