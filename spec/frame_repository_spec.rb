require 'frame_repository'


RSpec.describe FrameRepository do
  context "bowling commences" do
    it "displays score after initial roll." do
      score = FrameRepository.new
      score.add(2)
      expect(score.score_card).to eq(2)
    end
  end


  context "bowling game in progress" do
    it "displays score after 3 rolls." do
      score = FrameRepository.new
      score.add(2)
      score.add(7)
      score.add(4)
      expect(score.score_card).to eq(13)
    end
  end
end