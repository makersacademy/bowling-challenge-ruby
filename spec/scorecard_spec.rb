require 'scorecard'

context Scorecard do
  it 'initialises with an empty array of scores and total 0' do
    scorecard = Scorecard.new
    expect(scorecard.scores).to eq []
    expect(scorecard.total).to eq 0
  end

  it 'adds a single frame' do
    scorecard = Scorecard.new
    scorecard.add_frame([3, 4])
    expect(scorecard.scores).to eq [[3, 4]]
  end

  it 'adds multiple frames' do
    scorecard = Scorecard.new
    scorecard.add_frame([3, 4])
    scorecard.add_frame([2, 0])
    scorecard.add_frame([6, 3])
    expect(scorecard.scores).to eq [[3, 4], [2, 0], [6, 3]]
  end
end