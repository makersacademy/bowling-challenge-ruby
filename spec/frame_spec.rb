require 'frame'

RSpec.describe Frame do
  context '#rolls' do
    it 'initializes with an empty rolls array' do
      frame = Frame.new
  
      expect(frame.rolls).to eq []
    end
  end
    
  context '#add_rolls' do
    it 'adds rolls to the array' do
      frame = Frame.new

      frame.add_roll(1)
      frame.add_roll(1)

      expect(frame.rolls).to eq [1, 1]
    end

    it 'fails when adding a third roll to a non-tenth frame' do
      frame = Frame.new
      
      frame.frame_number = 1
      frame.add_roll(1)
      frame.add_roll(1)

      expect{frame.add_roll(1)}.to raise_error 'Only the tenth frame may consist of more than two rolls' 
    end

    it 'fails when a fourth add_roll attempted on tenth frame' do
      frame = Frame.new
      
      frame.frame_number = 10
      frame.add_roll(1)
      frame.add_roll(1)
      frame.add_roll(1)

      expect{frame.add_roll(1)}.to raise_error 'The tenth frame may consist of no more than three rolls'
    end
  end

  context '#calculate_frame_score' do
    it 'sets frame_score to 0 when rolls = [0, 0]' do
      frame = Frame.new

      frame.add_roll(0)
      frame.add_roll(0)
      frame.calculate_frame_score

      expect(frame.frame_score).to eq 0
    end

    it 'sets frame_score to 5 when rolls = [2, 3]' do
      frame = Frame.new

      frame.add_roll(2)
      frame.add_roll(3)
      frame.calculate_frame_score

      expect(frame.frame_score).to eq 5
    end
  end

  context '#calculate_total_score' do
    it 'sets total_score to 0 when frame_score and bonus_score are 0' do
      frame = Frame.new

      frame.add_roll(0)
      frame.add_roll(0)
      frame.calculate_frame_score
      frame.calculate_total_score

      expect(frame.total_score).to eq 0
    end

    it 'sets total_score to 10 when frame_score is 9 and bonus_score is 1' do
      frame = Frame.new

      frame.add_roll(8)
      frame.add_roll(1)

      frame.bonus_score = 1
      frame.calculate_total_score

      expect(frame.total_score).to eq 10
    end
  end

  context '#is_strike?' do
    it 'returns true when first roll = 10' do
      frame = Frame.new

      frame.frame_number = 2
      frame.add_roll(10)

      expect(frame.is_strike?).to eq true
    end
  end

  context '#is_spare?' do
    it 'returns true when sum of first two rolls = 10' do
      frame = Frame.new

      frame.add_roll(5)
      frame.add_roll(5)
      frame.calculate_frame_score

      expect(frame.frame_score).to eq 10
      expect(frame.is_spare?).to eq true
    end

    it 'returns false when sum correct but only one roll' do
      frame = Frame.new

      frame.add_roll(10)
      frame.calculate_frame_score

      expect(frame.frame_score).to eq 10
      expect(frame.is_spare?).to eq false
    end

    it 'returns false when first roll 10 and second roll 0' do
      frame = Frame.new

      frame.add_roll(10)
      frame.add_roll(0)
      frame.calculate_frame_score

      expect(frame.frame_score).to eq 10
      expect(frame.is_spare?).to eq false
    end
  end
end