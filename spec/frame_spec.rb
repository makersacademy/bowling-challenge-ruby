# frozen_string_literal: true

require './lib/frame'

describe Frame do
  subject(:frame) { described_class.new }

  describe '#frame_completed' do
    it 'shows a frame is completed' do
      frame.log_roll(6)
      frame.log_roll(3)
      expect(frame.frame_complete?).to be true
    end

    it 'shows a frame is not completed' do
      frame.log_roll(6)
      expect(frame.frame_complete?).to be false
    end

    it 'shows a frame complete after a strike' do
      frame.log_roll(10)
      expect(frame.frame_complete?).to be true
    end
  end

  describe "#sum_frame" do
    it "sums a frame" do
      frame.log_roll(6)
      frame.log_roll(3)
      expect(frame.sum_frame).to eq 9
    end
  end

  describe '#strike_frame?' do
    it 'shows a game as a strike frame' do
      frame.log_roll(10)
      expect(frame.strike_frame?).to be true
    end

    it 'shows a game is not a strike frame' do
      frame.log_roll(9)
      expect(frame.strike_frame?).to be false
    end

    it 'shows a game is not a strike frame after a spare' do
      frame.log_roll(9)
      frame.log_roll(1)
      expect(frame.strike_frame?).to be false
    end

    it 'shows a game is not a strike frame after an open frame ' do
      frame.log_roll(7)
      frame.log_roll(2)
      expect(frame.strike_frame?).to be false
    end
  end

  describe '#spare_frame?' do
    it 'shows a game as a spare frame' do
      frame.log_roll(1)
      frame.log_roll(9)
      expect(frame.spare_frame?).to be true
    end

    it 'shows a game is not a spare frame' do
      frame.log_roll(9)
      expect(frame.spare_frame?).to be false
    end

    it 'shows a game is not a spare frame after a strike' do
      frame.log_roll(10)
      expect(frame.spare_frame?).to be false
    end

    it 'shows a game is not a spare frame after an open frame' do
      frame.log_roll(7)
      frame.log_roll(1)
      expect(frame.spare_frame?).to be false
    end
  end

  context 'input validation' do
    it 'does not allow rolls less than 0' do
      expect { frame.log_roll(-1) }.to raise_error('Pins downed must be between 0 and 10')
    end

    it 'does not allow rolls greater than 10' do
      expect { frame.log_roll(-1) }.to raise_error('Pins downed must be between 0 and 10')
    end

    it 'does not allow rolls greater than what pins are left' do
      frame.log_roll(5)
      expect { frame.log_roll(6) }.to raise_error('Pins downed must be between 0 and 5')
    end

    it 'does not allow rolls greater than what pins are left, 3rd ball' do
      frame.log_roll(5)
      frame.log_roll(5)
      expect { frame.log_roll(11) }.to raise_error('Pins downed must be between 0 and 10')
    end

    it 'raises an error if the frame is completed and a roll is logged against the frame' do
      frame.log_roll(5)
      frame.log_roll(5)
      expect { frame.log_roll(5) }.to raise_error('Frame complete. Cannot roll again')
    end
  end
  describe '#log_roll' do
    context 'no rolls' do
      it 'there is no roll' do
        expect(frame.all_rolls).to be_empty
      end
    end

    context 'No bonuses' do
      it 'logs the first roll' do
        frame.log_roll(6)
        expect(frame.all_rolls).to eq [6]
      end

      it 'logs the second roll' do
        frame.log_roll(6)
        frame.log_roll(3)
        expect(frame.all_rolls).to eq [6,3]
      end
    end

    context 'With bonuses' do
      it 'scores a spare on the second roll if first roll zero' do
        frame.log_roll(0)
        frame.log_roll(10)
        expect(frame.all_rolls).to eq [0,10]
      end
    end
  end
end
