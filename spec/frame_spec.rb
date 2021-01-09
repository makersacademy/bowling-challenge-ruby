require 'frame.rb'

describe Frame do

  it "has a score which is initialized at zero" do
    expect(subject.score).to eq(0)
  end
  it "has a bonus_roll_count which is initialized at zero" do
    expect(subject.bonus_rolls).to eq(0)
  end

end
