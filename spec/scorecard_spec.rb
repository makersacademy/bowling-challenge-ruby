require 'scorecard'

describe Scorecard do 
  it 'player can input a number' do
    subject.roll_input(5)
    expect(subject.score). to eq 5
  end

  it 'player can receive sum of multiple inputs' do
    subject.roll_input(5)
    expect(subject.score). to eq 5
    subject.roll_input(4)
    expect(subject.score). to eq 9
    subject.roll_input(3)
    expect(subject.score). to eq 12
    subject.roll_input(2)
    expect(subject.score). to eq 14
  end
