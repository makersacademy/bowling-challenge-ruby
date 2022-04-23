require_relative '../lib/game'

describe Game do
  let(:game1) { Game.new([[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]) }
  let(:game2) { Game.new([[3,6],[0,3],[0,8],[1,4],[0,0],[0,3],[0,0],[0,4],[7,0],[0,0]]) }
  let(:game3) { Game.new([[3,7],[3,0],[0,8],[1,4],[0,0],[0,3],[0,0],[0,4],[7,0],[0,0]]) }
  let(:game4) { Game.new([[10],[3,4],[0,8],[1,4],[0,0],[0,3],[0,0],[0,4],[7,0],[0,0]]) }
  let(:game5) { Game.new([[10],[3,4],[0,8],[1,4],[0,0],[0,3],[0,0],[0,4],[7,0],[0,10],[5]]) }
  let(:game6) { Game.new([[10],[10],[1,8],[1,4],[0,0],[0,3],[0,0],[0,4],[7,0],[0,10],[5]]) }
  let(:game7) { Game.new([[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10],[10]]) }

  context "#initialize" do
    it "has a set of rolls as an argument when created" do
      expect(Game).to receive(:new).with Array
      Game.new([[10],[3,4],[5,3],[7,3],[9,1],[10],[9,1],[10],[9,1],[3,5]])
    end
  end

  context "#score" do
    it "gives a score of 0 for a gutter game" do
      expect(game1.score).to eq 0
    end

    it "gives the score of a game with no strikes or spares" do
      expect(game2.score).to eq 39
    end

    it "gives the score of a game with one spare that is not in the bonus" do
      expect(game3.score).to eq 43
    end

    it "gives the score of a game with a strike that is not in the bonus" do
      expect(game4.score).to eq 51
    end

    it "correctly adds the bonus score when the player scores a spare in frame 10" do
      expect(game5.score).to eq 66
    end

    it "gives the score when the player scores 2 strikes in a row" do
      expect(game6.score).to eq 83
    end

    it "gives 300 for a perfect game" do
      expect(game7.score).to eq 300
    end
  end
end
