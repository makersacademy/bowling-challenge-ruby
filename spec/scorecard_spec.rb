# require 'scorecard'
# require 'frame'

# describe ScoreCard do

#   subject(:card) { described_class.new }
#   let(:frame) { Frame.new }

#   xcontext 'calculating score' do
#     xdescribe '#frame_score' do
#       it 'returns the total score of 5 for a frame' do
#         card.frame.add_first_roll(2)
#         card.frame.add_second_roll(3)
#         expect { card.frame_score }.to change { card.total_score[1] }.to(5)
#       end

#       it 'returns "pending" in case of strike' do
#         card.frame.add_first_roll(10)
#         expect { card.frame_score }.to change { card.total_score[1] }.to('strike')
#       end

#       it 'returns "pending" in case of  spare' do
#         card.frame.add_first_roll(3)
#         card.frame.add_second_roll(7)
#         expect { card.frame_score }.to change { card.total_score[1] }.to('spare')
#       end
#     end
#   end

#   xcontext 'saving frame details with pins by rolls and total score' do

#     before do
#       card.frame.add_first_roll(3)
#       card.frame.add_second_roll(5)
#       card.frame_score
#     end

#     xdescribe '#save_current_frame' do
#       it 'prints the current frame and knocked down pins for each roll' do
#         expect(card.save_current_frame).to include 'Frame: 1'
#       end
#     end

#     xdescribe '#save_roll_details' do
#       it 'prints the current frame and knocked down pins for each roll' do
#         expect(card.save_roll_details).to include 'Roll 1: 3, Roll 2: 5'
#       end
#     end

#     describe '#save_total_score' do
#       it 'prints the total score for the frame' do
#         expect(card.save_total_score).to include 'Total score: 8'
#       end
#     end

#     xdescribe '#update_scorecard' do
#       it 'saves details of the frame in scorecard' do
#         expect { card.update_scorecard }.to change { card.scorecard[1] }.to(["Frame: 1", "Roll 1: 3, Roll 2: 5", "Total score: 8"])
#       end
#     end
#   end
# end
