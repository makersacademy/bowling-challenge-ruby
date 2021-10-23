require 'turn_manager'

describe TurnManager do
  let(:turns) { TurnManager.new }
  let(:frame_one) { TurnManager::STARTING_POINT }
  let(:frame_two) { TurnManager::STARTING_POINT + 1 }
  let(:strike) { 10 }

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
      turns.move(strike)
      expect(turns.frame).to eq frame_two
    end
  end

  describe '#final' do

  before(:each) { 9.times { turns.move(strike) } }
  let(:tipping_point) { 11 }

    it 'allows three strikes' do
      3.times { turns.final(strike) }
      expect(turns.frame).to eq tipping_point
    end

    it 'allows a strike and a spare' do
      turns.final(strike)
      turns.final(3)
      turns.final(7)
      expect(turns.frame).to eq tipping_point
    end

    it 'allows a spare and a strike' do
      turns.final(4)
      turns.final(6)
      turns.final(strike)
      expect(turns.frame).to eq tipping_point
    end

    it 'allows two normal moves' do
      turns.final(5)
      turns.final(3)
      expect(turns.frame).to eq tipping_point
    end

    it 'allows a strike and two normal moves' do
      turns.final(strike)
      turns.final(1)
      turns.final(2)
      expect(turns.frame).to eq tipping_point
    end
  end
end
