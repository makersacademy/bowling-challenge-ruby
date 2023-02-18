require 'game_repository'


RSpec.describe GameRepository do
  context "bowling commences" do
    it "displays score from one frame to create to initialise running scorecard." do
      score = GameRepository.new
      score.add(8)
      expect(score.score_card).to eq(8)
    end
  end
end