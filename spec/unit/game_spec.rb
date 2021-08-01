# frozen_string_literal: true

require 'game'

describe Game do
  describe '.game_start' do
    it 'should create a new frame with the frame number as 1' do
      subject.game_start
      expect(subject.current_frame_number).to eq(1)
      expect(subject.current_frame).to be_instance_of(Frame)
    end
  end
end
