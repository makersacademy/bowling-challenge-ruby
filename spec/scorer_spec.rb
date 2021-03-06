# frozen_string_literal: true

require 'scorer'

describe Scorer do
  subject { described_class.new }
  
  let(:bowl) { double(:bowl, pins: 4) }
  let(:frame) { double(:frame, bowls: [bowl, bowl]) }
  let(:frames) { [frame, frame, frame, frame, frame, frame, frame, frame, frame, frame] }

  it 'totals up the score of the game' do
    expect(subject.calculate(frames: frames)).to eq 80
  end
end