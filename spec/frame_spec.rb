require 'frame'

context 'initially' do
  xit 'returns empty ball_1 score' do
    frame = Frame.new

    expect(frame.ball_1).to eq (0)
  end
end