require 'frame'
require 'game'

describe 'current Frame' do
  it 'starts the game with a frame number of 1' do
    frame = Frame.new
    expect(frame.current_frame).to eq 1
  end
end