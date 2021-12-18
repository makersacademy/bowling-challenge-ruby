# frozen_string_literal: true

require 'points'

describe Points do
  let(:frame) { double('frame') }
  let(:points) { Points.new(frame) }

  describe '#initialize' do
    it 'sets up instance variables for the total score summation and a score breakdown per frame' do
      expect(points.total).to eq 0
      expect(points.frames).to be_an Array
      expect(points.frames.length).to eq 10
      expect(points.frames.first).to eq frame
    end
  end

  describe '#update_roll(current_frame, current_roll, pins_knocked_down)' do
    it 'sends a message to relevant frame instance to update roll score' do
      points.update_roll(1, 1, 4)
      
      expect(frame).to receive(:update_roll)
    end
  end
end
