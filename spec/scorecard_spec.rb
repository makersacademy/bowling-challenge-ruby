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

  it 'adds multiple "open" frames' do
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

  it 'adds a single strike' do
    scorecard = Scorecard.new
    scorecard.add_frame([10])
    expect(scorecard.scores).to eq [{ rolls: [10] }]
  end

  it 'adds a single spare' do
    scorecard = Scorecard.new
    scorecard.add_frame([9, 1])
    expect(scorecard.scores).to eq [{ rolls: [9, 1] }]
  end

  it 'adds multiple frames including a strike' do
    scorecard = Scorecard.new
    scorecard.add_frame([8, 1])
    scorecard.add_frame([10])
    scorecard.add_frame([3, 4])
    expect(scorecard.scores).to eq [
      { rolls: [8, 1], score: 9 },
      { rolls: [10], score: 26 },
      { rolls: [3, 4], score: 33 },
    ]
  end

  it 'adds multiple frames including a spare' do
    scorecard = Scorecard.new
    scorecard.add_frame([9, 1])
    scorecard.add_frame([3, 4])
    expect(scorecard.scores).to eq [
      { rolls: [9, 1], score: 13 },
      { rolls: [3, 4], score: 20 },
    ]
  end

  it 'correctly scores a gutter game' do
    scorecard = Scorecard.new
    scorecard.add_frame([0, 0])
    scorecard.add_frame([0, 0])
    scorecard.add_frame([0, 0])
    scorecard.add_frame([0, 0])
    scorecard.add_frame([0, 0])
    scorecard.add_frame([0, 0])
    scorecard.add_frame([0, 0])
    scorecard.add_frame([0, 0])
    scorecard.add_frame([0, 0])
    scorecard.add_frame([0, 0])
    expect(scorecard.scores.length).to eq 10
    expect(scorecard.scores).to eq [
      { rolls: [0, 0], score: 0 },
      { rolls: [0, 0], score: 0 },
      { rolls: [0, 0], score: 0 },
      { rolls: [0, 0], score: 0 },
      { rolls: [0, 0], score: 0 },
      { rolls: [0, 0], score: 0 },
      { rolls: [0, 0], score: 0 },
      { rolls: [0, 0], score: 0 },
      { rolls: [0, 0], score: 0 },
      { rolls: [0, 0], score: 0 }
    ]
  end
end