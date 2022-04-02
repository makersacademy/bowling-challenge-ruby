require 'bowling_score'

describe 'Scores a full game' do
  let(:example_scores) { [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6] }
  let(:example_scores2) { [9, 1, 6, 4, 7, 3, 7, 1, 2, 7, 2, 1, 7, 1, 4, 6, 1, 8, 10, 2, 6] }
  let(:perfect_scores) { [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10] }

  let(:score) { BowlingScore.new('Paul') }

  it 'Scores 133 when given example data' do
    example_scores.each do |pins_hit|
      score.add(pins_hit)
    end
    expect(score.total_score).to eq 133
  end

  it 'Scores 116 when given example data set 2' do
    example_scores2.each do |pins_hit|
      score.add(pins_hit)
    end
    expect(score.total_score).to eq 116
  end

  it 'Scores 300 when rolling a perfect game' do
    12.times { score.add(10) }
    expect(score.total_score).to eq 300
  end

  it 'Scores 150 when rolling all 5s (So spares)' do
    21.times { score.add(5) }
    expect(score.total_score).to eq 150
  end
end
