require_relative '../lib/player'

describe Player do
  describe '#initialize' do
    it 'should initialize a new player instance' do
      expect(Player).to respond_to(:new)
      expect(Player.new).to be_a(Player)
    end
  end
end
