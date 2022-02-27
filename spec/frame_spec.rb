describe Frame do
  subject(:frame) { described_class.new }

  describe '#first_roll' do
    it 'determines if a second roll is required' do
      frame.first_roll(2)
      expect(frame.pinfall[:roll1]).to eq 2
    end
  end

  describe '#first_roll' do
    it 'records a strike on the first roll' do
      expect(frame.first_roll(10)).to eq 'STRIKE! End of frame'
      expect(frame.scorecard[0][:roll1]).to eq 10
      expect(frame.scorecard[0][:roll2]).to eq nil
    end
  end

  describe '#second_roll' do
    it 'records a spare' do
      frame.first_roll(4)
      expect(frame.second_roll(6)).to eq 'SPARE!'
      expect(frame.scorecard.last[:roll1] + frame.scorecard.last[:roll2]).to eq 10
    end
  end

  describe '#second_roll' do
    it 'counts pinfall for frame' do
      frame.first_roll(4)
      frame.second_roll(4)
      expect(frame.scorecard.last[:roll1] + frame.scorecard.last[:roll2]).to eq 8
    end
  end

end
