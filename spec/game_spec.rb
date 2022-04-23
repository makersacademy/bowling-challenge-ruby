require_relative '../lib/game'

describe Game do
  let(:game1) { Game.new([[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]) }
  let(:game2) { Game.new([[3,6],[0,3],[0,8],[1,4],[0,0],[0,3],[0,0],[0,4],[7,0],[0,0]]) }
  let(:game3) { Game.new([[3,7],[3,0],[0,8],[1,4],[0,0],[0,3],[0,0],[0,4],[7,0],[0,0]]) }

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

    it "calculates the score of a game with no strikes or spares" do
      expect(game2.score).to eq 39
    end

    it "calculates the score of a game with one spare that is not in the bonus" do
      expect(game3.score).to eq 43
    end
  end
end
