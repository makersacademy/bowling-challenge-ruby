require 'oo_bowl_score'

RSpec.describe "bowl_score" do
  context "checks rolls has between 11 and 21 balls" do
    it "fails for 6 rolls" do
      rolls = 6.times.map { 4 }
      expect { BowlScore.new(rolls) }.to raise_error('invalid roll')
    end

    it "fails for 22 rolls" do
      rolls = 22.times.map { 4 }
      expect { BowlScore.new(rolls) }.to raise_error('invalid roll')
    end
  end

  context "checks numbers are between 0 and 10" do
    it "fails with numbers greater than 10" do
      rolls = 22.times.map { 11 }
      expect { BowlScore.new(rolls) }.to raise_error('invalid roll')
    end

    it "fails with numbers less than 0" do
      rolls = 22.times.map { -4 }
      expect { BowlScore.new(rolls) }.to raise_error('invalid roll')
    end
  end

  context "score different rolls" do
    it "scores a 10 frame game with no strikes or spares" do
      rolls = 10.times.map { [3, 4] }
      result = BowlScore.new(rolls.flatten)
      expect(result.score).to eq(70)       
    end

    it "scores the correct bonus for a spare" do
      rolls = 10.times.map { [3, 4] }
      rolls[1] = [4, 6]
      result = BowlScore.new(rolls.flatten)
      expect(result.score).to eq(76)       
    end

    it "scores the correct bonus for a spare in the last frame" do
      rolls = 9.times.map { [3, 4] }
      rolls << [4, 6, 8]
      result = BowlScore.new(rolls.flatten)
      expect(result.score).to eq(81)  
    end

    it "scores the correct bonus for a spare in the last frame" do
      rolls = 9.times.map { [3, 4] }
      rolls << [4, 6, 0]
      result = BowlScore.new(rolls.flatten)
      expect(result.score).to eq(73)    
    end

    it "scores a strike in a middle frame" do
      rolls = 10.times.map { [3, 4] }
      rolls[1] = [10]
      result = BowlScore.new(rolls.flatten)
      expect(result.score).to eq(80)   
    end

    xit "scores a strike in the end frame" do
      rolls = []
      9.times { rolls << [3, 4] }
      rolls << [10, 0, 0]
      result = score(rolls.flatten)
      expect(result).to eq(73)  
    end

    xit "scores a strike in the end frame" do
      rolls = []
      9.times { rolls << [3, 4] }
      rolls << [10, 10, 10]
      result = score(rolls.flatten)
      expect(result).to eq(93)  
    end
  end

  xcontext "edge cases" do
    it "perfect game" do
      rolls = []
      9.times { rolls << [10] }
      rolls << [10, 10, 10]
      result = score(rolls.flatten)
      expect(result).to eq(300)  
    end

    it "gutter game" do
      rolls = []
      10.times { rolls << [0, 0] }
      result = score(rolls.flatten)
      expect(result).to eq(0)  
    end
  end

  context "mix it up a bit" do
    it "mixed game scores" do
      rolls = [10, 5, 0, 4, 6, 10, 10, 2, 3, 1, 9, 10, 0, 0, 10, 5, 5]
      result = score(rolls)
      expect(result).to eq(132)
    end
  end
end