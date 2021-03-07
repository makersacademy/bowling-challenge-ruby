require 'game'

describe Game do

  describe '#take_new_frame' do
    it 'adds new frame result to frames_finished ' do
      frame = double()
      allow(frame).to receive(:frame_result){[:roll_one => '5', :roll_two => '5']}
      game = Game.new(frame)
      game.take_new_frame
      expect(game.frames_finished).to eq [[:roll_one => '5', :roll_two => '5']]
    end
  end
  describe '#check_frame_for_strike' do
    it 'returns true if (strike) present in last added frame' do
      frame = double()
      allow(frame).to receive(:frame_result){[:roll_one => '10', :roll_two => nil]}
      game = Game.new(frame)
      game.take_new_frame
      expect(game.check_frame_for_strike).to eq true
    end
  end
  describe '#check_frame_for_spares' do
    it 'returns true if (spares) present in last added frame ' do
      frame = double()
      allow(frame).to receive(:frame_result){[:roll_one => '5', :roll_two => '5']}
      game = Game.new(frame)
      game.take_new_frame
      expect(game.check_frame_for_spares).to eq true
    end
  end





end
