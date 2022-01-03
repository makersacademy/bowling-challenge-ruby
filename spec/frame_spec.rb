require 'frame'

describe Frame do

  it 'should be able to input one roll' do
    subject.roll(1)
    expect(subject.rolls).to match_array [1]
  end

  it 'should be able to input two rolls' do
    subject.roll(1)
    subject.roll(2)
    expect(subject.rolls).to match_array [1,2]
  end

  it 'should be able to tell if it is a strike' do
    subject.roll(10)
    expect(subject.strike?).to be true
  end

  it 'should be able to tell if it is a spare' do
    subject.roll(1)
    subject.roll(9)
    expect(subject.spare?).to be true
  end

  it 'should be able to tell the difference between spare and strike' do
    subject.roll(10)
    expect(subject.spare?).to be false
  end

  it 'should know if it is complete' do
    subject.roll(1)
    subject.roll(2)
    expect(subject.complete?).to be true
  end

  it 'should be able to give a score' do
    subject.roll(1)
    subject.roll(2)
    expect(subject.score).to eq 3
  end

  it 'should be able to add a bonus' do
    subject.add_bonus(3)
    expect(subject.bonus).to eq 3
  end

end