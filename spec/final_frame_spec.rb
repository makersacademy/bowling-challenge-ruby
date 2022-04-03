# frozen_string_literal: true

require 'final_frame'

describe FinalFrame do
  it 'can hold three rolls if the first is a strike' do
    subject.add_roll(10)
    subject.add_roll(4)
    subject.add_roll(4)
    expect(subject.frame_score).to eq 18
  end

  it 'can hold three rolls if it has a spare' do
    subject.add_roll(5)
    subject.add_roll(5)
    subject.add_roll(4)
    expect(subject.frame_score).to eq 14
  end

  it 'returns the score after two rolls if neither strike nor spare' do
    subject.add_roll(4)
    subject.add_roll(4)
    expect(subject.frame_score).to eq 8
  end
end
