require './lib/frame'

describe '#roll' do
  let(:user_input) { "6" }
  it 'reduces the number of standing pins by the user input of pins knocked down' do
    expect(roll(10, user_input)[:remaining_pins]).to eq 4
  end

  it 'outputs the score from the roll' do
    expect(roll(10, user_input)[:score]).to eq 6
  end
end