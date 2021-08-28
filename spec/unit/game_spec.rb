require 'game'

describe Game do

  let(:roller) { double :roller }

  
  it 'allows the player to enter a roll' do
    expect(roller).to receive(:roll)
    subject.roll(7, roller)
  end

end
