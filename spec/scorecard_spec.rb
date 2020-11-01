require 'scorecard'

describe Scorecard do
  
  it 'knows the current score' do
    subject.add_score(5)

    expect(subject.current_score).to eq 5
  end

  it 'can tell the current roll number' do
    subject.add_score(5)
    subject.add_score(5)

    expect(subject.current_roll).to eq 2
  end
 
end

