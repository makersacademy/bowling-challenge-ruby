require_relative '../lib/frame'

context '#rolls/frame_score' do 
  it 'stores roll total as three' do 
    frame = Frame.new(1) 
    frame.first_roll = 1
    frame.second_roll = 2

    expect(frame.frame_score).to eq 3
  end 

  it 'stores roll total as ten' do 
    frame = Frame.new(1) 
    frame.first_roll = 4
    frame.second_roll = 6

    expect(frame.frame_score).to eq 10
  end
end 