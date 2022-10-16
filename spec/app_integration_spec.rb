# require 'frame'
# require 'scorecard'
# require_relative '../app'

# RSpec.describe App do
#   def initialize(io)
#     @io = io
#   end

#   describe 'user input' do
#     it 'asks user to input score for frame' do
#       app = App.new(@io, Scorecard.new, Frame.new)
#       @io = double :io
#       puts('First roll score:')
#       gets(2)
#       puts('Second roll score:')
#       gets(5)
#       puts('Frame 1: [2,5]')
#       app.run_scorecard
#     end
#   end


#   private

#   def puts(string)
#     expect(@io).to receive(:puts).with(string)
#   end

#   def gets(string)
#     expect(@io).to receive(:gets).and_return(string)
#   end
# end


#   #   # it 'adds 2 frames to score array' do
#   #   #   scorecard = Scorecard.new
#   #   #   frame1 = Frame.new(1, 6)
#   #   #   frame2 = Frame.new(6, 3)
#   #   #   scorecard.add_frames(frame1)
#   #   #   scorecard.add_frames(frame2)

#   #   #   expect(scorecard.raw_score_arr).to eq [frame1, frame2]
#   #   # end
#   # end