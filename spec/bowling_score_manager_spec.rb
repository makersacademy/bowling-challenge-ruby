require 'bowling_score_manager'

RSpec.describe BowlingScoreManager do
  context "Simple tests without strike or spare" do
    it "Successfully scores a minimal game as zero" do
      expect(BowlingScoreManager.score( [0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0] )).to eq 0
    end
    it "Successfully scores a minimal non-zero game" do
      expect(BowlingScoreManager.score( [0,0, 1,1, 2,2, 3,3, 4,4, 4,5, 4,3, 3,2, 2,1, 0,0] )).to eq ([0,0, 1,1, 2,2, 3,3, 4,4, 4,5, 4,3, 3,2, 2,1, 0,0].sum)
    end
    it "Successfully scores a game including a spare" do
      expect(BowlingScoreManager.score( [5,5, 3,1, 2,2, 3,3, 4,4, 4,5, 4,3, 3,2, 2,1, 0,0] )).to eq ([5,5, 3,1, 2,2, 3,3, 4,4, 4,5, 4,3, 3,2, 2,1, 0,0].sum + 3)
    end
    it "Successfully scores a game including two spares" do
      expect(BowlingScoreManager.score( [5,5, 3,1, 2,2, 3,3, 6,4, 4,5, 4,3, 3,2, 2,1, 0,0] )).to eq ([5,5, 3,1, 2,2, 3,3, 6,4, 4,5, 4,3, 3,2, 2,1, 0,0].sum + 3 + 4)
    end
    it "Successfully scores a game including multiple successive spares" do
      expect(BowlingScoreManager.score( [5,2, 3,7, 2,8, 5,5, 6,4, 4,5, 4,3, 3,2, 2,1, 0,0] )).to eq ([5,2, 3,7, 2,8, 5,5, 6,4, 4,5, 4,3, 3,2, 2,1, 0,0].sum + 2 + 5 + 6 + 4)
    end
  end
end
