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
    it 'saves each frame seperately' do
      bowl.roll(10)
      bowl.roll(6)
      bowl.roll(1)
      bowl.roll(7)

      expect(bowl.frames.length).to eq 3
    end 
  end 

  describe 'total' do 
    it 'should be able to calculate the total score' do 
      bowl.roll(3)
      bowl.roll(6)
      bowl.roll(1)
      bowl.roll(7)

      expect(bowl.total).to eq 17
    end 
    it 'should calculate a bonus for a strike as well' do 
      bowl.roll(10)
      bowl.roll(5)
      bowl.roll(3)

      expect(bowl.total).to eq 26
    end 

    it 'should calculate a spare as well' do 
      bowl.roll(9)
      bowl.roll(1)
      bowl.roll(5)
      bowl.roll(3)

      expect(bowl.total).to eq 23
    end 

    it 'knows what to do with a double strike' do
      bowl.roll(10)
      bowl.roll(10)
      bowl.roll(4)
      bowl.roll(2)
      bowl.roll(2)
      bowl.roll(1)

      expect(bowl.total).to eq 49
    end 
  end 
  
end