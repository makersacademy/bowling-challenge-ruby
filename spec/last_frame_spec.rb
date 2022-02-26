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
end
