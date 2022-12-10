require 'frame'

describe Frame do 

  context "1 - Score must be between 0 - 10" do 

    it 'returns the score of a valid entry' do 
      frame = Frame.new(1,5) 
      expect(frame.frame_total).to equal 6
      expect(frame.is_strike?).to equal false
      expect(frame.is_spare?).to equal false
    end 

    # frame = Frame.new(1,5) 
    # expect(frame.frame_total).to equal 6
    # expect(frame.is_strike?).to equal false
    # expect(frame.is_spare?).to equal false 

  end 
end 