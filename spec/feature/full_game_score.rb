require 'bowling_score'

describe 'Scores a full game' do
  let(:example_scores) { [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6] }
  let(:score) { BowlingScore.new('Paul') }

  it 'Scores 133 when given example data' do
    example_scores.each do |pins_hit|
      score.add(pins_hit)
    end
    expect(score.total_score).to eq 133
  end
end

=begin
1  1
1  4
2  4
2  5
3  6
3  4
4  5
4  5
5  10
5  nil
6  0
6  1
7  7
7  3
8  6
8  4
9  10
9  nil
10  2
10  8
10  6
=end
