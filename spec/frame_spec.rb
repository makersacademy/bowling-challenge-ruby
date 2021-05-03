require 'frame'

describe Frame do
  let(:frame) {described_class.new}
 
  describe '#Initialize' do
    it 'Frame instances are initialized with rolls array' do
      expect(frame.rolls).to be_an_instance_of (Array)
    end
    it 'Frames are initialized with a in_play method set to true' do
      expect(frame.in_play).to eq(true)
    end
   
  end

  describe '#knocked' do
    it 'Accepts pins as an argument' do
      expect(frame).to respond_to(:knocked).with(1).argument 
    end
  end

  describe '#frame_check' do
    it 'Calls the close_play method if 2 throws have happened' do
      expect(frame).to receive(:close_play)
      2.times {frame.knocked(2)}
    end
  end

  describe '#strike_check' do
  it 'Calls the close_play method if 2 throws have happened' do
    expect(frame).to receive(:close_play)
    frame.knocked(10)
  end
end

  describe '#frame_total' do
    it 'Sums up the score of both rolls of the frame' do
      frame.knocked(3)
      frame.knocked(3)
      expect(frame.score).to eq (6)
    end
  end

  describe '#close_play' do
    it 'Changes @in_play to false' do
      expect{frame.close_play}.to change{frame.in_play}.to false
    end
  end

  describe '#frame_10' do
  let(:frame_10) {Frame.new(true)}
    it 'Is equal to false unless instructed otherwise' do
      expect(frame.frame_10).to eq false
    end
    it 'Is equal to true when initialized otherwise' do
      expect(frame_10.frame_10).to eq true
    end
    it 'The frame stays in_play if the player strikes on their first move of frame 10' do
      frame_10.knocked(10)
      frame_10.knocked(4)
      expect(frame_10.in_play).to eq true
    end
  end
  
  describe 'Strike?' do
    it 'Returns true if strike' do
     frame.knocked(10)
      expect(frame.strike?).to eq true
    end
  end

  describe 'Spare?' do
    it 'Returns true if spare' do
      frame.knocked(5)
      frame.knocked(5)
      expect(frame.spare?).to eq true
    end
  end

end