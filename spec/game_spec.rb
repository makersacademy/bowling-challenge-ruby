describe Game do
  subject(:game) { described_class.new }

  describe '#scorecard' do
    it 'prints the current scorecard' do
      expect(game.scorecard).to eq "Frame 1, roll 1, pins knocked down 4"
    end
  end
end
