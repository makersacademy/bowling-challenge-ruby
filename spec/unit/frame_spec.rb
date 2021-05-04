# frozen_string_literal: true

require "./lib/frame"

describe Frame do
  context "#initialize" do
    it "should have at least 2 throws, a bonus and score" do
      expect(subject.rolls).to be_an(Array)
    end
  end

  context "#knockdown" do
    it "should add hits to the rolls array" do
      expect { subject.knockdown(4) }.to change { subject.rolls.length }.by 1
      expect { subject.knockdown(4) }.to change { subject.rolls.sum }.by 4
    end
  end

  context "#strike?" do
    it "should return true if the first roll is a 10" do
      subject.rolls[0] = 10
      expect(subject.strike?).to be true
    end
  end

  context "#spare?" do
    it "should return true if the first 2 rolls add to 10" do
      subject.rolls[0] = 6
      subject.rolls[1] = 4
      expect(subject.spare?).to be true
    end
  end

  context "#add_bonus_points" do
    it "should add the bonus to the sum of rolls" do
      expect { subject.add_bonus_points(3) }.to change { subject.frame_score }.by 3
    end
  end
end
