describe Frame do
  subject(:frame) { described_class.new }

  describe '#first_roll' do
    it 'determines if a second roll is required' do
      expect(frame.first_roll(2)).to eq 'Player to roll again'
    end
  end

  describe '#first_roll' do
    it 'records a strike on the first roll' do
      expect(frame.first_roll(10)).to eq 'STRIKE! End of frame'
    end
  end
end
