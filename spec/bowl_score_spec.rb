require 'bowl_score'

RSpec.describe "bowl_score" do
  context "checks rolls has between 11 and 21 balls" do
    it "returns false for 6 balls" do
      rolls = 6.times.map { 4 }
      expect(rolls_valid?(rolls)).to eq(false)
    end

    it "returns false for 22 balls" do
      rolls = 22.times.map { 4 }
      expect(rolls_valid?(rolls)).to eq(false)
    end
  end

  context "checks numbers are between 0 and 10" do
    it "returns true with numbers between 0 and 10" do
      rolls = 11.times.map { 5 }
      expect(rolls_valid?(rolls)).to eq(true)
    end

    it "returns false with numbers greater than 10" do
      rolls = 11.times.map { 11 }
      expect(rolls_valid?(rolls)).to eq(false)
    end

    it "returns false with numbers less than 0" do
      rolls = 11.times.map { -4 }
      expect(rolls_valid?(rolls)).to eq(false)
    end
  end

  context "rolls into frames" do
    it "puts a simple game of 20 rolls into 10 frames" do
      frames = 10.times.map { [3, 4] }
      expect(to_frames(frames.flatten)).to eq(frames)
    end

    it "a frame with a strike must have 1 roll" do
      frames = 10.times.map { [3, 4] }
      frames[1] = [10]
      frames[2] = [10]
      expect(to_frames(frames.flatten)).to eq(frames)
    end

    it "10th frame with a spare and extra ball" do
      frames = []
      9.times { frames << [3, 4] }
      frames << [4, 6, 5]
      expect(to_frames(frames.flatten)).to eq(frames)
    end

    it "10th frame with a strike and 2 extra balls" do
      frames = 9.times.map { [3, 4] }
      frames << [10, 9, 10]
      expect(to_frames(frames.flatten)).to eq(frames)      
    end
  end

  context "score different rolls" do
    it "scores a 10 frame game with no strikes or spares" do
      frames = 10.times.map { [3, 4] }
      expect(score(frames.flatten)).to eq(70)       
    end

    it "scores the correct bonus for a spare" do
      frames = 10.times.map { [3, 4] }
      frames[1] = [4, 6]
      expect(score(frames.flatten)).to eq(76)  
    end

    it "scores the correct bonus for a spare in the last frame" do
      frames = 9.times.map { [3, 4] }
      frames << [4, 6, 8]
      result = score(frames.flatten)
      expect(result).to eq(81)  
    end

    it "scores the correct bonus for a spare in the last frame" do
      frames = 9.times.map { [3, 4] }
      frames << [4, 6, 0]
      expect(score(frames.flatten)).to eq(73)  
    end

    it "scores a strike in a middle frame" do
      frames = 10.times.map { [3, 4] }
      frames[1] = [10]
      expect(score(frames.flatten)).to eq(80)  
    end

    it "scores a strike in the end frame" do
      frames = 9.times.map { [3, 4] }
      frames << [10, 0, 0]
      expect(score(frames.flatten)).to eq(73)  
    end

    it "scores a strike in the end frame" do
      frames = 9.times.map { [3, 4] }
      frames << [10, 10, 10]
      expect(score(frames.flatten)).to eq(93)  
    end
  end

  context "edge cases" do
    it "perfect game" do
      frames = 9.times.map { [10] }
      frames << [10, 10, 10]
      expect(score(frames.flatten)).to eq(300)  
    end

    it "gutter game" do
      frames = 10.times.map { [0, 0] }
      expect(score(frames.flatten)).to eq(0)  
    end
  end

  context "mix it up a bit" do
    it "mixed game scores" do
      rolls = [10, 5, 0, 4, 6, 10, 10, 2, 3, 1, 9, 10, 0, 0, 10, 5, 5]
      expect(score(rolls)).to eq(132)
    end

    it "makers example" do
      rolls = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
      expect(score(rolls)).to eq(133)
    end
  end
end