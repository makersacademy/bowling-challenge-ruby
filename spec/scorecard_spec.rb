require 'scorecard'

context Scorecard do
  it 'initialises with an empty array of scores' do
    scorecard = Scorecard.new
    expect(scorecard.scores).to eq []
  end

  it 'adds a single "open" frame' do
    scorecard = Scorecard.new
    scorecard.add_frame([3, 4])
    expect(scorecard.scores).to eq [{ rolls: [3, 4], score: 7 }]
  end

  it 'adds multiple frames' do
    scorecard = Scorecard.new
    scorecard.add_frame([3, 4])
    scorecard.add_frame([2, 0])
    scorecard.add_frame([6, 3])
    expect(scorecard.scores).to eq [
      { rolls: [3, 4], score: 7 },
      { rolls: [2, 0], score: 9 },
      { rolls: [6, 3], score: 18 }
    ]
  end
end