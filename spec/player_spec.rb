require 'player'

describe Player do
  let(:points) { double('points', :update_roll => true) }

  before :each do
    @player = Player.new('John Smith')
  end

  describe '#initialize' do
    it 'records players name and their current frame' do
      expect(@player.name).to eq 'John Smith'
      expect(@player.current_frame).to eq 1
    end
  end

  describe '#pins_knocked_down' do
    it 'sends a message to an instance of the points class to #update_roll' do
      expect(points).to receive(:update_roll)

      @player.pins_knocked_down(7, points)
    end
  end
end