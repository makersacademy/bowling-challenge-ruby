require 'frame_repository'


RSpec.describe FrameRepository do
  context "bowling commences" do
    it "displays score after initial roll in single frame." do
      score = FrameRepository.new
      score.add(2)
      expect(score.frame_score).to eq(2)
    end
  end

  context "bowling game in progress.one complete frame" do
    it "displays score after 2 rolls." do
      score = FrameRepository.new
      score.add(2)
      score.add(7)
      expect(score.frame_score).to eq(9)
    end
  end
  
  context "bowling game in progress. second roll  gutters" do
    it "displays score after 2 rolls with 2nd roll producing zero" do
      score = FrameRepository.new
      score.add(4)
      score.add(0)
      expect(score.frame_score).to eq(4)
    end
  end

  it "displays produces score of zero if both rolls fail to knock over a pin" do
    score = FrameRepository.new
    score.add(0)
    score.add(0)
    expect(score.frame_score).to eq(0)
  end


end