require 'bowling'

describe Bowling do

  it "can roll a gutter game" do
    20.times {subject.hit(0)}
    expect(subject.score).to eq 0
  end

  it "can roll an all 4 game" do
    20.times {subject.hit(4)}
    expect(subject.score).to eq 80
  end

  it "can roll a spare" do
    2.times {subject.hit(5)}
    subject.hit(3)
    17.times {subject.hit(0)}
    expect(subject.score).to eq 16
  end

  it "can roll a strike" do
    subject.hit(10)
    subject.hit(3)
    subject.hit(2)
    16.times {subject.hit(0)}
    expect(subject.score).to eq 20
  end

  it "can roll a perfect game" do
    12.times {subject.hit(10)}
    expect(subject.score).to eq 300
  end

  it "can roll all spares" do
    21.times {subject.hit(5)}
    expect(subject.score).to eq 150
  end

end