require 'scorecard'

describe Scorecard do
  
  let(:frame) { double }
  let(:frames) { [frame] }
  let(:score) { [7] }
  let(:scores) { [score] }

  it 'retrieves frame data from each frame' do
    2.times { expect(frame).to receive(:frame_id) { 1 } }
    expect(frame).to receive(:roll_1) { 2 }
    expect(frame).to receive(:roll_2) { 3 }
    expect(frame).to receive(:roll_3) { nil }
    subject.scorecard(frames, scores)
  end

  it 'returns an output with total' do
    expected = "\nFrame: 1  | 2 | 3 | \nScore: 7\n\nTOTAL: 7\n"
    2.times { allow(frame).to receive(:frame_id) { 1 } }
    allow(frame).to receive(:roll_1) { 2 }
    allow(frame).to receive(:roll_2) { 3 }
    allow(frame).to receive(:roll_3) { nil }
    expect { subject.scorecard(frames, scores) }.to output(expected).to_stdout
  end
end
