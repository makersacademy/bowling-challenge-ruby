describe Player do
  describe '#roll' do
    it 'provides a score between zero and ten' do
      player = Player.new
      expect(player.roll).to be_between(0, 10)
    end
  end
end
