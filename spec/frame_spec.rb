require 'frame'

describe Frame do

  it 'stores the number of pins for a roll' do
    subject.add(5)
    expect(subject.pins).to eq([5])

    subject.add(4)
    expect(subject.pins).to eq([5, 4])
  end

  it 'knows if it is a strike' do
    subject.add(10)
    expect(subject.strike?).to eq true
    expect(subject.spare?).to eq false
  end

  it 'knows if it is a spare' do
    subject.add(6)
    expect(subject.spare?).to eq false
    expect(subject.strike?).to eq false

    subject.add(4)
    expect(subject.spare?).to eq true
    expect(subject.strike?).to eq false
  end

  it 'calculates the bonus for a spare as 1' do
    subject.add(6)
    subject.add(4)

    subject.calculate_bonus
    expect(subject.bonus_rolls).to eq(1)
  end

  it 'calculates the bonus for a strike as 2' do
    subject.add(10)

    subject.calculate_bonus
    expect(subject.bonus_rolls).to eq(2)
  end
  
  it 'knows if it is a complete frame' do # should this be separate tests?
    subject.add(3)
    expect(subject.complete?).to eq false

    subject.add(5)
    expect(subject.complete?).to eq true

    strike = described_class.new
    strike.add(10)
    expect(strike.complete?).to eq true

    spare = described_class.new
    spare.add(7)
    spare.add(3)
    expect(spare.complete?).to eq true
  end

  it 'calculates the total score for the frame' do
    expect(subject.total).to eq(0)
    subject.add(7)
    subject.add(2)

    subject.calculate_total
    expect(subject.total).to eq(9)
  end

  it 'can update the total by a specified amount' do
    expect { subject.update_total(5) }.to change { subject.total }.by(5)
  end

end
