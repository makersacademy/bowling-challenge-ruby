require 'frame'

describe Frame do

  it 'initialises new frame with an id' do
    frame = Frame.new(1, 10)
    expect(frame.frame_id).to eq 1
  end

  describe '#add' do

    context "normal frames" do

      let(:frame) { Frame.new(1, 10) }

      it 'adds first frame roll to the frame' do
        frame.roll(4)
        expect(frame.roll_1).to eq 4
      end

      it 'adds second frame roll to the frame' do
        frame.roll(4)
        frame.roll(5)
        expect(frame.roll_2).to eq 5
      end

      it 'is strike if first roll is 10' do
        frame.roll(10)
        expect(frame.roll_1).to eq :X
      end

      it 'is not strike if 1st roll is less than 10' do
        frame.roll(9)
        expect(frame.roll_1).not_to eq :X
      end

      it 'is a spare if 1st & 2nd rolls total 10' do
        frame.roll(2)
        frame.roll(8)
        expect(frame.roll_2).to eq :/
      end

      it 'is not spare if 1st & 2nd rolls total less than 10' do
        frame.roll(2)
        frame.roll(7)
        expect(frame.roll_2).not_to eq :/
      end

      it 'cannot enter roll if frame full' do
        frame.roll(4)
        frame.roll(5)
        frame.roll(6)
        expect(frame.roll_1).to eq 4
        expect(frame.roll_2).to eq 5
        expect(frame.roll_3).to eq nil
      end

      it 'cannot add a roll after strike' do
        frame.roll(10)
        frame.roll(1)
        expect(frame.roll_1).to eq :X
        expect(frame.roll_2).to eq nil
      end
    end
  end

  context 'final frame' do

    let(:frame) { Frame.new(10, 10) }
    
    it 'allows extra roll if rolls 1 & 2 are a spare' do
      frame.roll(2)
      frame.roll(8)
      frame.roll(5)
      expect(frame.roll_2).to eq :/
      expect(frame.roll_3).to eq 5
    end

    it 'allows extra two rolls if roll 1 is a strike' do
      3.times { frame.roll(10) }
      expect(frame.roll_2).to eq :X
      expect(frame.roll_3).to eq :X
    end
    
    it 'cannot add roll after two non-bonus rolls' do
      3.times { frame.roll(3) }
      expect(frame.roll_3).to eq nil
    end

    it 'will not add further rolls after third roll' do
      3.times { frame.roll(5) }
      frame.roll(2)
      expect(frame.roll_1).to eq 5
      expect(frame.roll_2).to eq :/
      expect(frame.roll_3).to eq 5
    end
  end
end
