# frozen_string_literal: true

require 'frame'
require 'stringio'
require 'input_helper'

describe Frame do
  let(:frame) { Frame.new(1) }

  describe '#run' do
    let(:input) { StringIO.new }

    it 'correctly records a strike' do
      $stdin = UserInput.input([10])
      frame.run
      expect(frame.strike?).to eq(true)
      expect(frame.spare?).to eq(false)
      expect(frame.total).to eq(10)
    end

    it 'correctly records a spare' do
      $stdin = UserInput.input([5, 5])
      frame.run
      expect(frame.strike?).to eq(false)
      expect(frame.spare?).to eq(true)
      expect(frame.total).to eq(10)
    end

    it 'correctly a not spare not strike score' do
      $stdin = UserInput.input([4, 3])
      frame.run
      expect(frame.strike?).to eq(false)
      expect(frame.spare?).to eq(false)
      expect(frame.total).to eq(7)
    end
  end
end
