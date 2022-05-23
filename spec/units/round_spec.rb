require './lib/round'

describe Round do
  it 'returns 0 when 0 pins have been knocked over' do
    frames = [ [0,0] ,[0,0] ,[0,0] ,[0,0] ,[0,0] ,[0,0] ,[0,0] ,[0,0] ,[0,0] ,[0,0] ]
    round = Round.new(frames)
    expect(round.score).to eq 0
  end

  it 'returns 20 when one pin is knocked over each bowl' do
    frames = [ [1,1] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ]
    round = Round.new(frames)
    expect(round.score).to eq 20
  end

  it 'returns 29 when [[1,9],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]' do
    frames = [ [1,9] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ,[1,1] ]
    round = Round.new(frames)
    expect(round.score).to eq 29
  end

  it 'returns 30 when [[10,0],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]' do
    frames = [ [10,0],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1] ]
    round = Round.new(frames)
    expect(round.score).to eq 30
  end

  it 'returns 85 when [[10,0],[1,1],[1,1],[10,0],[9,1],[1,9],[10,0],[1,1],[1,1],[1,1]]' do
    frames = [ [10,0],[1,1],[1,1],[10,0],[9,1],[1,9],[10,0],[1,1],[1,1],[1,1]]
    round = Round.new(frames)
    expect(round.score).to eq 85
  end

  it 'returns 30 when [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[10,1,1]]' do
    frames = [ [1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[10,1,1] ]
    round = Round.new(frames)
    expect(round.score).to eq 30
    expect(round.basic_score).to eq 28
    expect(round.bonus_score).to eq 2
  end
end