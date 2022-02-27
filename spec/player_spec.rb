describe Player do
  subject(:player) { described_class.new }

  describe '#roll' do
    it 'provides a score between zero and ten' do
      expect(player.roll).to be_between(0, 10)
    end
  end
end
