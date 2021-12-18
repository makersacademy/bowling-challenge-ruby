# frozen_string_literal: true

require 'points'

describe Points do
  let(:frame) { double('frame', :update_roll => true) }
  let(:points) { Points.new(frame) }

  describe '#initialize' do
    it 'sets up instance variables for the total score summation and a score breakdown per frame' do
      expect(points.current_score).to eq 0
      expect(points.frames).to be_an Array
      expect(points.frames.length).to eq 10
      expect(points.frames.first).to eq frame
    end
  end

  describe '#update_roll(current_frame, current_roll, pins_knocked_down)' do
    it 'sends a message to relevant frame instance to update roll score' do      
      expect(frame).to receive(:update_roll)

      points.update_roll(1, 1, 4)
    end
  end

  describe '#update_total(score)' do
    it 'adds score for completed frame onto total score instance variable' do
      expect { points.update_total(9) }.to change { points.current_score }.from(0).to(9)
    end
  end
end
