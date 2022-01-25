require 'frame'

describe Frame do
  
  let(:strike_frame) { Frame.new(10) }
  let(:incomplete_frame) { Frame.new(7)}
  
  let(:spare_frame) do
    frame = Frame.new(2)
    frame.add_roll_2(8)
    frame
  end
  
  let(:open_frame) do
    frame = Frame.new(3)
    frame.add_roll_2(6)
    frame
  end

  context 'when initialised' do
    context 'when roll invalid' do
      it 'throws an error' do
        expect { Frame.new(11) }.to raise_error 'invalid roll'
      end
    end
    
    context 'when roll valid' do

      it 'has score equal to roll_1' do
        expect(Frame.new(7).score).to eq 7
      end

      context 'when strike' do
        it 'summarises frame' do
          expect(strike_frame.score).to eq 10
          expect(strike_frame.bonus_rolls).to eq 2
        end
        
        it 'checks completion' do
          expect(strike_frame).to be_complete
        end
      end

      context 'when spare' do
        context 'checks completion' do
          it 'is not complete' do
            expect(incomplete_frame).not_to be_complete
          end
        end
      end
    end
  end



  describe 'add_roll_2' do
    
    # Should I be testing that it calls the validate method?
    it 'validates the roll' do
      expect(incomplete_frame).to receive(:validate_roll).with(3)
      incomplete_frame.add_roll_2(3)
    end
    
    # or should I test whether the error is raised when the method is(not) called?
    context 'when roll invalid' do
      it 'raises an error' do
        expect { incomplete_frame.add_roll_2(4) }.to raise_error 'invalid roll'
      end
    end

    context 'when the roll is valid' do
      it 'does not throw an error' do
        expect { incomplete_frame.add_roll_2(3) }.not_to raise_error 'invalid roll'
      end
      
      it 'completes the frame' do
        incomplete_frame.add_roll_2(3)
        expect(incomplete_frame).to be_complete
      end  
      
      it 'adds 2nd roll to frame' do
        incomplete_frame.add_roll_2(3)
        expect(incomplete_frame.roll_2).to eq 3
      end

      # again do I check if the method summarise_frame is called?
      # or if the frame is actually summarised
      it 'summarises the frame' do
        expect(incomplete_frame).to receive(:summarise_frame)
        incomplete_frame.add_roll_2(2)
      end

      it 'summarises the frame' do
        incomplete_frame.add_roll_2(3)
        expect(incomplete_frame.score).to eq 10
        expect(incomplete_frame.bonus_rolls).to eq 1
      end
    end
  end

  describe '#complete' do
    context 'when strike' do
      it 'is complete' do
        expect(Frame.new(10)).to be_complete
      end
    end

    context 'when only 1 roll' do
      it 'is not complete' do
        expect(incomplete_frame).not_to be_complete
      end
    end
    
    context 'when 2 rolls' do
      it 'is complete' do
        expect(open_frame).to be_complete
      end
    end
  end

  describe 'roll_1' do
    it 'returns the first roll' do
      expect(spare_frame.roll_1).to eq 2
    end
  end
  
  describe 'roll_2' do
    it 'returns the second roll' do
      expect(spare_frame.roll_2).to eq 8
    end

  end
  describe '#strike?' do
    
    it 'returns true' do
      expect(strike_frame.strike?).to eq true
    end

    it 'returns false' do
      expect(spare_frame.strike?).to eq false
    end

    it 'returns false' do
      expect(open_frame.strike?).to eq false
    end
  end

  describe '#spare?' do
    
    it 'returns true' do
      expect(spare_frame.spare?).to eq true
    end

    it 'returns false' do
      expect(strike_frame.spare?).to eq false
    end

    it 'returns false' do
      expect(open_frame.spare?).to eq false
    end

  end

  describe '#bonus_rolls?' do
    it 'returns 2' do
      expect(strike_frame.bonus_rolls).to eq 2
    end

    it 'returns 1' do
      expect(spare_frame.bonus_rolls).to eq 1
    end

    it 'returns 0' do
      expect(open_frame.bonus_rolls).to eq 0
    end
    
  end
  
  describe '#add_points' do
    it 'adds 5 to score' do
      strike_frame.add_points(5)
      expect(strike_frame.score).to eq 15
    end
  end
end

