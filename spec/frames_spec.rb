require 'frames'

describe Frames do
  let(:frames) { Frames.new }

  it 'frames calls end game after 10 frame_rounds' do
    expect(frames).to receive(:end_game)
    10.times { frames.new_round }
  end

  it 'new_round calls new_roll if frame_rounds < 11' do
    expect(frames).to receive(:new_roll)
    frames.new_round
  end



end