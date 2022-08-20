require 'bowl_score'

RSpec.describe "bowl_score" do
  context "checks rolls has between 11 and 21 balls" do
    it "returns false for 6 balls" do
      result = rolls_valid?([3, 5, 6, 4, 4, 8])
      expect(result).to eq(false)
    end

    it "returns false for 22 balls" do
      rolls = []
      22.times { rolls << 4 }
      result = rolls_valid?(rolls)
      expect(result).to eq(false)
    end
  end

  context "checks numbers are between 0 and 10"do
    it "returns true with [3, 5, 6, 4, 4, 8, 4, 5, 6, 3, 6]" do
      result = rolls_valid?([3, 5, 6, 4, 4, 8, 4, 5, 6, 3, 6])
      expect(result).to eq(true)
    end

    it "returns false with [11, 5, 6, 4, 4, 8, 4, 5, 6, 3, 6]" do
      result = rolls_valid?([11, 5, 6, 4, 4, 8, 4, 5, 6, 3, 6])
      expect(result).to eq(false)
    end

    it "returns false with [3, -4, 6, 4, 4, 8, 4, 5, 6, 3, 6]" do
      result = rolls_valid?([3, -4, 6, 4, 4, 8, 4, 5, 6, 3, 6])
      expect(result).to eq(false)
    end
  end

  context "rolls into frames" do
    it "puts a simple game of 20 rolls into 10 frames" do
      frames = []
      10.times { frames << [3, 4] }
      result = to_frames(frames.flatten)
      expect(result).to eq(frames)
    end

    it "a frame with a strike must have 1 roll" do
      frames = []
      10.times { frames << [3, 4] }
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
  end
end