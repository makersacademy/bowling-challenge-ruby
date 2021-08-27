require 'game' 

describe Game do 
  it 'tracks the total score' do
    expect(subject.total_score).to be >= 0
    expect(subject.total_score).to be <= 300
  end
end
