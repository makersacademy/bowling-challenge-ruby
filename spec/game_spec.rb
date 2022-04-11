# frozen_string_literal: true

require 'game'

describe Game do
  it 'returns the score after a roll' do
    subject.roll(2)
    expect(subject.score).to eq 0
  end

  it 'returns the score after two rolls' do
    subject.roll(2)
    subject.roll(2)
    expect(subject.score).to eq 4
  end

  it 'returns the score after three rolls' do
    subject.roll(2)
    subject.roll(2)
    subject.roll(2)
    expect(subject.score).to eq 4
  end

  it 'creates multiple frames and saves them to the scorecard has' do
    subject.roll(2)
    subject.roll(2)
    subject.roll(2)
    subject.roll(2)
    expect(subject.scorecard.count).to eq 2
  end

  it 'returns the score after three rolls with a spare' do
    subject.roll(5)
    subject.roll(5)
    subject.roll(2)
    expect(subject.score).to eq 12
  end

  it 'returns the score after four rolls with a spare' do
    subject.roll(5)
    subject.roll(5)
    subject.roll(2)
    subject.roll(2)
    expect(subject.score).to eq 16
  end

  it 'returns the score after five rolls with two spares' do
    subject.roll(5)
    subject.roll(5)
    subject.roll(4)
    subject.roll(6)
    subject.roll(2)
    expect(subject.score).to eq 26
  end

  it 'returns the score after six rolls with two spares' do
    subject.roll(5)
    subject.roll(5)
    subject.roll(4)
    subject.roll(6)
    subject.roll(2)
    subject.roll(2)
    expect(subject.score).to eq 30
  end

  it 'returns the score after six rolls with two spares' do
    subject.roll(5)
    subject.roll(5)
    subject.roll(4)
    subject.roll(6)
    subject.roll(2)
    subject.roll(2)
    expect(subject.score).to eq 30
  end

  it 'returns the perfect game' do
    subject.roll(10)
    subject.roll(10)
    subject.roll(10)
    subject.roll(10)
    subject.roll(10)
    subject.roll(10)
    subject.roll(10)
    subject.roll(10)
    subject.roll(10)
    subject.roll(10)
    subject.roll(10)
    subject.roll(10)
    expect(subject.score).to eq 300
  end
end
