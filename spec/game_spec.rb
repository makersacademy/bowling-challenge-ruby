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

  it "can bowl 12 strikes" do
    game = Game.new
    16.times{game.bowl 10}
    expect(game.score).to eq 300
  end

  it "can bowl all spares" do
    game = Game.new
    21.times{game.bowl 5}
    expect(game.score).to eq 150
  end

  it 'raise an error if pin_down is more than 10' do
    game = Game.new
    expect{game.bowl(11)}.to raise_error "Please enter a score of 10 or below"
  end

  it 'last game strike' do
    game = Game.new
    18.times { game.bowl(3) }
    game.bowl(10)
    game.bowl(7)
    game.bowl(2)
    expect(game.score).to eq 73
  end
end
