require 'frame_ten'

describe FrameTen do
  let(:roll_1) { 7 }
  let(:roll_2) { 4 }
  let(:roll_3) { 2 }
  describe '#initilaize' do
    it 'creates an instance of FrameTen' do
      frame_ten = FrameTen.new(roll_1, roll_2, roll_3)
      expect(frame_ten).to be_an_instance_of FrameTen
    end
  end
end
