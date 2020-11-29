require 'bowling'
describe Bowling do
  it 'it responds to add_roll' do
    expect(subject).to respond_to :add_roll
  end

  it 'add_roll adds to the total' do
    new_game = Bowling.new
    new_game.add_roll(6)
    expect(new_game.total).to eq 6
  end

  it 'scoring a spare applies bonus' do
    new_game = Bowling.new
    new_game.add_roll(6)
    new_game.add_roll(4)
    expect(new_game.bonus).to eq 1
  end

  it 'scoring a spare means that your next roll is doubled' do
    new_game = Bowling.new
    new_game.add_roll(6)
    new_game.add_roll(4)
    new_game.add_roll(4)
    expect(new_game.total).to eq 18
  end

  it 'a spares bonus only lasts for 1 round' do
    new_game = Bowling.new
    new_game.add_roll(6)
    new_game.add_roll(4)
    new_game.add_roll(4)
    expect(new_game.bonus).to eq 0
  end

  it 'scoring a stike means you get 2 rounds of bonus scores' do
    new_game = Bowling.new
    new_game.add_roll(6)
    new_game.add_roll(4)
    new_game.add_roll(10)
    expect(new_game.bonus).to eq 2
  end

  it 'scoring 2 strikes then a 5 gives you a total of 45' do
    new_game = Bowling.new
    new_game.add_roll(10)
    new_game.add_roll(10)
    new_game.add_roll(5)
    expect(new_game.total).to eq 45
  end

  it 'scoring 3 strikes then 4 3s gives you a score of 81' do
    new_game = Bowling.new
    3.times { new_game.add_roll(10) }
    4.times { new_game.add_roll(3) }
    expect(new_game.total).to eq 81
  end

  it 'gutter game gives you 0 points' do
    new_game = Bowling.new
    20.times { new_game.add_roll(0) }
    expect(new_game.total).to eq 0
  end

  it 'rolling after the game is over gives you an error' do
    new_game = Bowling.new
    20.times { new_game.add_roll(0) }
    expect { new_game.add_roll(0) }.to raise_error 'The game is over!'
  end

  it 'rolling a full game of 5s gives you a score of 150' do
    new_game = Bowling.new
    21.times { new_game.add_roll(5) }
    expect(new_game.total).to eq 150
  end

  it 'perfect game is 300' do
    new_game = Bowling.new
    12.times { new_game.add_roll(10) }
    expect(new_game.total).to eq 300
  end
end
