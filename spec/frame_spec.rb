require 'frame'

describe Frame do 
  it 'allows users to add their pins score to their rolls' do 
    subject.roll(5)
    subject.roll(5)
    expect(subject.total).to eq 10
  end 
  #exception needs to be built for 10th frame
  it 'prevents user from rolling more than twice per frame' do 
    subject.roll(3)
    subject.roll(3) 
    expect { subject.roll(3) }.to raise_error "You only get two rolls per frame (unless on the 10th round)"
  end 
end 

