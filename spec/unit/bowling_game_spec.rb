require 'bowling_game'

describe BowlingGame do
  let(:game) { described_class.new }
  let(:frame) { double :frame }

  describe '#bowl' do
    it 'can begin a new frame' do
      allow(frame).to receive(:new).and_return(frame)
      expect(frame).to receive(:add_to_frame).with(5)
      game.bowl(5, frame)
    end

    it 'closes a frame when a strike is scored on first roll' do
      allow(frame).to receive(:new).and_return(frame)
      expect(frame).to receive(:add_to_frame).with(10)
      expect(frame).to receive(:add_to_frame).with(0)
      game.bowl(10, frame)
    end

    it 'closes a frame on the second roll' do
      allow(frame).to receive(:new).and_return(frame)
      expect(frame).to receive(:add_to_frame).with(2)
      expect(frame).to receive(:add_to_frame).with(3)
      game.bowl(2, frame)
      game.bowl(3, frame)
    end
    
    it 'will raise an error if the user tries to bowl after perfect game' do
      12.times { game.bowl(10) }
      expect { game.bowl(10) }.to raise_error("The game is over.")
    end

  end

  describe '#score' do
    it 'can check for strikes and spares' do
      allow(frame).to receive(:new).and_return(frame)
      allow(frame).to receive(:total).and_return(10)
      expect(frame).to receive(:add_to_frame).with(10)
      expect(frame).to receive(:add_to_frame).with(0)
      game.bowl(10, frame)
      expect(frame).to receive(:strike?)
      expect(frame).to receive(:spare?)
      game.score
    end
  end
end