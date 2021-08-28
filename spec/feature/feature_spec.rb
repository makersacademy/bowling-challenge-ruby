require 'game'

describe 'Feature tests' do

  it 'enters one roll' do
    game = Game.new
    game.roll(3)
  end

  it 'enters two rolls' do
    game = Game.new
    game.roll(4)
    game.roll(3)
  end

end
