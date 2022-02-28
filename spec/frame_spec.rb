require 'frame'

describe Frame do
  subject(:frame) { described_class.new }
  describe 'current Frame' do
    it 'starts the game with a frame number of 1' do
      frame = Frame.new
      expect(frame.current_frame).to eq 1
    end
  end

  describe 'achieve a strike' do
    it 'should record a strike and recognise it as 10 points initially' do
      expect(frame.strike?([10])).to be_truthy
    end
  end

  describe 'achieve a spare' do
    it 'should record a spare and recognise it as 10 points initially' do
      expect(frame.strike?([9])).to be_falsey
      expect(frame.spare?([9,1])).to be_truthy
    end
  end
end