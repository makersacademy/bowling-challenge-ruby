require 'runfile'

describe 'feature test' do
  it 'user can score their game of bowling' do
    game = Game.new
    12.times { game.add_bowl(pins: 10) }
  end
end