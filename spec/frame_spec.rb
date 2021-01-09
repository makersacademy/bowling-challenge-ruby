require 'frame'

describe Frame do
  let(:roll_1) { 3 }
  let(:roll_2) { 4 }
  describe '#initialize' do
    it 'creates an instance of Frame' do
      frame = Frame.new(roll_1, roll_2)
      expect(frame).to be_an_instance_of Frame
    end
    it 'returns the score of the frame' do
      frame = Frame.new(roll_1, roll_2)
      expect(frame.frame_score).to eq 7
    end
  end
end
