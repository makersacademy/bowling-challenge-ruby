require 'frame'

describe Frame do

  let(:check) { double :check }

  it 'initialises @frame as a frame hash' do
    hash = { frame: 1, 1 => nil, spare: nil, strike: nil }
    allow(check).to receive(:valid?) { true }
    frame = Frame.new(1, check)
    expect(frame.content).to eq hash
  end

  it 'checks frame number is valid' do
    expect(check).to receive(:valid?) { true }
    Frame.new(1, check)
  end

  it 'raises error for an invalid frame number' do
    allow(check).to receive(:valid?) { false }
    message = 'Not a valid frame number'
    expect { Frame.new(-1, check) }.to raise_error message
  end

  it 'does not allow non-integers as frame number' do
    expect(check).to receive(:valid?) { false }
    message = 'Not a valid frame number'
    expect { Frame.new('a', check) }.to raise_error message
  end

  describe '#add' do
    it 'adds first frame roll to the 1 key of frame hash' do
      allow(check).to receive(:valid?) { true }
      frame = Frame.new(1, check)
      frame.add(4)
      expect(frame.content).to include(1 => 4)
    end
  end

end
