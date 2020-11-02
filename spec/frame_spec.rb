require 'frame'

describe Frame do
  it 'can tell you the current roll of the frame' do
    subject.add_score(5)

    expect(subject.frame_roll).to eq 1
  end

  it 'keeps track of the current frame scoere' do
    subject.add_score(5)
    subject.add_score(5)

    expect(subject.score).to eq 10
  end

  it 'knows whether a strike has been rolled' do
    subject.add_score(10)

    expect(subject.strike?).to be true
  end
  
end