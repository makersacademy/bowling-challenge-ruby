# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:frame) { Frame.create([2, 5, 4])}
  let(:strike) { Frame.create([1, 10]) }
  let(:last_frame) { Frame.create([10, 9, 1, 6])}
  
  it '.create' do
    expect(frame).to be_a Hash
    expect(strike).to have_key :frame_number
    expect(strike).to have_value 10
    expect(last_frame.size).to eq 4
  end
end
