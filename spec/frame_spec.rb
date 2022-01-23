require 'frame'

describe Frame do
  it 'lets you input a score for a roll' do
    bowling = Frame.new
    expect(bowling.add_frame(3, 5)).to eq [3, 5]
  end
  
  it 'shows your total score' do
    bowling = Frame.new
    bowling.add_frame(3, 5)
    bowling.add_frame(3, 4)
    expect(bowling.calc_score).to eq 15
  end
end
