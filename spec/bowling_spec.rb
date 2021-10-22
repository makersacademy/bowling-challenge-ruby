require "bowling"

describe Bowling do
  describe ".initialize" do
    it "should initialize with empty game array and round array" do
      expect(subject.game_array).to eq([])
      expect(subject.round_array).to eq([])
      expect(subject.round_counter).to eq(1)
      expect(subject.first_bowl.nil?).to eq(true)
      expect(subject.second_bowl.nil?).to eq(true)
    end
  end
  describe ".add_first_bowl" do
    it "should give the first_bowl a value" do
      subject.add_first_bowl(5)
      expect(subject.first_bowl).to eq(5)
    end
  end
  describe ".add_second_bowl" do
    it "should give the first_bowl a value" do
      subject.add_second_bowl(7)
      expect(subject.second_bowl).to eq(7)
    end
  end
  describe ".finish_round" do
    it "should add scores to round_array and push round_array to game_array" do
      subject.add_first_bowl(5)
      subject.add_second_bowl(7)
      subject.finish_round
      expect(subject.game_array).to(eq([[5,7]]))
    end
  end
  describe ".calculate_total_score" do
    it "should sum all elements of the game_array and save to total_score " do
      subject.add_first_bowl(5)
      subject.add_second_bowl(7)
      subject.finish_round
      subject.add_first_bowl(5)
      subject.add_second_bowl(7)
      subject.finish_round
      subject.add_first_bowl(5)
      subject.add_second_bowl(7)
      subject.finish_round
      expect(subject.calculate_total_score).to eq(36)
    end
  end
end