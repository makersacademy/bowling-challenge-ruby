require 'game' 

describe Game do 
  it 'tracks rolls' do
    expect(subject.rolls).to eq []
  end
end
