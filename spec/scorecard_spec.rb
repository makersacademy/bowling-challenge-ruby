require_relative '../lib/scorecard.rb'

describe Scorecard do

  before(:each) do
    @scorecard = Scorecard.new
  end

  context "when a game contains strikes" do 
    it "has multiple strikes and adds the correct numbers" do 
      scores = [[10], [3, 4], [2, 6], [8, 0], [0, 0], [10], [2, 7], [3, 1], [0, 7], [8, 2, 4]]
      expect(@scorecard.calculate(scores)).to eq(93)
    end

    it "has multiple strikes and one in the final frame" do
      scores = [[10], [3, 4], [2, 6], [8, 0], [0, 0], [3, 5], [2, 7], [3, 1], [10], [10, 2, 4]]
      expect(@scorecard.calculate(scores)).to eq(99)
    end

    it "has all strikes" do
      scores = [[10], [10], [10], [10], [10], [10], [10], [10], [10], [10, 10, 10]]
      expect(@scorecard.calculate(scores)).to eq(300)
    end

    it "contains a single strike in main frames and one in final frame" do
      scores = [[1, 0], [3, 4], [2, 6], [8, 0], [0, 0], [3, 5], [2, 7], [3, 1], [10], [10, 2, 4]]
      expect(@scorecard.calculate(scores)).to eq(83)
    end
  end

  context "when a game has spares" do
    it "is all spares" do
      scores = [[1, 9], [2, 8], [3, 7], [4, 6], [5, 5], [9, 1], [8, 2], [3, 7], [4, 6], [5, 5, 10]]
      expect(@scorecard.calculate(scores)).to eq(153)
    end

    it "has one spare in the main game" do
      scores = [[8, 2], [3, 4], [2, 6], [8, 0], [0, 0], [3, 5], [2, 7], [3, 1], [0, 7], [0, 2]]
      expect(@scorecard.calculate(scores)).to eq(66)
    end

    it "has multiple spares in the main game" do
      scores = [[2, 8], [6, 1], [5, 2], [6, 1], [9, 1], [1, 1], [0, 3], [2, 1], [5, 4], [2, 1]]
      expect(@scorecard.calculate(scores)).to eq(68)
    end
  end

  context "when a game has spares and strikes" do
    it "will calculate the final score" do
      scores = [[1, 9], [10], [10], [10], [9, 1], [3, 7], [10], [6, 4], [10], [10, 10, 1]]
      expect(@scorecard.calculate(scores)).to eq(223)
    end

    it "will calculate the final score" do
      scores = [[5, 5], [10], [10], [10], [10], [10], [8, 2], [6, 4], [2, 8], [5, 5, 2]]
      expect(@scorecard.calculate(scores)).to eq(213)
    end
  end

  context "when a game is a mix of spares, strikes, and normal" do
    it "will calculate the final score" do
      scores = [[2, 3], [6, 4], [10], [5, 2], [0, 5], [6, 4], [3, 5], [9, 0], [10], [2, 1]]
      expect(@scorecard.calculate(scores)).to eq(100)
    end
  end

  context "when no scores are made" do
    it "returns 0" do
      scores = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
      expect(@scorecard.calculate(scores)).to eq(0)
    end
  end

  context "when all the rolls in the frames have no strikes or spares" do
    it "will calculate the total scores" do
      scores = [[1, 2], [3,4], [2, 6], [8, 0], [0, 0], [3, 5], [2, 7], [3, 1], [0, 7], [0, 2]]
      expect(@scorecard.calculate(scores)).to eq(56)
    end
  end
end