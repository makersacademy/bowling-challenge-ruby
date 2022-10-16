require 'scorecard'

RSpec.describe Scorecard do
  describe '#add' do
    it 'adds 2 frames to score array' do
      scorecard = Scorecard.new
      frame1 = Frame.new(1, 6)
      frame2 = Frame.new(6, 3)
      frame1.add_rolls
      frame2.add_rolls
      scorecard.frame_add(frame1)
      scorecard.frame_add(frame2)
      expect(scorecard.frame_arr).to eq [frame1, frame2]
      expect(frame1.frame_arr).to eq [1,6]
    end
  end

  describe '#score_arr' do
    it 'returns array of open frame scores' do
      scorecard = Scorecard.new
      frame1 = Frame.new(1, 6)
      frame2 = Frame.new(6, 3)
      frame1.add_rolls
      frame2.add_rolls
      f = frame1.sum_rolls
      f2 = frame2.sum_rolls
      scorecard.sum_score(f)
      scorecard.sum_score(f2)
      expect(scorecard.score_arr).to eq [7, 9]
    end

    # it 'returns array of frame scores inc 1st frame spare' do
    #   scorecard = Scorecard.new
    #   frame1 = Frame.new(1, 9)
    #   frame2 = Frame.new(6, 3)
    #   frame1.add_rolls
    #   frame2.add_rolls
    #   f = frame1.sum_rolls
    #   f2 = frame2.sum_rolls
    #   scorecard.add_bonus
    #   scorecard.sum_score(f)
    #   scorecard.sum_score(f2)
    #   expect(scorecard.score_arr).to eq [16,9]
    # end
  end

  describe '#final_score' do
    it 'sums all frame scores to return one final score' do
      scorecard = Scorecard.new
      frame1 = Frame.new(1, 6)
      frame2 = Frame.new(6, 3)
      frame1.add_rolls
      frame2.add_rolls
      scorecard.frame_add(frame1)
      scorecard.frame_add(frame2)
      expect(scorecard.score).to eq 16
    end
    it 'spare test' do
      scorecard = Scorecard.new
      frame1 = Frame.new(1, 9)
      frame2 = Frame.new(6, 3)
      frame1.add_rolls
      frame2.add_rolls
      scorecard.frame_add(frame1)
      scorecard.frame_add(frame2)
      expect(scorecard.score).to eq 25
    end

    it 'spare test' do
      scorecard = Scorecard.new
      frame1 = Frame.new(10, 0)
      frame2 = Frame.new(6, 3)
      frame1.add_rolls
      frame2.add_rolls
      scorecard.frame_add(frame1)
      scorecard.frame_add(frame2)
      expect(scorecard.score).to eq 28
    end
  end  
end