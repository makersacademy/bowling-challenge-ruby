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

  it 'calculates a spare with a bonus in frames 1-9' do
    expect(subject.score([4,6,3,3])).to eq [13,19]
  end
end
