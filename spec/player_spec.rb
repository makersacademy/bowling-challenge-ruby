require 'player'

describe Player do
  let(:points) { double('points', :update_roll => true, :current_score => true) }

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

    it 'returns the number of pins knocked doown if on roll 1' do
      expect(@player.pins_knocked_down(7, points)).to eq 7
    end

    it 'returns the current score at the end of each frame' do
      @player.pins_knocked_down(7, points)
      
      expect(points).to receive(:current_score)

      @player.pins_knocked_down(1, points)
    end
  end
end