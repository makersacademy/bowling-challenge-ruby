# frozen_string_literal: true

require './lib/last_frame'

describe LastFrame do
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

    it 'shows a frame complete after a strike and 2 following rolls' do
      frame.log_roll(10)
      frame.log_roll(10)
      frame.log_roll(10)
      expect(frame.frame_complete?).to be true
    end

    it 'shows a frame not completed after a strike and 1 roll' do
      frame.log_roll(10)
      frame.log_roll(10)
      expect(frame.frame_complete?).to be false
    end

    it 'shows a frame not completed after a spare and 1 roll to go' do
      frame.log_roll(2)
      frame.log_roll(8)
      expect(frame.frame_complete?).to be false
    end

    it 'shows a frame  completed after a spare and final roll' do
      frame.log_roll(2)
      frame.log_roll(8)
      frame.log_roll(8)
      expect(frame.frame_complete?).to be true
    end
  end

  context 'Bonus rolls on last frame' do
    it 'scores two strikes on 2 rolls' do
      frame.log_roll(10)
      frame.log_roll(10)
      expect(frame.roll_score(1)).to eq 10
      expect(frame.roll_score(2)).to eq 10
      expect(frame.strike_frame?).to be true
    end

    it 'scores threes strikes on 3 rolls' do
      frame.log_roll(10)
      frame.log_roll(10)
      frame.log_roll(10)
      expect(frame.roll_score(1)).to eq 10
      expect(frame.roll_score(2)).to eq 10
      expect(frame.roll_score(3)).to eq 10
      expect(frame.strike_frame?).to be true
    end

    it 'scores spare and strikes over 3 rolls' do
      frame.log_roll(3)
      frame.log_roll(7)
      frame.log_roll(10)
      expect(frame.roll_score(1)).to eq 3
      expect(frame.roll_score(2)).to eq 7
      expect(frame.spare_frame?).to be true
      expect(frame.roll_score(3)).to eq 10
      expect(frame.spare_frame?).to be true
      expect(frame.strike_frame?).to be false
    end
  end

  context 'invalid input' do
    it 'raises an error if the frame is completed with a spare and a roll is logged against the frame' do
      frame.log_roll(5)
      frame.log_roll(5)
      frame.log_roll(5)
      expect { frame.log_roll(5) }.to raise_error('Frame complete. Cannot roll again')
    end

    it 'raises an error if the frame is completed with a strikeand a roll is logged against the frame' do
      frame.log_roll(10)
      frame.log_roll(5)
      frame.log_roll(5)
      expect { frame.log_roll(5) }.to raise_error('Frame complete. Cannot roll again')
    end

    it 'raises an error if the frame is completed and a roll is logged against the frame' do
      frame.log_roll(2)
      frame.log_roll(5)
      expect { frame.log_roll(5) }.to raise_error('Frame complete. Cannot roll again')
    end
  end
end
