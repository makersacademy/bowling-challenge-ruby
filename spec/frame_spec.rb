require 'frame'

describe Frame do
  
  context '#roll' do
    it 'throws an error if the amount of pins hit is an invalid entry' do
      io = double :io
      frame = Frame.new(io)

      expect(io).to receive(:gets).and_return('12')
      expect{ frame.roll }.to raise_error 'Invalid entry.'
    end

    it 'plays a roll' do
      io = double :io
      frame = Frame.new(io)

      expect(io).to receive(:gets).and_return('5')
      expect(frame.roll[0]).to eq 5
    end
  end

  context '#strike' do
    it 'returns true if a strike has been achieved' do
      io = double :io
      frame = Frame.new(io)

      expect(io).to receive(:gets).and_return('10')
      expect(frame.roll).to eq [10]
      expect(frame.strike?).to eq true
    end
  end

  context '#spare' do
    it 'returns true if a spare has been achieved' do
      io = double :io
      frame = Frame.new(io)

      expect(io).to receive(:gets).and_return('6')
      expect(io).to receive(:gets).and_return('4')
      frame.roll

      expect(frame.roll.sum).to eq 10
      expect(frame.spare?).to eq true
    end
  end

  context '#run' do
    it 'plays the whole frame and returns the score for that frame' do
      io = double :io
      frame = Frame.new(io)

      expect(io).to receive(:gets).and_return('3')
      expect(io).to receive(:gets).and_return('5')
      expect(frame.run).to eq [3, 5] 
    end

    it 'plays the whole frame and returns a strike' do
      io = double :io
      frame = Frame.new(io)

      expect(io).to receive(:gets).and_return('10')
      expect(frame.run).to eq ['X']
    end
  
    it 'plays the whole frame and returns a spare' do
      io = double :io
      frame = Frame.new(io)

      expect(io).to receive(:gets).and_return('9')
      expect(io).to receive(:gets).and_return('1')
      expect(frame.run).to eq [9, '/']
    end
  end
end