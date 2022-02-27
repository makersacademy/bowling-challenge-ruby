describe Frame do
  subject(:frame) { described_class.new }

  describe '#first_roll' do
    it 'determines if a second roll is required' do
      frame.first_roll(2)
      expect(frame.pinfall.sum).to eq 2
    end
  end

  describe '#first_roll' do
    it 'records a strike on the first roll' do
      expect(frame.first_roll(10)).to eq 'STRIKE! End of frame'
      expect(frame.pinfall.sum).to eq 0
      expect(frame.scorecard.sum).to eq 10
    end
  end

  describe '#second_roll' do
    it 'records a spare' do
      frame.first_roll(4)
      expect(frame.second_roll(6)).to eq 'SPARE!'
      expect(frame.scorecard.last).to eq 10
    end
  end

  describe '#second_roll' do
    it 'counts pinfall for frame' do
      frame.first_roll(4)
      expect(frame.second_roll(4)).to eq 'You knocked over 8 pins'
      expect(frame.scorecard.last).to eq 8
    end
  end

end
