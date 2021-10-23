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
    # it "should give the second_bowl a value" do
    #   subject.add_second_bowl(7)
    #   expect(subject.second_bowl).to eq(7)
    # end
    it "should call finish_round before completion" do
      expect(subject).to receive(:finish_round)
      subject.add_second_bowl(6)
    end
  end
  describe ".finish_round" do
    it "should add scores to round_array and push round_array to game_array" do
      subject.add_first_bowl(5)
      subject.finish_round
      expect(subject.game_array).to(eq([[5]]))
    end
  end
  describe ".calculate_round_score" do
    it "should add scores from round with any bonus points" do
      subject.add_first_bowl(5)
      subject.add_second_bowl(4)
      expect(subject.calculate_round_score(1)).to eq(9)
    end
    it "should return incomplete if round is not finished" do
      subject.add_first_bowl(5)
      expect(subject.calculate_round_score(1)).to eq(nil)
    end
    it "should return incomplete if bonus points are not calculated by next round yet" do
      subject.add_first_bowl(10)
      expect(subject.calculate_round_score(1)).to eq(nil)
    end
    it "should return add scores and give bonus point if round was a spare" do
      subject.add_first_bowl(5)
      subject.add_second_bowl(5)
      subject.add_first_bowl(5)
      expect(subject.calculate_round_score(1)).to eq(15)
    end
    it "should return add scores and give bonus points if round was a strike" do
      subject.add_first_bowl(10)
      subject.add_first_bowl(5)
      subject.add_second_bowl(4)
      expect(subject.calculate_round_score(1)).to eq(19)
    end
  end
  describe ".calculate_total_score" do
    it "should sum all elements of the game_array and save to total_score " do
      subject.add_first_bowl(5)
      subject.add_second_bowl(4)
      subject.add_first_bowl(5)
      subject.add_second_bowl(4)
      subject.add_first_bowl(5)
      subject.add_second_bowl(4)
      expect(subject.calculate_total_score).to eq(27)
    end
  end
  describe ".end_game" do
    it "should end the game after 10 rounds have been completed" do
      (9).times {subject.add_first_bowl(10)}
      subject.add_first_bowl(5)
      subject.add_second_bowl(4)
      expect(subject.end_game).to eq("You have finished your game! Your final score was: 263")
    end
  end
  # describe ".strike?" do
  #   it "should return true if first bowl was 10 " do
  #     subject.add_first_bowl(10)
  #     expect(subject.strike?).to eq(true)
  #   end
  # end
  # describe ".spare?" do
  #   it "should return true if first bowl and second bowl together were 10 " do
  #     subject.add_first_bowl(4)
  #     subject.add_second_bowl(6)
  #     expect(subject.spare?).to eq(true)
  #   end
  # end
end