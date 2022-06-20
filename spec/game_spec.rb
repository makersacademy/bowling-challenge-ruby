require 'game'


RSpec.describe Bowling, "#score" do
  it "shows player total score" do
    bowling = Bowling.new
    20.times {bowling.hit(4)}
    expect(bowling.total_score).to eq 80
  end
  it "shows player total score roll in frame 1 " do
    bowling = Bowling.new
    2.times {bowling.hit(1)}
    expect(bowling.total_score).to eq 2
  end
  it " show spare frame" do
    bowling = Bowling.new
    2.times {bowling.hit(5)}
    expect(bowling.spare_frame).to eq true
  end
  # it "show the player striked in the first frame" do
  #   bowling = Bowling.new(frame: 1, role: 1, pin_count: 1)
  #   bowling1 = Bowling.new(frame: 1, role: 2, pin_count: 4)
  #   expect(bowling1.total_score).to eq 5
  # end
  # it "show the second frame" do
  #   bowling = Bowling.new(frame: 2, role: 1, pin_count: 4)
  #   bowling1 = Bowling.new(frame: 2, role: 2, pin_count: 5)
  #   frame_2 = frame_1 + bowling.pin_count + bowling1.pin_count
  #   expect(frame_2).to eq 14
  # end 
end