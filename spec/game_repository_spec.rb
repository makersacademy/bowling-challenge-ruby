require 'game_repository'


RSpec.describe GameRepository do
  context "bowling commences" do
    it "displays score from one frame to create to initialise running scorecard." do
      score = GameRepository.new
      score.add(8)
      expect(score.score_card).to eq(8)
    end
  end

  it "displays score from 4 frames with results added to scorecard." do
    score = GameRepository.new
    score.add(8)
    score.add(8) 
    score.add(8) 
    score.add(2)
    expect(score.score_card).to eq(26)
  end

  it "displays a zero score when initial frame returns a score of zeros." do
    score = GameRepository.new
    score.add(0)
    expect(score.score_card).to eq(0)
  end
end