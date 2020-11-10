require 'bowling_game'

describe BowlingGame do
  let(:game) { described_class.new }
  it 'can score a single frame of 0s' do
    2.times { game.bowl(0) }
    expect(game.score).to eq 0
  end

  it 'can score a single frame of 2s' do
    2.times { game.bowl(2) }
    expect(game.score).to eq 4
  end

  it 'can score a gutter game' do
    20.times { game.bowl(0) }
    expect(game.score).to eq 0
  end

  it 'can score a game of all 2s' do
    20.times { game.bowl(2) }
    expect(game.score).to eq 40
  end

  it 'can score a spare, followed by a 2' do
    2.times { game.bowl(5) }
    game.bowl(2)
    game.bowl(0)
    expect(game.score).to eq 14
  end

  it 'can score a strike, followed by a double 2' do
    game.bowl(10)
    2.times { game.bowl(2) }
    expect(game.score).to eq 18
  end

  it 'awards spare bonuses in final frame' do
    18.times { game.bowl(0) }
    2.times { game.bowl(5) }
    game.bowl(2)
    expect(game.score).to eq 12
  end

  it 'correctly scores three strikes in final frame' do
    18.times { game.bowl(0) }
    3.times { game.bowl(10) }
    expect(game.score).to eq 30
  end

  it 'can score a perfect game' do
    12.times { game.bowl(10) }
    expect(game.score).to eq 300
  end

  it 'can score a complicated game with spares and strikes' do
    subject.bowl(1)
    subject.bowl(4)
  
    subject.bowl(4)
    subject.bowl(5)
  
    subject.bowl(6)
    subject.bowl(4)
  
    subject.bowl(5)
    subject.bowl(5)
  
    subject.bowl(10)
  
    subject.bowl(0)
    subject.bowl(1)
  
    subject.bowl(7)
    subject.bowl(3)
  
    subject.bowl(6)
    subject.bowl(4)
  
    subject.bowl(10)
  
    subject.bowl(2)
    subject.bowl(8)
    subject.bowl(6)
    expect(subject.score).to eq 133
  end
end