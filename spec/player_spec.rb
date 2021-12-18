require 'player'

describe Player do
  describe '#initialize' do
    it 'records players name and their current frame' do
      player = Player.new('John Smith')

      expect(player.name).to eq 'John Smith'
      expect(player.current_frame).to eq 1
    end
  end
end