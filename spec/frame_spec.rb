require 'frame'

describe Frame do 

  context "1 - Score must be between 0 - 10" do 

    it 'returns the score of a valid entry' do 
      frame = Frame.new(1,5) 
      expect(frame.frame_total).to equal 6
      expect(frame.is_strike?).to equal false
      expect(frame.is_spare?).to equal false
    end 

    it 'raises error for invalid frame inputs' do
      frame = Frame.new(10,5)
      expect { frame.frame_total }.to raise_error(ArgumentError)
    end 
  end 

  context 'player gets a spare' do 

    it 'marks frame as a spare' do
      frame = Frame.new(6,4) 
      expect(frame.frame_total).to equal 10
      expect(frame.is_strike?).to equal false
      expect(frame.is_spare?).to equal true
    end
  end 

  context 'player gets a strike' do 

    it 'marks frame as a strike' do
      frame = Frame.new(10,0) 
      expect(frame.frame_total).to equal 10
      expect(frame.is_strike?).to equal true 
      expect(frame.is_spare?).to equal false
    end
  end 
end 