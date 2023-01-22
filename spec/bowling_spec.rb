require "bowling"

RSpec.describe Bowling do
  context "given the number of pins knocked down in each roll" do
    it "returns the player's final score" do
      bowling = Bowling.new
      bowling.process_frame([1, 4])
      bowling.process_frame([4, 5])
      bowling.process_frame([6, 4])
      bowling.process_frame([5, 5])
      bowling.process_frame([10, 0])
      bowling.process_frame([0, 1])
      bowling.process_frame([7, 3])
      bowling.process_frame([6, 4])
      bowling.process_frame([10, 0])
      bowling.process_frame([2, 8, 6])
      expect(bowling.report_score).to eq "You scored 133 points!"
    end
  end

  context "given 12 strikes" do
    it "returns the player's final score with a perfect game message" do
      bowling = Bowling.new
      bowling.process_frame([10]) # 10 + 2*extra_throw = 30
      bowling.process_frame([10]) # 30 + 10 + 2*extra_throw = 60
      bowling.process_frame([10]) # 60 + 10 + 2*extra_throw = 90
      bowling.process_frame([10]) # 90 + 10 + 2*extra_throw = 120
      bowling.process_frame([10]) # 120 + 10 + 2*extra_throw = 150
      bowling.process_frame([10]) # 150 + 10 + 2*extra_throw = 180
      bowling.process_frame([10]) # 180 + 10 + 2*extra_throw = 210
      bowling.process_frame([10]) # 210 + 10 + 2*extra_throw = 240
      bowling.process_frame([10]) # 240 + 10 + 2*extra_throw = 270
      bowling.process_frame([10, 10]) # 270 + 10 + 10 1*extra_throw = 300
      expect(bowling.report_score).to eq "Congratulations on your perfect game! You scored 300 points!"
    end
  end

  context "given a gutter game" do
    it "returns the player's final score with a game over message" do
      bowling = Bowling.new
      bowling.process_frame([0, 0])
      bowling.process_frame([0, 0])
      bowling.process_frame([0, 0])
      bowling.process_frame([0, 0])
      bowling.process_frame([0, 0])
      bowling.process_frame([0, 0])
      bowling.process_frame([0, 0])
      bowling.process_frame([0, 0])
      bowling.process_frame([0, 0])
      bowling.process_frame([0, 0])
      expect(bowling.report_score).to eq "Game over, you scored 0 points."
    end
  end
  
  context "given more than 10 frames" do
    it "raises and error with a game over message" do
      bowling = Bowling.new
      bowling.current_frame(11)
      expect(bowling.report_score).to raise_error "Game over."
    end
  end  
end