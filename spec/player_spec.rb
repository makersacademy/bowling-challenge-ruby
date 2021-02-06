require 'player'

describe Player do

  it "should have an array" do
    expect(subject.scores).to be_an Array
  end

  it "should use the scores array to store frames" do
    subject.frame(5, 5)
    expect(subject.scores).to include([5, 5])
  end

end
