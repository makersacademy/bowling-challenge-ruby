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

  it 'returns a score from a full array' do
    expect(subject.score([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])).to eq [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  end
end
