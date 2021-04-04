require 'score_card'

describe ScoreCard do 
  let(:bowl) { ScoreCard.new }
  let(:frame) { double :frame }
  describe '#frames' do 
    it 'should be 1 by default' do 
      expect(bowl.frames).to eq []
    end 
  end 

  describe '#roll' do 
    it 'saves each frame in an array' do 
      bowl.roll(4)
      bowl.roll(2)

      expect(bowl.frames.length).to eq 1
    end
  end 
  
end