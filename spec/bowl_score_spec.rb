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
end