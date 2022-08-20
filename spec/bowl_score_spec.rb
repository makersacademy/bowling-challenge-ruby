require 'bowl_score'

RSpec.describe "bowl_score" do
    context "checks numbers are between 0 and 10"do
      it "returns true with [3, 5, 6, 4, 4, 8]" do
        result = rolls_valid?([3, 5, 6, 4, 4, 8])
        expect(result).to eq(true)
      end

      it "returns false with [11, 4, 6, 3, 6]" do
        result = rolls_valid?([11, 4, 6, 3, 6])
        expect(result).to eq(false)
      end
    end
end