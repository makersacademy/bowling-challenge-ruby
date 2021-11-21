require 'score'

describe Score do
  before do
    @score = Score.new
  end

  it 'expects a new Score to be on frame 1' do
    expect(@score.current_frame).to eq 1
  end

end