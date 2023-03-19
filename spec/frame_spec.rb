require 'frame'

RSpec.describe Frame do 
  it "adds the total roll score to the frame when 2 rolls" do 
    subject.add_roll(4)
    subject.add_roll(4)
    expect(subject.score).to eq 8
  end

  it "returns true if a strike" do 
    subject.add_roll(10)
    expect(subject.strike?).to eq true
  end

  it "returns true if a spare" do
   subject.add_roll(6)
   subject.add_roll(4)
   expect(subject.spare?).to eq true
  end

end