require 'scorecard'

describe Scorecard do
  
  describe 'initialisation' do
    it 'will intitalise an instance of Scorecard' do
      scorecard = Scorecard.new([
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
      ])
      expect(scorecard).to be_a Scorecard
    end
  end

  describe '.result' do
    it 'returns the result of the scorecard for a gutter game' do
      scorecard = Scorecard.new([
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0],
        [0,0]
      ])
      expect(scorecard.result).to eq 0
    end

    it "returns the result for a perfect game" do
      scorecard = Scorecard.new([
        [10],
        [10],
        [10],
        [10],
        [10],
        [10],
        [10],
        [10],
        [10],
        [10, 10, 10]
      ])
      expect(scorecard.result).to eq 300
    end
  end

  it 'adds the number of pins when no strikes or a spares' do
    scorecard = Scorecard.new([
      [3, 2],
      [7, 1],
      [5, 3],
      [2, 3],
      [4, 5],
      [2, 5],
      [4, 5],
      [3, 1],
      [2, 4],
      [3, 3]
    ])
    expect(scorecard.result).to eq 67
  end

  it 'returns the score for a game that includes spares and strikes' do
    scorecard = Scorecard.new([
      [1, 4],
      [4, 5],
      [6, 4],
      [5, 5],
      [10],
      [0, 1],
      [7, 3],
      [6, 4],
      [10],
      [2, 8, 6]
    ])
    expect(scorecard.result).to eq 133
  end

end
