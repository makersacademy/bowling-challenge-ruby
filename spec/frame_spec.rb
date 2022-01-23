# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:frame) { Frame.create([2, 5, 4]) }
  let(:strike) { Frame.create([1, 10]) }

  it '.create' do
    expect(frame).to be_a Hash
    expect(frame.size).to eq 3
    expect(strike).to have_key :frame_number
    expect(strike).to have_value 10
  end
end
