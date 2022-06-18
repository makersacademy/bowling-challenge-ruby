require 'frame'

RSpec.describe Frame do
  it 'saves roll score' do
    frame = Frame.new(5, 3)
    expect(frame.first_roll).to eq 5
    expect(frame.second_roll).to eq 3
  end
end