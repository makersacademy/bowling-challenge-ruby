require 'rspec'
require 'game.rb'

describe 'bowling' do

  it 'can initialize a game' do
    game = Game.new
  end

  it 'can bowl all zeros' do 
    game = Game.new
    20.times{game.bowl 0}
    expect(game.score).to eq 0
  end

  it 'can bowl all ones' do 
    game = Game.new
    20.times{game.bowl 1}
    expect(game.score).to eq 20
  end

  it 'can bowl a spare' do
    game = Game.new
    game.bowl(5)
    game.bowl(5)
    game.bowl(2)
    17.times{game.bowl 0}
    expect(game.score).to eq 14
  end

  it 'bowl a strike' do
    game = Game.new
    game.bowl(10)
    game.bowl(5)
    game.bowl(2)
    16.times{game.bowl 0}
    expect(game.score).to eq 24
  end
end
