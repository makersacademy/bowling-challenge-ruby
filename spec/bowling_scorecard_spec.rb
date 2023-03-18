require 'bowling_scorecard'

describe BowlingScorecard do

  before do
    @game = BowlingScorecard.new
  end

  describe "#score" do
    it 'Can return a gutter game' do
      20.times{@game.bowl(0)}
      expect(@game.score).to eq(0)
    end

    it 'Can return a game of all 1s' do
      20.times{@game.bowl(1)}
      expect(@game.score).to eq(20)
    end

    it 'Can return the score for a spare' do
      @game.bowl(7)
      @game.bowl(3)
      @game.bowl(3)
      17.times{@game.bowl(0)}
      expect(@game.score).to eq(16)
    end

    it 'Can return a strike' do
      @game.bowl(10)
      @game.bowl(4)
      @game.bowl(3)
      16.times{@game.bowl(0)}
      expect(@game.score).to eq(24)
    end

    it 'Can return the score for a perfect game' do
      12.times{@game.bowl(10)}
      expect(@game.score).to eq(300)
    end

    it 'Can return the score for a game of spares' do
      21.times{@game.bowl(5)}
      expect(@game.score).to eq(150)
    end
  end

end