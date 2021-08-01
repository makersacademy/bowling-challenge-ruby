# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:subject) { Frame.new(frame: 1) }

  it 'knows which frame number it is' do
    expect(subject.frame).to eq(1)
  end

  it 'adds the 2 scores from the current frame' do
    first = subject.score.first_bowl(score: 4)
    second = subject.score.second_bowl(score: 3)
    expect(subject.frame_score(first, second)).to eq(7)
  end
end
