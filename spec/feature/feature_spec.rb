require 'game'

describe 'Feature tests' do

  context 'plays a full game' do
    game = Game.new
    game.roll(1)
    game.roll(4)
    game.roll(4)
    game.roll(5)
    game.roll(6)
    game.roll(4)
    game.roll(5)
    game.roll(5)
    game.roll(10)
    game.roll(0)
    game.roll(1)
    game.roll(7)
    game.roll(3)
    game.roll(6)
    game.roll(4)
    game.roll(10)
    game.roll(2)
    game.roll(8)
    game.roll(6)
    game.scorecard
  end

  context 'plays a partial game' do
    game = Game.new
    game.roll(1)
    game.roll(4)
    game.roll(4)
    game.roll(5)
    game.roll(6)
    game.roll(4)
    game.roll(5)
    game.scorecard
  end
  
  context 'plays a perfect game' do
    game = Game.new
    12.times { game.roll(10) }
    game.scorecard
  end

  context 'plays a nearly perfect game' do
    game = Game.new
    10.times { game.roll(10) }
    game.roll(3)
    game.roll(2)
    game.scorecard
  end

  context 'plays a gutter game' do
    game = Game.new
    20.times { game.roll(0) }
    game.scorecard
  end
end
