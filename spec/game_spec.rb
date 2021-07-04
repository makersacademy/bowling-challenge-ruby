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


end
