require 'scorecard'

RSpec.describe Scorecard do
  describe '#add' do
    it 'adds 2 frames to raw score array' do
      scorecard = Scorecard.new
      frame1 = Frame.new('1', '6')
      frame2 = Frame.new('6', '3')
      scorecard.add(frame1)
      scorecard.add(frame2)
      expect(scorecard.raw_score_arr).to eq [frame1, frame2]
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