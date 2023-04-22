require 'bowling_repo'
require_relative 'spec_helper'


RSpec.describe Scorecard do
  context "add_score method to total_score " do
    it "adds scores and returns total score" do
      scorecard = Scorecard.new
      scorecard.add_score(1, 2, 0)
      expect(scorecard.total_score).to eq(3)
    end
  end

  context "score_card method" do
    it "simulates a non strike/spare game" do
      scorecard = Scorecard.new
      scorecard.add_score(1, 2, 0)
      scorecard.add_score(2, 4, 0)
      scorecard.add_score(4, 2, 0)
      scorecard.add_score(1, 3, 0)
      scorecard.add_score(2, 3, 0)
      scorecard.add_score(6, 3, 0)
      scorecard.add_score(2, 3, 0)
      scorecard.add_score(3, 3, 0)
      scorecard.add_score(4, 3, 0)
      scorecard.add_score(5, 3, 0)
      expect(scorecard.total_score).to eq(59)
    end
  end

  context "score_card method" do
    it "doesn't add any scores after 10 frames" do
      scorecard = Scorecard.new
      scorecard.add_score(1, 2, 0)
      scorecard.add_score(2, 4, 0)
      scorecard.add_score(4, 2, 0)
      scorecard.add_score(1, 3, 0)
      scorecard.add_score(2, 3, 0)
      scorecard.add_score(6, 3, 0)
      scorecard.add_score(2, 3, 0)
      scorecard.add_score(3, 3, 0)
      scorecard.add_score(4, 3, 0)
      scorecard.add_score(5, 3, 0)
      scorecard.add_score(6, 3, 0)
      scorecard.add_score(6, 3, 0)
      expect(scorecard.total_score).to eq(59)
    end
  end

  # context "score_card method" do
  #   xit "returns a final_score_message correctly" do
  #     scorecard = Scorecard.new
  #     scorecard.add_score(0, 0)
  #     scorecard.add_score(0, 0)
  #     scorecard.add_score(0, 0)
  #     scorecard.add_score(0, 0)
  #     scorecard.add_score(0, 0)
  #     scorecard.add_score(0, 0)
  #     scorecard.add_score(0, 0)
  #     scorecard.add_score(0, 0)
  #     scorecard.add_score(0, 0)
  #     scorecard.add_score(0, 0)
  #     expect(scorecard.total_score).to eq("Gutter Ball!")
  #   end
  # end

  context "add score method with roll three" do
    it "gives an extra roll on 10th frame if roll_one == 10" do
      scorecard = Scorecard.new
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(10, 0, 4)
      expect(scorecard.total_score).to eq(59)
    end
  end

  context "add score method with roll three" do
    it "gives an extra roll on 10th frame if roll_one + roll_two == 10" do
      scorecard = Scorecard.new
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(2, 3)
      scorecard.add_score(5, 5, 4)
      expect(scorecard.total_score).to eq(59)
    end
  end
end