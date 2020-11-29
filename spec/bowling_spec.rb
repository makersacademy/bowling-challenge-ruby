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
end
