# frozen_string_literal: true

require 'bowling'

describe BowlingScore do
  let(:bowling) { BowlingScore.new }
  it 'hits 5 pins' do
    expect(bowling.hit(5)).to eq(5)
  end

  context '#current_score' do
    it 'current score to equal 5' do
      bowling.hit(5)
      expect(bowling.current_score).to eq(5)
    end

    it 'current score to equal 9' do
      bowling.hit(5)
      bowling.hit(4)
      expect(bowling.current_score).to eq(9)
    end
  end

  it 'gutters the ball' do
    bowling.gutter
    expect(bowling.current_score).to eq(0)
  end

  it 'hit a spare' do
    bowling.hit(4)
    bowling.hit(6)
    expect(bowling.spare).to eq('Spare!')
  end

  it 'determines number of rolls' do
    bowling.hit(4)
    bowling.hit(3)
    expect(bowling.number_of_rolls).to eq(2)
  end
end
