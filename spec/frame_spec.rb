require 'frame'

describe Frame do
  subject(:frame) { described_class.new }

  describe '#initialize' do
    it 'frame initialize with 10 pins' do

      expect(frame.pins_left).to eq 10
    end
  end

  describe '#roll'
  it 'deduct knocked pins from pins number' do

    expect { frame.roll(1) }.to change { frame.pins_left }.by(-1)
  end

  it 'add roll to the array of rolls' do

    expect { frame.roll(1) }.to change { frame.rolls.length }.by(1)
  end

  it 'raises error if given number of pins is greater then number of pins in the game' do

    expect { frame.roll(11) }.to raise_error 'Wrong pins number'
  end

  it 'raises error if there is more then two rolls per frame' do
    frame.roll(1)
    frame.roll(2)

    expect { frame.roll(1) }.to raise_error 'Unexpected third roll??'
  end

  describe '#frame_score' do
    it 'calculate score for the frame' do
      frame.roll(1)
      frame.roll(2)

      expect(frame.frame_score).to eq 3
    end
  end

  describe '#strike?' do
    it 'changes @strike to true if number of pins knocked down is equal to 10' do

      frame.roll(10)

      expect(frame.strike).to eq true
    end
  end

  describe 'spare?' do
    it 'changes @spare to true if number of pins left after second roll is equal 0' do
      frame.roll(2)
      frame.roll(8)
      expect(frame.spare).to eq true
    end
  end
end
