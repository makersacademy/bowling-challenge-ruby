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
  end

  
end