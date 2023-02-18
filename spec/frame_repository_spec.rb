require 'frame_repository'


RSpec.describe FrameRepository do
  context "bowling commences" do
    it "displays score after initial roll." do
      score = FrameRepository.new
      score.add(2)
      expect(score.score_card).to eq(2)
    end
  end
end