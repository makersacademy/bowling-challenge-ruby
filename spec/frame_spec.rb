require 'frame'

describe Frame do

  context "#current_roll_number" do
    it "Returns 1 on first roll" do
      expect(subject.current_roll_number).to eq(1)
    end

    it "Returns 2 on second roll" do
      subject.input_roll_score(1)
      expect(subject.current_roll_number).to eq(2)
    end

    it "Returns 3 on third roll" do
      subject.input_roll_score(1)
      subject.input_roll_score(9)
      expect(subject.current_roll_number).to eq(3)
    end
  end

  it "Calling .input_roll_score inputs a roll and advances the current roll" do
    subject.input_roll_score(4)
    expect(subject.current_roll_number).to eq(2)
    expect(subject.pins_knocked).to eq(4)
  end

  context "#strike?" do
    it "Returns false if not a strike" do
      subject.input_roll_score(3)
      subject.input_roll_score(3)
      expect(subject.strike?).to eq(false)
    end

    it "Returns true if a strike" do
      subject.input_roll_score(10)
      expect(subject.strike?).to eq(true)
    end
  end

  context "#spare?" do
    it "Returns false if not a spare or strike" do
      subject.input_roll_score(3)
      subject.input_roll_score(3)
      expect(subject.spare?).to eq(false)
    end

    it "Returns false if a strike" do
      subject.input_roll_score(10)
      expect(subject.spare?).to eq(false)
    end

    it "Returns true if a spare" do
      subject.input_roll_score(3)
      subject.input_roll_score(7)
      expect(subject.spare?).to eq(true)
    end
  end

  it "Will return the sum of the first two rolls when .points_for_strike called" do
    subject.input_roll_score(3)
    subject.input_roll_score(7)
    subject.input_roll_score(5)
    expect(subject.points_for_strike).to eq(10)
  end

  it "Will return the value of the first roll when .points_for_spare called" do
    subject.input_roll_score(3)
    subject.input_roll_score(7)
    subject.input_roll_score(5)
    expect(subject.points_for_spare).to eq(3)
  end

  it "Will add correctly to total_score when .add_score is called" do
    subject.add_score(10)
    expect(subject.total_score).to eq(10)
  end

end
