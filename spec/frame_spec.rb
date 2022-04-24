require './lib/frame'

describe '#roll' do
  let(:user_input) { "5" }
  it 'reduces the number of standing pins by the user input of pins knocked down' do
    expect(roll(10, user_input)).to eq 5
  end
end