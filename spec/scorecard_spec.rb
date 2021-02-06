require 'scorecard'

describe Scorecard do
  it 'returns a score' do
    expect(subject.score([0])).to eq [0]
  end

  it 'returns a score when points not 0' do
    expect(subject.score([1])).to eq [1]
  end

  it 'returns a score for a frame' do
    expect(subject.score([1,1])).to eq [2]
  end

  it 'returns a score for two frames' do
    expect(subject.score([1,1,1])).to eq [2,3]
  end

  it 'returns a score from 10 frames' do
    expect(subject.score([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])).to eq [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  end

  it 'returns a calculated score from 10 frames' do
    expect(subject.score([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])).to eq [2,4,6,8,10,12,14,16,18,20]
  end

  it 'calculates a single spare with a bonus in frames 1-9' do
    expect(subject.score([4,6,3,3])).to eq [13,19]
  end

  it 'calculates multiple spares with a bonus in frames 1-9' do
    expect(subject.score([4,6,3,3,7,3,2,2,1,9,8,1,3,7,7,3,2,2,2,2])).to eq [13,19,31,35,53,62,79,91,95,99]
  end

  it 'calculates multiple spares with a bonus in frames 10' do
    expect(subject.score([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1])).to eq [2,4,6,8,10,12,14,16,18,29]
  end

  it 'calculates multiple spares with a bonus in frames 10' do
    expect(subject.score([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1])).to eq [2,4,6,8,10,12,14,16,18,29]
  end

  it 'calculates multiple spares with a bonus in all frames' do
    expect(subject.score([4,6,8,2,2,9,1,9,9,1,6,4,9,1,5,5,5,5,6,4,7])).to eq [18,30,41,60,76,95,110,125,141,158]
  end

  it 'calculates a single strike in a frame' do
    expect(subject.score([10,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])).to eq [12,14,16,18,20,22,24,26,28,30]
  end

  it 'calculates multiple non consecutive strikes in a game(no spares)' do
    expect(subject.score([10,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])).to eq [12,14,16,18,20,22,24,26,28,30]
  end

end
