# frozen_string_literal: true

require './lib/frame'

describe Frame do
  let(:roll) { double(:roll) }
  let(:roll_class) { double(:roll_class, new: roll) }

  let(:frame) { described_class.new(roll_class) }

  describe '#create_roll' do
    it 'creates a new roll object whose frame is the object on which it is called' do
      expect(frame.create_roll).to eq roll
    end

    it 'add the roll to the list of rolls that make up its score' do
      roll = frame.create_roll
      expect(frame.scoring_rolls).to include roll
    end
  end

  describe '#get_roll_score' do
  end

  describe '#calculate_running_total' do
  end

  describe '#two_rolls_complete?' do
  end

  describe '#strike?' do
  end

  describe '#spare?' do
  end

  describe '#update_num_scoring_rolls' do
  end

  describe '#finish_frame' do
  end

  describe '#update_scoring_rolls' do
  end

  describe '#calc_frame_score' do
  end
end
