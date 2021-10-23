# frozen_string_literal: true

require './lib/score'

describe Scoring do
  it 'calculates regular score per frame' do
    s = Scoring.new(
      [
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 10, 10]
      ]
    )
    expect(s.regular_score_per_frame).to eq(
      [
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10
      ]
    )
  end
  it 'calculates bonus score per frame' do
    s = Scoring.new(
      [
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 10, 10]
      ]
    )
    expect(s.bonus_score_per_frame).to eq(
      [
        20,
        20,
        20,
        20,
        20,
        20,
        20,
        20,
        20,
        20
      ]
    )
  end
  it 'calculates total score per frame' do
    s = Scoring.new(
      [
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 10, 10]
      ]
    )
    expect(s.total_score_per_frame).to eq(
      [
        30,
        30,
        30,
        30,
        30,
        30,
        30,
        30,
        30,
        30
      ]
    )
  end
  it 'calculates total' do
    s = Scoring.new(
      [
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 0],
        [10, 10, 10]
      ]
    )
    expect(s.total_score).to eq(
      300
    )
  end
end
