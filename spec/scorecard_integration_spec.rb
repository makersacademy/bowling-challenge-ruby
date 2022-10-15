require 'scorecard'

RSpec.describe Scorecard do
  describe '#add' do
    it 'adds 2 frames to raw score array' do
      scorecard = Scorecard.new
      frame1 = Frame.new('1', '6')
      frame2 = Frame.new('6', '3')
      scorecard.add_frames(frame1)
      scorecard.add_frames(frame2)
      expect(scorecard.raw_score_arr).to eq [frame1, frame2]
    end
  end

  describe '#score_arr' do
    it 'returns array of integers representing raw frame scores' do
      scorecard = Scorecard.new
      frame1 = Frame.new('1', '6')
      frame2 = Frame.new('6', '3')
      frame1.add_rolls
      frame2.add_rolls
      f = frame1.sum_rolls
      f2 = frame2.sum_rolls
      scorecard.sum_score(f)
      scorecard.sum_score(f2)
      expect(scorecard.score_arr).to eq [7,9]
    end
  end

  describe '#final_score' do
    it 'sums all frame scores to return one final score' do
      scorecard = Scorecard.new
      frame1 = Frame.new('1', '6')
      frame2 = Frame.new('6', '3')
      frame1.add_rolls
      frame2.add_rolls
      f = frame1.sum_rolls
      f2 = frame2.sum_rolls
      scorecard.sum_score(f)
      scorecard.sum_score(f2)
      expect(scorecard.final_score).to eq 16
    end
  end  
end