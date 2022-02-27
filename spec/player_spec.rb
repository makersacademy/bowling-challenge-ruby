# frozen_string_literal: true

require 'player'

describe Player do
  subject(:player) { described_class.new }
  player = Player.new(1, 'Donald Duck', [], 0)
  # let(:first_roll) { double :roll }

  describe '#set up a player"s scorecard' do
    it 'tests initialising a Players score card' do
      name = 'Donald Duck'
      frames = []
      player_total = 0
      expect(Player.new(1, name, frames, player_total)).to be_instance_of Player
    end
  end

  describe '#first roll, first frame' do
    it 'tests initialising a Players score card' do
      # roll1 = Roll.new(1,1,1)
      frame1 = Frame.new(1, 0, 0, 0, 0)
      player.bowl(frame1, 1)
      expect(frame1.roll_id).to eq 1
      expect(frame1.total_score).to eq 1
      expect(frame1.num_of_rolls).to eq 1
    end
  end

  describe '#second roll, first frame' do
    it 'tests initialising a Players score card' do
      # roll1 = Roll.new(1,1,1)
      frame1 = Frame.new(1, 1, 1, 1, 0)
      player.bowl(frame1, 4)
      expect(frame1.roll_id).to eq 2
      expect(frame1.total_score).to eq 5
      expect(frame1.num_of_rolls).to eq 2
    end
  end
end
