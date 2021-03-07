require "score_calculator"

describe ScoreCalculator do 
  describe ".calculate" do
    it "calculates a score" do
      frames = [[1, 4], [4, 5], [6, 4], [5, 5], [10], [0, 1], [7, 3], [6, 4], [10], [2, 8, 6]] 
      expect(subject.calculate(frames)).to eq 133
    end 
  
    context "During game with two strikes" do 
      it "calculates a score" do
        frames = [[8, 2], [5, 4], [9, 0], [10], [10], [5, 5], [5, 3], [6, 3], [9,1], [9, 1, 10]] 
        expect(subject.calculate(frames)).to eq 149
      end 
    end

    context "During perfect game" do 
      it "calculates a score" do
        frames = [[10], [10], [10], [10], [10], [10], [10], [10], [10], [10, 10, 10]] 
        expect(subject.calculate(frames)).to eq 300
      end 
    end
  end
end 
