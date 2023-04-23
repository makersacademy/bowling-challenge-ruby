require "score"

RSpec.describe Score do
  # The score should be 0 before the player starts
  it 'initializes' do
    score = Score.new
    expect(score.score_count(0)).to eq(0)
  end

  context "players score less than 10 in single frame" do
    it "adds the score 3 to counter which is at 0" do
      score = Score.new
      score.score_count(3)
      expect(score.score_count(3)).to eq (3)
    end
    it "first roll knocks down 5, second 3" do
      score = Score.new
      score.score_count(5)
      score.score_count(3)
      expect(score.score_count(8)).to eq (8)
    end
  end

  context "players scores a spare" do
    it "score is 10 plus first roll of next frame, which is 4" do
      score = Score.new
      roll_one = 4
      score.score_count(10 + roll_one)
      expect(score.spare(14)).to eq (14)
    end
  end

end