require 'frame' 

describe Frame do
  it 'starts open' do
    expect(subject.finished).to eq false
  end

  it 'has a regular score' do
    expect(subject.regular_score).to eq 0
  end

  it 'has a bonus score' do
    expect(subject.bonus_score).to eq 0
  end
end
