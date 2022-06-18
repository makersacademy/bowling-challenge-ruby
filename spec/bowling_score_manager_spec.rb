require 'bowling_score_manager'

RSpec.describe BowlingScoreManager do
  context "Simple tests without strike or spare" do
    it "Successfully scores a minimal game as zero" do
      expect(BowlingScoreManager.score( [0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0] )).to eq 0
    end
    it "Successfully scores a minimal non-zero game" do
      expect(BowlingScoreManager.score( [0,0, 1,1, 2,2, 3,3, 4,4, 4,5, 4,3, 3,2, 2,1, 0,0] )).to eq ([0,0, 1,1, 2,2, 3,3, 4,4, 4,5, 4,3, 3,2, 2,1, 0,0].sum)
    end
  end
end
