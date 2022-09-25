require 'frame'

RSpec.describe Frame do
  context "#score #throw_one #throw_two" do
    it "return default starting values before any balls are thrown" do
      frame = Frame.new
      expect(frame.score).to eq (0)
      expect(frame.throw_one).to eq (0)
      expect(frame.throw_two).to eq (0)
      expect(frame.throw_three).to eq (0)
    end
  end

  context "#update_score" do
    it "updates @score" do
      frame = Frame.new
      frame.update_score(5)
      expect(frame.score).to eq (5)
    end
  end

  context "#udpate_throw_one" do
    it "updates @throw_one" do
      frame = Frame.new
      expect(frame.update_throw_one(5)).to eq (5)
    end
  end

  context "#udpate_throw_two" do
    it "updates @throw_two" do
      frame = Frame.new
      expect(frame.update_throw_two(5)).to eq (5)
    end
  end

  context "#udpate_throw_three" do
    it "updates @throw_three" do
      frame = Frame.new
      expect(frame.update_throw_three(5)).to eq (5)
    end
  end  
end
