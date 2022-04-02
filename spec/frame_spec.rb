require 'frame'

describe Frame do
  it "holds a roll" do
    subject.add_roll(2)
    expect(subject.rolls).to eq [2]
  end

  it "holds two rolls" do
    subject.add_roll(2)
    subject.add_roll(2)
    expect(subject.rolls).to eq [2,2]
  end
  
  it "returns false to complete? when empty" do
    expect(subject.complete?).to eq false
  end
  
  it "returns false to complete? when it holds one roll" do
    subject.add_roll(2)
    expect(subject.complete?).to eq false
  end

  it "returns true to complete? when it holds two rolls" do
    subject.add_roll(2)
    subject.add_roll(2)
    expect(subject.complete?).to eq true
  end

  it "strike returns false if the first roll is 4" do
    subject.add_roll(4)
    expect(subject.strike).to eq false
  end

  it "strike returns true if the first roll is 10" do
    subject.add_roll(10)
    expect(subject.strike).to eq true
  end

  it "spare returns false if the two rolls add up to 9" do
    subject.add_roll(5)
    subject.add_roll(4)
    expect(subject.spare).to eq false
  end

  it "spare returns true if the two rolls add up to 10" do
    subject.add_roll(5)
    subject.add_roll(5)
    expect(subject.spare).to eq true
  end

end