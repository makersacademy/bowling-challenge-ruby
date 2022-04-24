require 'game'

describe Game do
  it 'can tell you what the current score is' do
    subject.add_score(5)

    expect(subject.score).to eq 5
  end

  it 'knows that frames have a maximum of two moves' do
    subject.add_score(5)
    subject.add_score(5)
    subject.add_score(5)

    expect(subject.frame_number).to be 2
  end

  it 'knows what the current roll is' do
    subject.add_score(5)
    subject.add_score(5)
    subject.add_score(5)

    expect(subject.roll_number).to eq 3
  end

  it 'knows to add a bonus when there has been a strike' do
    subject.add_score(10)
    subject.add_score(5)
    subject.add_score(5)

    expect(subject.score).to eq 30
  end
  
end

