require 'score_card'

describe ScoreCard do 
  let(:bowl) { ScoreCard.new }
  describe '#frame_count' do 
    it 'should be 1 by default' do 
      expect(bowl.frame_count).to eq 1
    end 
  end 
  
  describe '#next_frame' do 
    it 'should add up a new frame' do 
      bowl.next_frame

      expect(bowl.frame_count).to eq 2
    end 
    it 'should keep adding up' do 
      3.times { bowl.next_frame }

      expect(bowl.frame_count).to eq 4
    end 
    it 'should end the game at 10 frames' do
      10.times { bowl.next_frame }

      expect(bowl.frame_count).to eq 10
    end  
  end 

  describe '#roll_count' do 
    it 'should be 1 by default' do
      expect(bowl.roll_count).to eq 1 
    end 
  end 
  describe '#next_roll' do 
    it 'should add up a new roll' do 
      bowl.next_roll 

      expect(bowl.roll_count).to eq 2
    end 
    it 'should reset after two rolls and add up a new frame' do 
      2.times { bowl.next_roll }

      expect(bowl.roll_count).to eq 1
      expect(bowl.frame_count).to eq 2
    end
  end

  describe '#hit_pins_per_roll' do 
    it 'is an array' do 
      expect(bowl.hit_pins_per_roll).to eq []
    end
    it 'saves the amount of hit pins per roll' do 
      bowl.roll(4)

      expect(bowl.hit_pins_per_roll).to eq [4]
    end 
    it 'should initiate the next roll' do 
      bowl.roll(4)

      expect(bowl.roll_count).to eq 2
    end 
    it 'should only save each frame and reset' do 
      bowl.roll(4)
      bowl.roll(5)

      expect(bowl.hit_pins_per_roll).to eq []
    end 
  end 

  describe '#hit_pins_per_frame' do 
    it 'should be an array' do 
      expect(bowl.hit_pins_per_frame).to eq []
    end 
    it 'should save the hits per roll' do 
      bowl.roll(4)
      bowl.roll(5)

      expect(bowl.hit_pins_per_frame).to eq [[4, 5]]
    end
  end 

  describe '#total' do 
    it 'adds up all rolls' do 
      bowl.roll(4)
      bowl.roll(5)
      bowl.roll(7)
      bowl.roll(1)

      expect(bowl.total).to eq 17
    end
  end 
end 