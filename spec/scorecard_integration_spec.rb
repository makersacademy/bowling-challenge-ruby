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
    it 'sums frame scores including a spare' do
      scorecard = Scorecard.new
      frame1 = Frame.new(1, 9)
      frame2 = Frame.new(6, 3)
      frame1.add_rolls
      frame2.add_rolls
      scorecard.frame_add(frame1)
      scorecard.frame_add(frame2)
      expect(scorecard.score).to eq 25
    end

    it 'sums frame scores including a strike' do
      scorecard = Scorecard.new
      frame1 = Frame.new(10, 0)
      frame2 = Frame.new(6, 3)
      frame1.add_rolls
      frame2.add_rolls
      scorecard.frame_add(frame1)
      scorecard.frame_add(frame2)
      expect(scorecard.score).to eq 28
    end

    it 'sums frame scores including multiples strikes & spares' do
      scorecard = Scorecard.new
      frame1 = Frame.new(10,0)
      frame2 = Frame.new(6,4)
      frame3 = Frame.new(7,1)
      frame4 = Frame.new(10,0)
      frame5 = Frame.new(4,3)
      frame1.add_rolls
      frame2.add_rolls
      frame3.add_rolls
      frame4.add_rolls
      frame5.add_rolls
      scorecard.frame_add(frame1)
      scorecard.frame_add(frame2)
      scorecard.frame_add(frame3)
      scorecard.frame_add(frame4)
      scorecard.frame_add(frame5)
      expect(scorecard.score).to eq 69
    end

    it 'sums frame scores including multiples strikes & spares' do
      scorecard = Scorecard.new
      frame1 = Frame.new(10,0)
      frame2 = Frame.new(10,0)
      frame3 = Frame.new(7,1)
      frame1.add_rolls
      frame2.add_rolls
      frame3.add_rolls
      scorecard.frame_add(frame1)
      scorecard.frame_add(frame2)
      scorecard.frame_add(frame3)
      expect(scorecard.score).to eq 53
    end

    it 'full game including strikes in end game' do
      scorecard = Scorecard.new
      frame1 = Frame.new(10,0) #27
      frame2 = Frame.new(10,0) #18
      frame3 = Frame.new(7,1) #8
      frame4 = Frame.new(6,4) #17
      frame5 = Frame.new(7,1) #8
      frame6 = Frame.new(10,0) #17
      frame7 = Frame.new(4,3) # 7
      frame8 = Frame.new(0,0) #0
      frame9 = Frame.new(6,4) #20
      frame10 = Frame.new(10,0) #21
      frame11 = Frame.new(10,0) #11
      frame12 = Frame.new(1,0) #1
      frame1.add_rolls
      frame2.add_rolls
      frame3.add_rolls
      frame4.add_rolls
      frame5.add_rolls
      frame6.add_rolls
      frame7.add_rolls
      frame8.add_rolls
      frame9.add_rolls
      frame10.add_rolls
      frame11.add_rolls
      frame12.add_rolls
      scorecard.frame_add(frame1)
      scorecard.frame_add(frame2)
      scorecard.frame_add(frame3)
      scorecard.frame_add(frame4)
      scorecard.frame_add(frame5)
      scorecard.frame_add(frame6)
      scorecard.frame_add(frame7)
      scorecard.frame_add(frame8)
      scorecard.frame_add(frame9)
      scorecard.frame_add(frame10)
      scorecard.frame_add(frame11)
      scorecard.frame_add(frame12)
      expect(scorecard.score).to eq 155
    end

    it 'perfect game' do
      scorecard = Scorecard.new
      frame1 = Frame.new(10,0) #27
      frame2 = Frame.new(10,0) #18
      frame3 = Frame.new(10,0) #8
      frame4 = Frame.new(10,0) #17
      frame5 = Frame.new(10,0) #8
      frame6 = Frame.new(10,0) #17
      frame7 = Frame.new(10,0) # 7
      frame8 = Frame.new(10,0) #0
      frame9 = Frame.new(10,0) #20
      frame10 = Frame.new(10,0) #21
      frame11 = Frame.new(10,0) #11
      frame12 = Frame.new(10,0) #1
      frame1.add_rolls
      frame2.add_rolls
      frame3.add_rolls
      frame4.add_rolls
      frame5.add_rolls
      frame6.add_rolls
      frame7.add_rolls
      frame8.add_rolls
      frame9.add_rolls
      frame10.add_rolls
      frame11.add_rolls
      frame12.add_rolls
      scorecard.frame_add(frame1)
      scorecard.frame_add(frame2)
      scorecard.frame_add(frame3)
      scorecard.frame_add(frame4)
      scorecard.frame_add(frame5)
      scorecard.frame_add(frame6)
      scorecard.frame_add(frame7)
      scorecard.frame_add(frame8)
      scorecard.frame_add(frame9)
      scorecard.frame_add(frame10)
      scorecard.frame_add(frame11)
      scorecard.frame_add(frame12)
      expect(scorecard.score).to eq 300
    end
  end  
end