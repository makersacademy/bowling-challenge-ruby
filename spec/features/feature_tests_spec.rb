require './lib/game.rb'
require './lib/frame.rb'
require './lib/final_frame.rb'
require './lib/roll.rb'
require 'capybara/rspec'

feature 'Bowling' do
  scenario 'gutter game' do
    game = Game.new
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end

  scenario 'all 1s' do
    game = Game.new
    20.times { game.roll(1) }
    expect(game.score).to eq 20
  end

  scenario 'one spare, rest gutter' do
    game = Game.new
    2.times { game.roll(5) }
    18.times { game.roll(0) }
    expect(game.score).to eq 10
  end

  scenario 'one strike, rest gutter' do
    game = Game.new
    1.times { game.roll(10) }
    18.times { game.roll(0) }
    expect(game.score).to eq 10
  end

  scenario 'perfect game' do
    game = Game.new
    12.times { game.roll(10) }
    expect(game.score).to eq 300
  end

  scenario 'all spares' do
    game = Game.new
    21.times { game.roll(5) }
    expect(game.score).to eq 150
  end

  scenario 'wiki example on images directory' do
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
    expect(game.score).to eq 133
  end

  scenario 'something random' do
    game = Game.new
    14.times { game.roll(0) }
    3.times { game.roll(1) }
    game.roll(2)
    game.roll(3)
    game.roll(4)
    expect(game.score).to eq 12
  end
end