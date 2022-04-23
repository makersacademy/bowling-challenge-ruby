require 'frame'

describe Frame do
  let(:frame) { described_class.new }

  describe '#rolls' do
    it 'Should start with no rolls' do
      expect(frame.rolls).to eq(0)
    end

    it 'Should know how many rolls have been rolled' do
      frame.add_roll(2)
      expect(frame.rolls).to eq(1)
    end
  end

  it 'Should know how many pins are remaining for this frame' do
    expect(frame.pins_remaining).to eq(10)
  end

  it 'Should know how many pins were taken down in first roll' do
    frame.add_roll(5)
    expect(frame.first_roll).to eq(5)
  end

  it 'Should know how many pins were taken down in second roll' do
    frame.add_roll(5)
    frame.add_roll(2)
    expect(frame.second_roll).to eq(2)
  end

  it 'Should know how many pins were taken down in bonus roll' do
    frame.add_roll(5)
    frame.add_roll(2)
    frame.add_roll(0)
    expect(frame.bonus_roll).to eq(0)
  end

  describe '#strike?' do
    it 'Should know if the frame was a strike' do
      frame.add_roll(10)
      expect(frame.strike?).to eq(true)
    end

    it 'Should know if the frame was not a strike' do
      frame.add_roll(5)
      frame.add_roll(2)
      expect(frame.strike?).to eq(false)
    end
  end

  describe '#spare?' do
    it 'Should know if the frame was a spare' do
      frame.add_roll(5)
      frame.add_roll(5)
      expect(frame.spare?).to eq(true)
    end

    it 'Should know if the frame was not a spare' do
      frame.add_roll(5)
      frame.add_roll(2)
      expect(frame.spare?).to eq(false)
    end
  end
end
