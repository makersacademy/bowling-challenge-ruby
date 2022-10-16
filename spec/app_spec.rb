require_relative '../lib/app'

RSpec.describe Application do
  let(:io) { double :io }
  let(:app) { Application.new(io) }

  describe "#player_rolls" do
    it "Returns array with a score of 10 when strike" do
      expect(io).to receive(:puts).with("Roll 1:")
      expect(io).to receive(:gets).and_return("10")

      expect(app.add_user_scores([])).to eq [10]
    end

    it "Returns array with scores of 5 and 4" do
      expect(io).to receive(:puts).with("Roll 1:")
      expect(io).to receive(:gets).and_return("5")
      expect(io).to receive(:puts).with("Roll 2:")
      expect(io).to receive(:gets).and_return("4")

      expect(app.add_user_scores([])).to eq [5,4]
    end
  end
  
  describe "#bonus_points?" do
    it "Returns sum of the current frame if previous frame was strike" do
      result = app.bonus_points?([10], [3,4])
      expect(result).to eq 7
    end

    it "Returns the score of the first roll of current frame if previous frame was spare" do
      result = app.bonus_points?([6,4], [3,4])
      expect(result).to eq 3
    end

    it "Returns 0 if previous frame was neither stike nor spare" do
      result = app.bonus_points?([6,3], [3,4])
      expect(result).to eq 0
    end
  end

  describe "#play_first_nine_frames" do
    it "Returns array with scores for first 9 frames" do
      test_nine_rounds

      result = [[10],[2,3,5],[2,3,0],[3,7,0],[2,3,2],[10,0],[10,10],[2,8,10],[10,10],[]]

      app.play_first_nine_frames

      expect(app.frames).to eq result
    end
  end

  describe "#play_final_frame" do
    it "Returns 10,10,10 in the last sub-array if 3 strikes" do
      expect(io).to receive(:puts).with("Frame 10:")
      expect(io).to receive(:puts).with("Roll 1:")
      expect(io).to receive(:gets).and_return("10")
      expect(io).to receive(:puts).with("Roll 2:")
      expect(io).to receive(:gets).and_return("10")
      expect(io).to receive(:puts).with("Roll 3:")
      expect(io).to receive(:gets).and_return("10")

      result = [[],[],[],[],[],[],[],[],[],[10,10,10]]

      app.play_final_frame

      expect(app.frames).to eq result
    end

    it "Returns 2,8,5 in the last sub-array if spare" do
      expect(io).to receive(:puts).with("Frame 10:")
      expect(io).to receive(:puts).with("Roll 1:")
      expect(io).to receive(:gets).and_return("2")
      expect(io).to receive(:puts).with("Roll 2:")
      expect(io).to receive(:gets).and_return("8")
      expect(io).to receive(:puts).with("Roll 3:")
      expect(io).to receive(:gets).and_return("5")

      result = [[],[],[],[],[],[],[],[],[],[2,8,5]]
      
      app.play_final_frame

      expect(app.frames).to eq result
    end

    it "Returns 2,7 in the last sub-array if neither strike nor spare" do
      test_final_round

      result = [[],[],[],[],[],[],[],[],[],[2,7]]
      
      app.play_final_frame

      expect(app.frames).to eq result
    end
  end

  describe "full game" do 
    it "Returns correct final score" do
      test_nine_rounds
      test_final_round
      expect(io).to receive(:puts).with("Your final score is: 121")

      result = [[10],[2,3,5],[2,3,0],[3,7,0],[2,3,2],[10,0],[10,10],[2,8,10],[10,10],[2,7]]

      app.run

      expect(app.frames).to eq result
    end
  end

end

def test_nine_rounds
  expect(io).to receive(:puts).with("Frame 1:")
  expect(io).to receive(:puts).with("Roll 1:")
  expect(io).to receive(:gets).and_return("10")

  expect(io).to receive(:puts).with("Frame 2:")
  expect(io).to receive(:puts).with("Roll 1:")
  expect(io).to receive(:gets).and_return("2")
  expect(io).to receive(:puts).with("Roll 2:")
  expect(io).to receive(:gets).and_return("3")

  expect(io).to receive(:puts).with("Frame 3:")
  expect(io).to receive(:puts).with("Roll 1:")
  expect(io).to receive(:gets).and_return("2")
  expect(io).to receive(:puts).with("Roll 2:")
  expect(io).to receive(:gets).and_return("3")

  expect(io).to receive(:puts).with("Frame 4:")
  expect(io).to receive(:puts).with("Roll 1:")
  expect(io).to receive(:gets).and_return("3")
  expect(io).to receive(:puts).with("Roll 2:")
  expect(io).to receive(:gets).and_return("7")

  expect(io).to receive(:puts).with("Frame 5:")
  expect(io).to receive(:puts).with("Roll 1:")
  expect(io).to receive(:gets).and_return("2")
  expect(io).to receive(:puts).with("Roll 2:")
  expect(io).to receive(:gets).and_return("3")

  expect(io).to receive(:puts).with("Frame 6:")
  expect(io).to receive(:puts).with("Roll 1:")
  expect(io).to receive(:gets).and_return("10")

  expect(io).to receive(:puts).with("Frame 7:")
  expect(io).to receive(:puts).with("Roll 1:")
  expect(io).to receive(:gets).and_return("10")

  expect(io).to receive(:puts).with("Frame 8:")
  expect(io).to receive(:puts).with("Roll 1:")
  expect(io).to receive(:gets).and_return("2")
  expect(io).to receive(:puts).with("Roll 2:")
  expect(io).to receive(:gets).and_return("8")

  expect(io).to receive(:puts).with("Frame 9:")
  expect(io).to receive(:puts).with("Roll 1:")
  expect(io).to receive(:gets).and_return("10")
end

def test_final_round
  expect(io).to receive(:puts).with("Frame 10:")
  expect(io).to receive(:puts).with("Roll 1:")
  expect(io).to receive(:gets).and_return("2")
  expect(io).to receive(:puts).with("Roll 2:")
  expect(io).to receive(:gets).and_return("7")
end