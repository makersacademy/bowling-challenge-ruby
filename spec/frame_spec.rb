require 'frame'

RSpec.describe Frame do
  context "single frame actions" do
    it "takes a blank frame and returns 0" do
      frame = Frame.new
      expect(frame.total).to eq 0
    end

    it "takes a frame with scores 4 & 5 and returns 9" do
      frame = Frame.new([4, 5])
      expect(frame.total).to eq 9
    end

    it "takes a frame with scores 10 & 0 and returns strike" do
      frame = Frame.new([10, 0])
      expect(frame.is_strike).to eq true
    end

    it "takes a frame with scores 10 & 0 and returns strike" do
      frame = Frame.new([10, 0])
      expect(frame.is_strike).to eq true
    end

    it "takes a frame with scores 6 & 6 and returns invalid frame" do
      frame = Frame.new([6, 6])
      expect(frame.is_valid).to eq false
    end

    it "takes a frame with scores 5 & 5 and returns spare" do
      frame = Frame.new([5, 5])
      expect(frame.is_spare).to eq true
    end

    it "takes 5 frames and checks all scores are valid" do
      scores = [[1,5], [6, 5], [10, 0], [9, 1], [3, 3]]
      results = []
      results_expected = [true, false, true, true, true]

      scores.each do |record|
        frame = Frame.new(record)
        results << frame.is_valid
      end

      expect(results).to eq results_expected
    end

    it "takes 5 frames and returns total of each frame" do
      scores = [[1,5], [5, 5], [10, 0], [9, 1], [3, 3]]
      results = []
      results_expected = [6, 10, 10, 10, 6]

      scores.each do |record|
        frame = Frame.new(record)
        results << frame.total
      end
    end
  end
end