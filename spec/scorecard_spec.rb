require 'scorecard'

RSpec.describe Scorecard do
  describe '#add' do
    it 'adds 2 frames to raw score array' do
      scorecard = Scorecard.new
      fake_frame1 = double :fake_frame1, roll1: '1', roll2: '6'
      fake_frame2 = double :fake_frame2, roll1: '6', roll2: '3'
      scorecard.add_frames(fake_frame1)
      scorecard.add_frames(fake_frame2)
      expect(scorecard.raw_score_arr).to eq [fake_frame1, fake_frame2]
    end
  end

  describe '#score_arr' do
    xit 'returns array of integers representing raw frame scores' do
      scorecard = Scorecard.new
      fake_frame1 = double :fake_frame1, roll1: '1', roll2: '6'
      fake_frame2 = double :fake_frame2, roll1: '6', roll2: '3'
      fake_frame1.add_rolls
      fake_frame2.add_rolls
      f = fake_frame1.sum_rolls
      f2 = fake_frame2.sum_rolls
      scorecard.sum_score(f)
      scorecard.sum_score(f2)
      expect(scorecard.score_arr).to eq [7,9]
    end
  end
end

#   describe '#score_arr' do
#     it 'adds non-strike frame to score_arr' do
#       scorecard = Scorecard.new
#       roll1 = Roll.new('4')
#       roll2 = Roll.new('5')
#       scorecard.add(roll1)
#       scorecard.add(roll2)
#       expect(scorecard.score_arr).to eq [4,5]
#     end
#   end
# end