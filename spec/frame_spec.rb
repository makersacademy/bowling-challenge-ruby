require 'frame'

describe Frame do
  before(:each) { Frame.class_variable_set :@@log, [] }

  it 'returns a score of 1 after entering one pin' do
    expect(Frame.fallen_pins(1)).to eq 1
  end

  it 'returns a score of 2 after entering one pin twice' do
    Frame.fallen_pins(1)
    expect(Frame.fallen_pins(1)).to eq 2
  end
end