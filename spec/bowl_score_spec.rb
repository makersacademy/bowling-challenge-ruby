require 'bowl_score'

RSpec.describe "bowl_score" do
  context "checks rolls has between 11 and 21 balls" do
    it "returns false for 6 balls" do
      rolls = []
      6.times { rolls << 4 }
      result = rolls_valid?(rolls)
      expect(result).to eq(false)
    end

    it "returns false for 22 balls" do
      rolls = []
      22.times { rolls << 4 }
      result = rolls_valid?(rolls)
      expect(result).to eq(false)
    end
  end

  context "checks numbers are between 0 and 10" do
    it "returns true with numbers between 0 and 10" do
      rolls = []
      11.times { rolls << 5 }
      result = rolls_valid?(rolls)
      expect(result).to eq(true)
    end

    it "returns false with numbers greater than 10" do
      rolls = []
      11.times { rolls << 11 }
      result = rolls_valid?(rolls)
      expect(result).to eq(false)
    end

    it "returns false with numbers less than 0" do
      rolls = []
      11.times { rolls << -4 }
      result = rolls_valid?(rolls)
      expect(result).to eq(false)
    end
  end

  context "rolls into frames" do
    it "puts a simple game of 20 rolls into 10 frames" do
      frames = 10.times.map { [3, 4] }
      result = to_frames(frames.flatten)
      expect(result).to eq(frames)
    end

    it "a frame with a strike must have 1 roll" do
      frames = 10.times.map { [3, 4] }
      frames[1] = [10]
      frames[2] = [10]
      result = to_frames(frames.flatten)
      expect(result).to eq(frames)
    end

    it "10th frame with a spare and extra ball" do
      frames = []
      9.times { frames << [3, 4] }
      frames << [4, 6, 5]
      result = to_frames(frames.flatten)
      expect(result).to eq(frames)
    end

    it "10th frame with a strike and 2 extra balls" do
      frames = []
      9.times { frames << [3, 4] }
      frames << [10, 9, 10]
      result = to_frames(frames.flatten)
      expect(result).to eq(frames)      
    end
  end

  context "score different rolls" do
    it "scores a 10 frame game with no strikes or spares" do
      rolls = []
      10.times { rolls << [3, 4] }
      result = score(rolls.flatten)
      expect(result).to eq(70)       
    end

    it "scores the correct bonus for a spare" do
      rolls = []
      10.times { rolls << [3, 4] }
      rolls[1] = [4, 6]
      result = score(rolls.flatten)
      expect(result).to eq(76)  
    end

    it "scores the correct bonus for a spare in the last frame" do
      rolls = []
      9.times { rolls << [3, 4] }
      rolls << [4, 6, 8]
      result = score(rolls.flatten)
      expect(result).to eq(81)  
    end

    it "scores the correct bonus for a spare in the last frame" do
      rolls = []
      9.times { rolls << [3, 4] }
      rolls << [4, 6, 0]
      result = score(rolls.flatten)
      expect(result).to eq(73)  
    end

    it "scores a strike in a middle frame" do
      rolls = []
      10.times { rolls << [3, 4] }
      rolls[1] = [10]
      result = score(rolls.flatten)
      expect(result).to eq(80)  
    end

    it "scores a strike in the end frame" do
      rolls = []
      9.times { rolls << [3, 4] }
      rolls << [10, 0, 0]
      result = score(rolls.flatten)
      expect(result).to eq(73)  
    end

    it "scores a strike in the end frame" do
      rolls = []
      9.times { rolls << [3, 4] }
      rolls << [10, 10, 10]
      result = score(rolls.flatten)
      expect(result).to eq(93)  
    end
  end

  context "edge cases" do
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