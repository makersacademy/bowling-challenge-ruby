require './lib/frame'

describe '#roll' do
  it 'reduces the number of standing pins by pins knocked down' do
    expect(roll(10, 6)[:remaining_pins]).to eq 4
  end

  it 'outputs the score from the roll' do
    expect(roll(10, 6)[:score]).to eq 6
  end

  it 'raises an error if attempt to knock down more pins than are standing' do
    expect { roll(5, 7) }.to raise_error("Cannot knock down more pins than were standing")
  end
end