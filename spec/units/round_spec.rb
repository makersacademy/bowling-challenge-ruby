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
end