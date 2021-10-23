require 'turn_manager'

describe TurnManager do
  let(:turns) { TurnManager.new }
  let(:frame_one) { TurnManager::STARTING_POINT }
  let(:frame_two) { TurnManager::STARTING_POINT + 1 }

  it 'starts a new frame' do
    frame_one = TurnManager::STARTING_POINT
    expect(turns.frame).to eq frame_one
  end

  describe '#move' do
    it 'allows two moves in a frame' do
      turns.move(5)
      expect(turns.frame).to eq frame_one
    end

    it 'ends the frame on a second move' do
      turns.move(3)
      turns.move(6)
      expect(turns.frame).to eq frame_two
    end

    it 'ends the frame on a strike' do
      turns.move(10)
      expect(turns.frame).to eq frame_two
    end

    it 'irb edge case' do
      turns.move(5)
      turns.move(5)
      turns.move(10)

      expect(turns.frame).to eq 3
    end
  end
end
