require 'frames'

describe Frames do
  let(:frames) { Frames.new }

  it 'rounds are set to 1 when Frame is set up' do
    expect(frames.round).to eq 1
  end

  it 'frames calls end game if frame _ounds is >= 11' do
    expect(frames).to receive(:end_game)
    10.times { frames.new_round }
  end

  it 'new_round calls new_roll if frame_rounds < 11' do
    expect(frames).to receive(:new_roll)
    frames.new_round
  end

end