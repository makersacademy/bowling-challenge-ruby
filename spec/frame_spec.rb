# frozen_string_literal: true

require 'frame'

describe Frame do

  let(:frame) { Frame.create([1, 2, 3]) }
  it '.create' do
    expect(frame).to be_a Hash
    expect(frame).to have_key :frame_number
  end
end
