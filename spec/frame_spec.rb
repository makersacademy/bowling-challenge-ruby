require 'frame'

describe Frame do
  subject(:frame) { described_class.new }
  describe 'current Frame' do
    it 'starts the game with a frame number of 1' do
      frame = Frame.new
      expect(frame.current_frame).to eq 1
    end
  end

  describe 'calculate frame score' do
    it 'should allow the input of score(s) from a frame and calculate the sum' do
      frame.score(4,5)
      expect(frame.frame_total).to eq 9
    end
  end

  describe 'attempt illegal score' do
    it 'should return an error if frame score is greater than 10' do
      expect { frame.score(6,8) }.to raise_error("Score recorded for round is too high")
    end
  end

  describe 'achieve a strike' do
    it 'should record a strike and recognise it as 10 points initially' do

    end
  end

  describe 'achieve a spare' do
    it 'should record a spare and recognise it as 10 points initially' do
      
    end
  end
end