require "scorecard"

describe Scorecard do
  context "after first frame is over" do
    it "returns correct first frame score for non spare/strike rolls" do
      frames = [[3, 6]]
      scorecard = Scorecard.new(frames)
      expect(scorecard.current_frame_score(1)).to eq 9
    end

    it "returns correct first frame score for different non spare/strike rolls" do
      frames = [[1, 4]]
      scorecard = Scorecard.new(frames)
      expect(scorecard.current_frame_score(1)).to eq 5
    end

    it "returns correct first frame score after a spare" do
      frames = [[1, 9], [5, 8]]
      scorecard = Scorecard.new(frames)
      expect(scorecard.current_frame_score(1)).to eq 15
    end

    it "returns correct first frame score after a spare follwed by a strike" do
      frames = [[3, 7], [10]]
      scorecard = Scorecard.new(frames)
      expect(scorecard.current_frame_score(1)).to eq 20
    end

    it "returns correct score after a strike and a normal second frame" do
      frames = [[10], [2, 2]]
      scorecard = Scorecard.new(frames)
      expect(scorecard.current_frame_score(1)).to eq 14
    end

    it "returns correct score after a strike and a spare second frame" do
      frames = [[10], [8, 2]]
      scorecard = Scorecard.new(frames)
      expect(scorecard.current_frame_score(1)).to eq 20
    end

    it "returns correct score after a strike first frame, strike second frame and any third frame" do
      frames = [[10], [10], [9, 1]]
      scorecard = Scorecard.new(frames)
      expect(scorecard.current_frame_score(1)).to eq 29
    end
  end

  context "after second frame is over" do
    it "returns correct second frame score for normal rolls" do
      frames = [[10], [8, 1]]
      scorecard = Scorecard.new(frames)
      expect(scorecard.current_frame_score(2)).to eq 9
    end

    it "returns correct second frame score for spare" do
      frames = [[10], [9, 1], [7, 2]]
      scorecard = Scorecard.new(frames)
      expect(scorecard.current_frame_score(2)).to eq 17
    end

    it "returns correct second frame score after strike and normal third frame" do
      frames = [[10], [10], [7, 2]]
      scorecard = Scorecard.new(frames)
      expect(scorecard.current_frame_score(2)).to eq 19
    end

    it "returns correct second frame score after strike, followed by another strike and any fourth frame" do
      frames = [[5, 3], [10], [10], [9, 1]]
      scorecard = Scorecard.new(frames)
      expect(scorecard.current_frame_score(2)).to eq 29
    end
  end

  it "returns correct running total for first 8 frames of a game including normal rolls, spares and strikes" do
    frames = [[2, 8], [2, 7], [3, 2], [2, 0], [6, 4], [3, 1], [10], [10], [10], [8, 2, 2]]
    scorecard = Scorecard.new(frames)
    expect(scorecard.normal_running_total(1)).to eq 12
    expect(scorecard.normal_running_total(2)).to eq 21
    expect(scorecard.normal_running_total(3)).to eq 26
    expect(scorecard.normal_running_total(4)).to eq 28
    expect(scorecard.normal_running_total(5)).to eq 41
    expect(scorecard.normal_running_total(6)).to eq 45
    expect(scorecard.normal_running_total(7)).to eq 75
    expect(scorecard.normal_running_total(8)).to eq 103
  end

  it "returns correct ninth frame score" do
    frames = [[2, 8], [2, 7], [3, 2], [2, 0], [6, 4], [3, 1], [10], [10], [10], [8, 2, 2]]
    scorecard = Scorecard.new(frames)
    expect(scorecard.ninth_frame_score).to eq 20
  end

  it "returns correct running total at 9th frame for game including normal rolls, spares and strikes" do
    frames = [[2, 8], [2, 7], [3, 2], [2, 0], [6, 4], [3, 1], [10], [10], [10], [8, 2, 2]]
    scorecard = Scorecard.new(frames)
    expect(scorecard.normal_running_total(9)).to eq 123
  end

  it "returns correct running total at 10th frame for 3 strike final game" do
    frames = [[2, 8], [2, 7], [3, 2], [2, 0], [6, 4], [3, 1], [10], [10], [10], [10, 10, 10]]
    scorecard = Scorecard.new(frames)
    expect(scorecard.normal_running_total(10)).to eq 165
  end

  it "returns true for valid input" do
    frames = [[2, 8], [2, 7], [3, 2], [2, 0], [6, 4], [3, 1], [10], [10], [10], [10, 10, 10]]
    scorecard = Scorecard.new(frames)
    expect(scorecard.valid_input?).to eq true
  end

  it "returns error message when more than 10 frames are entered" do
    frames = [[2, 8], [2, 7], [3, 2], [2, 0], [6, 4], [3, 1], [10], [10], [10], [10, 10, 10], [9, 1], [10]]
    scorecard = Scorecard.new(frames)
    expect(scorecard.valid_input?).to eq false
  end

  it "returns error message when a negative number is included in a frame" do
    frames = [[2, 8], [2, 7], [3, 2], [2, 0], [6, 4], [3, 1], [10], [10], [-10], [10, 10, 10]]
    scorecard = Scorecard.new(frames)
    expect(scorecard.valid_input?).to eq false
  end

  it "returns error message when a roll gretaer than 10 is included in a frame" do
    frames = [[2, 8], [2, 7], [3, 2], [2, 0], [6, 4], [3, 1], [10], [10], [110], [10, 10, 10]]
    scorecard = Scorecard.new(frames)
    expect(scorecard.valid_input?).to eq false
  end

  it "returns error message when fifth frame sum is gretaer than 10" do
    frames = [[2, 8], [2, 7], [3, 2], [2, 0], [6, 5], [3, 1], [10], [10], [10], [10, 10, 10]]
    scorecard = Scorecard.new(frames)
    expect(scorecard.valid_input?).to eq false
  end

  it "returns nicely formatted scoreboard" do
    frames = [[10], [10], [9, 1], [9, 1], [10], [8, 1], [9, 0], [10], [10], [9, 1, 0]]
    scorecard = Scorecard.new(frames)
    expect(scorecard.final).to include("Frame 1 Roll(s): 10.\n TOTAL SCORE: 29")
    expect(scorecard.final).to include("Frame 9 Roll(s): 10.\n TOTAL SCORE: 174")
    expect(scorecard.final).to include("Frame 10 Roll(s): 9, 1, 0.\n TOTAL SCORE: 184")
  end
end
