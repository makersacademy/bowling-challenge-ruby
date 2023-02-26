require_relative '../lib/frame'

describe Frame do
  it 'Can handle a single roll' do
    frame = Frame.new
    frame.add_roll(5)
    expect(frame.score).to eq(5)
  end
  
  it 'Can handle two rolls' do
    frame = Frame.new
    frame.add_roll(5)
    frame.add_roll(3)
    expect(frame.score).to eq(8)
  end

  context 'spare? method' do
    it 'recognises two rolls equating to spare' do 
      frame = Frame.new
      frame.add_roll(5)
      frame.add_roll(5)
      expect(frame.spare?).to eq(true)
    end

    it 'recognises two rolls not equating to spare' do
      frame = Frame.new
      frame.add_roll(5)
      frame.add_roll(3)
      expect(frame.spare?).to eq(false)
    end  
  end
  
  context 'strike? method' do
    it 'recognises a strike' do 
      frame = Frame.new
      frame.add_roll(10)
      expect(frame.strike?).to eq(true)
    end
  end  

  context 'recognises frame is complete' do
    it 'returns true when strike? true' do
      frame = Frame.new
      frame.add_roll(10)
      expect(frame.strike?).to be true
      expect(frame.frame_complete?(0)).to eq(true)
    end  

    it 'returns true when rolls == 2 + frame < 9' do
      frame = Frame.new
      frame.add_roll(5)
      frame.add_roll(3)
      expect(frame.frame_complete?(0)).to eq(true)
    end  

    it 'returns false when rolls < 2 + frame < 9' do
      frame = Frame.new
      frame.add_roll(5)
      expect(frame.frame_complete?(0)).to eq(false)
    end  

    it 'returns true in 10th frame if strike/spare + rolls == 3' do
      frame = Frame.new
      pins = [6, 4, 3]
      pins.each do |pin|
        frame.add_roll(pin)
      end
      expect(frame.frame_complete?(9)).to eq(true)
    end  

    it 'returns false in 10th frame if strike/spare + rolls == 2' do
      frame = Frame.new
      pins = [6, 4]
      pins.each do |pin|
        frame.add_roll(pin)
      end
      expect(frame.frame_complete?(9)).to eq(false)
    end  
  end  

end  