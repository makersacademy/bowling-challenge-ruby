require 'game' 

describe Game do 
  it 'tracks the total score' do
    expect(subject.total_score).to be >= 0
    expect(subject.total_score).to be <= 300
  end

  it 'tracks the frames' do
    expect(subject.frames.length).to be >= 1
    expect(subject.frames.length).to be <= 10
  end
end
