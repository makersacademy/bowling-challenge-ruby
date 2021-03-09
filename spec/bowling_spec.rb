require 'bowling'

describe Bowling do

  # KEEPS SCORE
  let(:frame_class) { double 'frame_class' }
  describe 'play' do
    it 'creates a new frame' do
      allow(frame_class).to receive_message_chain("new.get_rolls")
      expect(frame_class).to receive(:new)
      subject.play(frame_class)
    end

    it 'returns current frame as array of numbers' do
      allow(frame_class).to receive_message_chain("new.get_rolls") { [3,4] }
      expect(subject.play(frame_class)).to eq [3,4]
    end
  end



  # describe 'start' do
  #   it 'initiates bowling game' do
  #     expect(subject).to receive(:get_frame)
  #     subject.start
  #     # expect(subject.score_card).to eq []
  #   end
  # end



  # describe 'get_frame' do
  #   it "gets input from user and puts it in scores array" do
  #     expect{ subject.get_frame }.to output.to_stdout
  #     expect{ subject.get_frame }.to change{ subject.frames }
  #   end
  # end
  #
  # describe 'calculate' do
  #   it 'calculates array of scores' do
  #
  #   end
  # end
  # describe 'direct' do
  #   it "sends to less_than_10 with '5,3' input" do
  #     expect(subject).to receive(:less_than_10)
  #     subject.direct([5,3])
  #   end
  #
  #   it "sends to spare with '4,6' input" do
  #     expect(subject).to receive(:spare)
  #     subject.direct([4,6])
  #   end
  #
  #   it "sends to strike with '10,0' input" do
  #     expect(subject).to receive(:strike)
  #     subject.direct([10,0])
  #   end
  # end
  #
  # describe 'less_than_10' do
  #   it "receives user input for less than 10 and inputs into score_card" do
  #     subject.less_than_10([5,3])
  #     expect(subject.score_card).to eq [[5,3,8]]
  #   end
  # end
  #
  # describe 'spare' do
  #   it "receives user input for total of 10 and inputs into score_card" do
  #     expect(subject).to receive(:request_roll_following_spare)
  #     subject.spare([4,6])
  #     expect(subject.score_card).to eq [[4,6,'pending']]
  #   end
  # end
  #
  # describe 'strike' do
  #   it "receives user input for strike and inputs into score_card" do
  #     expect(subject).to receive(:request_roll_following_strike)
  #     subject.strike([10,0])
  #     expect(subject.score_card).to eq [[10,0,'pending']]
  #   end
  # end
  #
  # describe 'request_roll_following_spare'
  #   it 'adds first roll of next frame to 10 and puts into score_card' do
  #     # subject.score_card = [[4,6,'pending']]
  #     expect(subject.request_roll_following_spare)
  #   end
end
