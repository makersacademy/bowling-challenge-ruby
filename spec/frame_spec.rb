require 'frame'

describe Frame do
  it 'prints its number' do
    io = double :io
    frame = Frame.new(1, io)
    expect(io).to receive(:puts).with("Frame 1")

    frame.print_number

  end
end


