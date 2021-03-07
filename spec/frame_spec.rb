# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:frame) { Frame.new }
  it 'should have a score' do
    expect(frame).to respond_to :framescore
  end

  it 'should have roll_1, roll_2, and a bonus score' do
    expect(frame.framescore).to include(:roll_1)
    expect(frame.framescore).to include(:roll_2)
    expect(frame.framescore).to include(:bonus)
  end
end
