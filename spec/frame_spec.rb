require 'frame'

describe Frame do 
  it 'returns true if a frame is a strike' do 
    subject.bowl(10)
    expect(subject.strike?).to eq true 
  end 

  it 'returns true if a frame is a spare' do 
    subject.bowl(5)
    subject.bowl(5)
    expect(subject.spare?).to eq true 
  end 

  it 'keeps track of the number of hits in a frame' do 
    subject.bowl(5)
    subject.bowl(3)
    expect(subject.bowls[0]).to eq 5
    expect(subject.bowls[1]).to eq 3
  end 

end 
