require 'frame'

RSpec.describe Frame do
  context '#rolls' do
    it 'initializes with an empty rolls array' do
      frame = Frame.new
  
      expect(frame.rolls).to eq []
    end
  end
    
  context '#add_rolls' do
    it 'adds up to three rolls to the array' do
      frame = Frame.new

      frame.add_roll(1)
      frame.add_roll(1)
      frame.add_roll(1)

      expect(frame.rolls).to eq [1, 1, 1]
    end

    it 'throws error when a fourth add_roll attempted' do
      frame = Frame.new

      frame.add_roll(1)
      frame.add_roll(1)
      frame.add_roll(1)

      expect{frame.add_roll(1)}.to raise_error "A frame may only contain up to three rolls"
    end
  end

  context '#calculate_frame_score' do
    it 'returns 0 when rolls = [0, 0]' do
      frame = Frame.new

      frame.add_roll(0)
      frame.add_roll(0)

      expect(frame.calculate_frame_score).to eq 0
    end

    it 'returns 5 when rolls = [2, 3]' do
      frame = Frame.new

      frame.add_roll(2)
      frame.add_roll(3)

      expect(frame.calculate_frame_score).to eq 5
    end
  end

  context '#calculate_total_score' do
    it 'returns 0 when calculate_frame_score and bonus_score are 0' do
      frame = Frame.new

      frame.add_roll(0)
      frame.add_roll(0)

      expect(frame.calculate_total_score).to eq 0
    end

    it 'returns 10 when calculate_frame_score is 9 and bonus_score is 1' do
      frame = Frame.new

      frame.add_roll(8)
      frame.add_roll(1)

      frame.bonus_score = 1

      expect(frame.calculate_total_score).to eq 10
    end
  end

  context '#is_strike?' do
    it 'returns true when first roll = 10' do
      frame = Frame.new

      frame.add_roll(10)

      expect(frame.is_strike?).to eq true
    end
  end

  context '#is_spare?' do
    it 'returns true when sum of first two rolls = 10' do
      frame = Frame.new

      frame.add_roll(9)
      frame.add_roll(1)

      expect(frame.is_strike?).to eq true
    end
  end
end