require 'scorecard'

describe Scorecard do

  let(:game) { Scorecard.new }

  it 'can score a gutter game' do 
    20.times{ game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'can score a game of all ones' do 
    20.times{ game.roll(1) }
    expect(game.score).to eq 20
  end

  it 'can score a spare' do
    game.roll(6)
    game.roll(4)
    game.roll(5)
    17.times{ game.roll(0) }
    expect(game.score).to eq 20
  end

  it 'can score a strike' do
    game.roll(10)
    game.roll(3)
    game.roll(6)
    16.times{ game.roll(0) }
    expect(game.score).to eq 28
  end

  it 'can score a perfect game' do
    12.times{ game.roll(10) }
    expect(game.score).to eq 300
  end

  it 'can allow for 2 bonus rolls for a strike in the 10th frame' do
    18.times{ game.roll(1) }
    game.roll(10)
    game.roll(3)
    game.roll(4)
    expect(game.score).to eq 35
  end

  it 'can allow for 1 bonus roll for a spare in the 10th frame' do
    18.times{ game.roll(1) }
    game.roll(5)
    game.roll(5)
    game.roll(8)
    expect(game.score).to eq 36
  end

  # it 'can end the game after 10 frames' do
  # 
  # end

  it 'can raise an error to prevent rolls above 10' do
    expect{ game.roll(11) }.to raise_error 'Error: only 10 pins per frame'
  end
  
end