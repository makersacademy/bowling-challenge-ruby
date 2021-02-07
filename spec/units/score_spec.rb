require 'score'

describe Score do
let(:straight_game) { [2, 3, 4, 1, 5, 0, 4, 1, 2, 3] }
let(:gutter_game) { [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] }
let(:perfect_game) { [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10] }

  it "takes an array as initialized input" do
    score = Score.new(input_scores: straight_game)
    expect(score.input_scores).to be_an(Array)
  end

  context 'edge cases' do
    it "returns score 0 from a gutter game" do
      score = Score.new(input_scores: gutter_game)
      expect(score.calculateScore).to eq 0
    end

    it "returns score 300 from a perfect game" do
      score = Score.new(input_scores: perfect_game)
      expect(score.calculateScore).to eq 300
    end
  end

  context "straight_game" do
    it "can calculate when no strikes or spares" do
      score = Score.new(input_scores: straight_game)
      expect(score.calculateScore).to eq 25
    end
  end

  context "spares" do
    it "knows when a round is a spare" do
      score = Score.new(input_scores: spare_game)
      expect(score.calculateScore).to eq 25
    end
  end
end
