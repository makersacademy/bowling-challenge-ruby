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



end