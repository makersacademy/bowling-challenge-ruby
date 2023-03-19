require 'player'

RSpec.describe Player do
  context 'player rolls,' do
    it 'knocks down 4 pins' do
      player = Player.new('Josh')
      expect(player.roll(4)).to eq 4
    end

    it 'knocks down 8 pins' do 
      player = Player.new('Josh')
      expect(player.roll(8)).to eq 8
    end
  end
end