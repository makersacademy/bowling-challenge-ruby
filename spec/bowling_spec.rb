# frozen_string_literal: true

require './lib/bowling'

describe Bowling do
  it 'A score can be inputted' do
    expect(subject.input(5)).to eq 5
  end

  it 'A score must be between 1 and 10' do
    expect { subject.input(11) }.to raise_error('Not a valid score!')
    expect { subject.input(-2) }.to raise_error('Not a valid score!')
  end

  it 'The turn and roll are known' do
    expect(subject.roll).to eq 1
    expect(subject.turn).to eq 1
  end

  it 'I can ask for the current score after a roll' do
    subject.input(5)
    expect(subject.current_score).to eq 5
  end

  it 'The rolls are inputted onto a hash' do
    subject.input(5)
    expect(subject.rolls[1][0]).to eq 5
  end

  it 'If two rolls are completed, both are inputed onto the hash in an array' do
    subject.input(5)
    subject.input(4)
    expect(subject.rolls[1]).to eq [5, 4]
  end

  it 'If the second roll plus the first would be greater than 10, an error is raised' do
    subject.input(5)
    expect { subject.input(6) }.to raise_error('Not a valid score!')
  end

  it 'After 2 rolls, the turn moves on one' do
    subject.input(5)
    subject.input(4)
    expect(subject.turn).to eq 2
  end

  it "A ten on the first go is stored as a strike" do
    subject.input(10)
    expect(subject.strikes[1]).to eq "X"
  end

  it "A strike means that turn only has 1 roll" do
    subject.input(10)
    expect(subject.turn).to eq 2
  end

  it "If the second go makes it add up to 10, it is a spare" do
    subject.input(5)
    subject.input(5)
    expect(subject.strikes[1]).to eq "/"
  end

  it "After 10 turns, the game is over" do
    scorecard = Bowling.new
    scorecard.instance_variable_set(:@turn, 11)
    expect(scorecard.turn_check).to eq 5
  end

  it "If a strike or spare is rolled on the 10th go, that go gets 3 rolls" do

  end

  it "After your final go, the app presents you with your score" do

  end
end
