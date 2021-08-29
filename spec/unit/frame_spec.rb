require 'frame'

describe Frame do

  let(:check) { double :check }

  before(:each) do
    allow(check).to receive(:valid?) { true }
  end  

  it 'initialises @frame as a frame hash' do
    frame = Frame.new(1, check)
    expect(frame.print_frame).to eq 'Frame: 1 | 1st roll:  | 2nd roll: '
  end

  it 'checks frame number is valid' do
    expect(check).to receive(:valid?) { true }
    Frame.new(Frame::FIRST_FRAME, check)
  end

  it 'raises error for an invalid frame number' do
    allow(check).to receive(:valid?) { false }
    message = 'Not a valid frame number'
    expect { Frame.new(Frame::FIRST_FRAME-1, check) }.to raise_error message
  end

  it 'does not allow non-integers as frame number' do
    expect(check).to receive(:valid?) { false }
    message = 'Not a valid frame number'
    expect { Frame.new('a', check) }.to raise_error message
  end

  describe '#add' do

    context "normal frames" do

      let (:frame) { Frame.new(Frame::FIRST_FRAME, check) }

      it 'adds first frame roll to the frame' do
        frame.add(4)
        expect(frame.print_frame).to include '1st roll: 4'
      end

      it 'adds second frame roll to the frame' do
        frame.add(4)
        frame.add(5)
        expect(frame.print_frame).to include '1st roll: 4 | 2nd roll: 5'
      end

      it 'does not enter a roll if frame full' do
        frame.add(4)
        frame.add(5)
        expect { frame.add(3) }.to raise_error 'Frame complete'
      end

      it 'raises error if attempting to add a roll to frame after strike' do
        frame.add(10)
        expect { frame.add(1) }.to raise_error 'Frame complete'
      end

      it 'sets strike flag if first roll is 10' do
        frame.add(10)
        expect(frame.print_frame).to include '1st roll: X'
      end

      it 'does not set strike flag if 1st roll is less than 10' do
        frame.add(9)
        expect(frame.print_frame).not_to include 'X'
      end

      it 'sets spare flag if 1st & 2nd rolls total 10' do
        frame.add(2)
        frame.add(8)
        expect(frame.print_frame).to include '2nd roll: /'
      end

      it 'does not set spare flag if 1st & 2nd rolls total less than 10' do
        frame.add(2)
        frame.add(7)
        expect(frame.print_frame).not_to include '/'
      end
    end
  end

  context 'final frame' do

    let (:frame) { Frame.new(Frame::LAST_FRAME, check) }
    
    it 'allows an extra roll if rolls 1 & 2 are a spare' do
      output = '1st roll: 2 | 2nd roll: / | 3rd roll: 5'
      frame.add(2)
      frame.add(8)
      frame.add(5)
      expect(frame.print_frame).to include output
    end

    it 'allows an extra two rolls if roll 1 is a strike' do
      output = '1st roll: X | 2nd roll: X | 3rd roll: X'
      3.times { frame.add(10) }
      expect(frame.print_frame).to include output
    end
    
    it 'raises error if trying to add roll after two non-bonus rolls' do
      frame.add(4)
      frame.add(5)
      expect { frame.add(3) }.to raise_error 'Frame complete'
    end

    it 'raises error if trying to add roll after three strikes' do
      3.times { frame.add(10) }
      expect { frame.add(3) }.to raise_error 'Frame complete'
    end

    it 'raises error if trying to add roll after a spare and third roll' do
      2.times { frame.add(5) }
      frame.add(10)
      expect { frame.add(1) }.to raise_error 'Frame complete'
    end
  end
end
