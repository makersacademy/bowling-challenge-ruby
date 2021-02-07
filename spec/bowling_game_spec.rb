require 'bowling_game'

describe BowlingGame do
  subject(:game) { described_class.new }

  describe '.play' do
    it "should allow game to respond to play" do
      expect(BowlingGame.new).to be_a(BowlingGame)
    end
  end

  describe '#bowl' do
    it "should allow the user to input the score for a frame" do
      expect(game).to respond_to(:roll).with(1).argument
    end

    it "can roll a gutter game" do
      BowlingGame::MAX_ROLLS.times { game.roll(0) }
      expect(game.score).to eq(0)
    end

    it "can roll all 4s" do
      BowlingGame::MAX_ROLLS.times { game.roll(4) }
      expect(game.score).to eq(80)
    end

    it "can roll a spare" do
      game.roll(5)
      game.roll(5)
      game.roll(3)
      17.times { game.roll(0) }
      expect(game.score).to eq(16)
    end

    it "can roll a strike" do
      game.roll(10)
      game.roll(5)
      game.roll(3)
      16.times { game.roll(0) }
      expect(game.score).to eq(26)
    end

    it "can roll a perfect game" do
      12.times { game.roll(10) }
      expect(game.score).to eq(300)
    end

    it "can roll a mixed game" do
      game.roll(10)
      game.roll(8)
      game.roll(2)
      game.roll(5)
      game.roll(3)
      14.times { game.roll(0) }
      expect(game.score).to eq(43)
    end

    it "sets the limit on rolls per game" do
      BowlingGame::MAX_ROLLS.times { game.roll(1) }
      expect(game.roll(1)).to raise "The game has finished, final score is 20."
    end
  end
end
