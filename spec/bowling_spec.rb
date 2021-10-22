require "bowling"

describe Bowling do
  describe ".initialize" do
    it "should initialize with empty game array and round array" do
      expect(subject.game_array).to eq([])
      expect(subject.round_array).to eq([])
      expect(subject.total_score).to eq(0)
      expect(subject.round_counter).to eq(1)
      expect(subject.first_bowl.nil?).to eq(true)
      expect(subject.second_bowl.nil?).to eq(true)
    end
  end
end