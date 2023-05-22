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

  it 'adds a single spare' do
    scorecard = Scorecard.new
    scorecard.add_frame([9, 1])
    expect(scorecard.scores).to eq [{ rolls: [9, 1] }]
  end

  it 'correctly calculates spare bonus' do
    scorecard = Scorecard.new
    scorecard.add_frame([9, 1])
    scorecard.add_frame([5, 3])
    expect(scorecard.scores).to eq [
      { rolls: [9, 1], score: 15 },
      { rolls: [5, 3], score: 23 }
    ]
  end

  it 'adds a single strike' do
    scorecard = Scorecard.new
    scorecard.add_frame([10])
    expect(scorecard.scores).to eq [{ rolls: [10] }]
  end

  it 'correctly adds strike bonus if next frame not a strike' do
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

  it 'correctly adds two strikes in a row' do
    scorecard = Scorecard.new
    scorecard.add_frame([10])
    scorecard.add_frame([10])
    expect(scorecard.scores).to eq [
      { rolls: [10] },
      { rolls: [10] }
    ]
  end

  it 'correctly adds strike bonus after two strikes' do
    scorecard = Scorecard.new
    scorecard.add_frame([10])
    scorecard.add_frame([10])
    scorecard.add_frame([3, 6])
    scorecard.add_frame([5, 1])
    expect(scorecard.scores).to eq [
      { rolls: [10], score: 23 },
      { rolls: [10], score: 42 },
      { rolls: [3, 6], score: 51 },
      { rolls: [5, 1], score: 57 },
    ]
  end

  it 'correctly calculates a game not ending on strike or spare' do
    scorecard = Scorecard.new
    scorecard.add_frame([10])
    scorecard.add_frame([3, 6])
    scorecard.add_frame([3, 7])
    scorecard.add_frame([10])
    scorecard.add_frame([10])
    scorecard.add_frame([5, 1])
    scorecard.add_frame([8, 2])
    scorecard.add_frame([7, 3])
    scorecard.add_frame([5, 4])
    scorecard.add_frame([2, 1])
    expect(scorecard.scores).to eq [
      { rolls: [10], score: 19 },
      { rolls: [3, 6], score: 28 },
      { rolls: [3, 7], score: 48 },
      { rolls: [10], score: 73 },
      { rolls: [10], score: 89 },
      { rolls: [5, 1], score: 95 },
      { rolls: [8, 2], score: 112 },
      { rolls: [7, 3], score: 127 },
      { rolls: [5, 4], score: 136 },
      { rolls: [2, 1], score: 139 },
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

  it 'correctly scores a perfect game' do
    scorecard = Scorecard.new
    scorecard.add_frame([10])
    scorecard.add_frame([10])
    scorecard.add_frame([10])
    scorecard.add_frame([10])
    scorecard.add_frame([10])
    scorecard.add_frame([10])
    scorecard.add_frame([10])
    scorecard.add_frame([10])
    scorecard.add_frame([10])
    scorecard.add_final_frame([10, 10, 10])
    expect(scorecard.scores.length).to eq 10
    expect(scorecard.scores).to eq [
      { rolls: [10], score: 30 },
      { rolls: [10], score: 60 },
      { rolls: [10], score: 90 },
      { rolls: [10], score: 120 },
      { rolls: [10], score: 150 },
      { rolls: [10], score: 180 },
      { rolls: [10], score: 210 },
      { rolls: [10], score: 240 },
      { rolls: [10], score: 270 },
      { rolls: [10, 10, 10], score: 300 }
    ]
  end

  it 'correctly scores a full game with 1 bonus roll' do
    scorecard = Scorecard.new
    scorecard.add_frame([3, 5])
    scorecard.add_frame([6, 4])
    scorecard.add_frame([7, 2])
    scorecard.add_frame([10])
    scorecard.add_frame([7, 1])
    scorecard.add_frame([9, 1])
    scorecard.add_frame([10])
    scorecard.add_frame([1, 8])
    scorecard.add_frame([8, 2])
    scorecard.add_final_frame([6, 4, 5])
    expect(scorecard.scores.length).to eq 10
    expect(scorecard.scores).to eq [
      { rolls: [3, 5], score: 8 },
      { rolls: [6, 4], score: 25 },
      { rolls: [7, 2], score: 34 },
      { rolls: [10], score: 52 },
      { rolls: [7, 1], score: 60 },
      { rolls: [9, 1], score: 80 },
      { rolls: [10], score: 99 },
      { rolls: [1, 8], score: 108 },
      { rolls: [8, 2], score: 124 },
      { rolls: [6, 4, 5], score: 139 }
    ]
  end

  it 'correctly scores a full game with 2 bonus rolls' do
    scorecard = Scorecard.new
    scorecard.add_frame([3, 5])
    scorecard.add_frame([6, 4])
    scorecard.add_frame([7, 2])
    scorecard.add_frame([10])
    scorecard.add_frame([7, 1])
    scorecard.add_frame([9, 1])
    scorecard.add_frame([10])
    scorecard.add_frame([1, 8])
    scorecard.add_frame([8, 2])
    scorecard.add_final_frame([10, 4, 5])
    expect(scorecard.scores.length).to eq 10
    expect(scorecard.scores).to eq [
      { rolls: [3, 5], score: 8 },
      { rolls: [6, 4], score: 25 },
      { rolls: [7, 2], score: 34 },
      { rolls: [10], score: 52 },
      { rolls: [7, 1], score: 60 },
      { rolls: [9, 1], score: 80 },
      { rolls: [10], score: 99 },
      { rolls: [1, 8], score: 108 },
      { rolls: [8, 2], score: 128 },
      { rolls: [10, 4, 5], score: 147 }
    ]
  end
end