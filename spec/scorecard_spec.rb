# frozen_string_literal: true

require 'scorecard'

describe Scorecard do
  it 'returns a score' do
    expect(subject.score([0])).to eq [0]
  end

  it 'returns a score when points not 0' do
    expect(subject.score([1])).to eq [1]
  end

  it 'returns a score for a frame' do
    expect(subject.score([1, 1])).to eq [2]
  end

  it 'returns a score for two frames' do
    expect(subject.score([1, 1, 1])).to eq [2, 3]
  end

  it 'returns a score from 10 frames' do
    expect(subject.score([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0])).to eq [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  end

  it 'returns a calculated score from 10 frames' do
    expect(subject.score([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                          1])).to eq [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
  end

  it 'calculates a single spare with a bonus in frames 1-9' do
    expect(subject.score([4, 6, 3, 3])).to eq [13, 19]
  end

  it 'calculates multiple spares with a bonus in frames 1-9' do
    expect(subject.score([4, 6, 3, 3, 7, 3, 2, 2, 1, 9, 8, 1, 3, 7, 7, 3, 2, 2, 2,
                          2])).to eq [13, 19, 31, 35, 53, 62, 79, 91, 95, 99]
  end

  it 'calculates multiple spares with a bonus in frames 10' do
    expect(subject.score([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9,
                          1])).to eq [2, 4, 6, 8, 10, 12, 14, 16, 18, 29]
  end

  it 'calculates multiple spares with a bonus in frames 10' do
    expect(subject.score([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9,
                          1])).to eq [2, 4, 6, 8, 10, 12, 14, 16, 18, 29]
  end

  it 'calculates multiple spares with a bonus in all frames' do
    expect(subject.score([4, 6, 8, 2, 2, 9, 1, 9, 9, 1, 6, 4, 9, 1, 5, 5, 5, 5, 6, 4,
                          7])).to eq [18, 30, 41, 60, 76, 95, 110, 125, 141, 158]
  end

  it 'calculates a single strike in a frame' do
    expect(subject.score([10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                          1])).to eq [12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
  end

  it 'calculates multiple non consecutive strikes in a game(no spares)' do
    expect(subject.score([10, 3, 4, 10, 2, 2, 10, 0, 2, 10, 3, 4, 10, 3,
                          3])).to eq [17, 24, 38, 42, 54, 56, 73, 80, 96, 102]
  end

  it 'calculates multiple non consecutive strikes in a game(with spares non consecutive)' do
    expect(subject.score([10, 3, 4, 3, 7, 3, 3, 10, 3, 3, 9, 1, 7, 1, 10, 1,
                          1])).to eq [17, 24, 37, 43, 59, 65, 82, 90, 102, 104]
  end

  it 'calculates 2 consecutive strikes in a game' do
    expect(subject.score([10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                          1])).to eq [21, 33, 35, 37, 39, 41, 43, 45, 47, 49]
  end

  it 'calculates 3 consecutive strikes in a game' do
    expect(subject.score([10, 10, 10, 1, 2, 3, 4, 5, 4, 6, 3, 2, 1, 0, 2, 9,
                          0])).to eq [30, 51, 64, 67, 74, 83, 92, 95, 97, 106]
  end

  it 'calculates more than 3 consecutive strikes in a game' do
    expect(subject.score([10, 10, 10, 10, 10, 9, 0, 6, 2, 8, 2, 3, 4, 2,
                          3])).to eq [30, 60, 90, 119, 138, 147, 155, 168, 175, 180]
  end

  it 'calculates 9 strikes' do
    expect(subject.score([10, 10, 10, 10, 10, 10, 10, 10, 10, 9,
                          0])).to eq [30, 60, 90, 120, 150, 180, 210, 239, 258, 267]
  end

  it 'calculates 10 strikes' do
    expect(subject.score([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9,
                          0])).to eq [30, 60, 90, 120, 150, 180, 210, 240, 269, 288]
  end

  it 'strikes at the end of the game but no bonus' do
    expect(subject.score([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 0,
                          0])).to eq [0, 0, 0, 0, 0, 0, 0, 30, 50, 60]
  end

  it 'strikes at the end of the game with a standard bonus' do
    expect(subject.score([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 3,
                          0])).to eq [0, 0, 0, 0, 0, 0, 0, 30, 53, 66]
  end

  it 'strikes at the end of the game with a standard bonus' do
    expect(subject.score([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 3,
                          3])).to eq [0, 0, 0, 0, 0, 0, 0, 30, 53, 69]
  end

  it 'calculates 10 strikes and a standard' do
    expect(subject.score([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 1,
                          7])).to eq [0, 0, 0, 0, 0, 0, 0, 30, 51, 69]
  end

  it 'calculates 10 strikes and a spare' do
    expect(subject.score([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9,
                          1])).to eq [30, 60, 90, 120, 150, 180, 210, 240, 269, 289]
  end

  it 'calculates a 11 strikes' do
    expect(subject.score([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                          1])).to eq [30, 60, 90, 120, 150, 180, 210, 240, 270, 291]
  end

  it 'calculates 12 strikes' do
    expect(subject.score([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                          10])).to eq [30, 60, 90, 120, 150, 180, 210, 240, 270, 300]
  end
end
