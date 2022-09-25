require 'scorecard'

RSpec.describe Scorecard do
  context "after construction" do
    it "a frame begins with expected default values" do
      scorecard = Scorecard.new
      expect(scorecard.frame_one.score).to eq (0)
      expect(scorecard.frame_one.throw_one).to eq (0)
      expect(scorecard.frame_one.throw_two).to eq (0)
      expect(scorecard.frame_one.throw_three).to eq (0)
      
      expect(scorecard.frame_five.score).to eq (0)
      expect(scorecard.frame_five.throw_one).to eq (0)
      expect(scorecard.frame_five.throw_two).to eq (0)
      expect(scorecard.frame_five.throw_three).to eq (0) 

      expect(scorecard.game_score).to eq (0) 
    end
  end
end
