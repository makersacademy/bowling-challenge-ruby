require 'game'
require 'frame'

RSpec.describe "it runs the game" do
  
  it "returns the score for a gutter game" do
    frame_1 = Frame.new
    frame_1.add_ball(0)
    frame_1.add_ball(0)

    frame_2 = Frame.new
    frame_2.add_ball(0)
    frame_2.add_ball(0)

    frame_3 = Frame.new
    frame_3.add_ball(0)
    frame_3.add_ball(0)

    frame_4 = Frame.new
    frame_4.add_ball(0)
    frame_4.add_ball(0)

    frame_5 = Frame.new
    frame_5.add_ball(0)
    frame_5.add_ball(0)

    frame_6 = Frame.new
    frame_6.add_ball(0)
    frame_6.add_ball(0)

    frame_7 = Frame.new
    frame_7.add_ball(0)
    frame_7.add_ball(0)

    frame_8 = Frame.new
    frame_8.add_ball(0)
    frame_8.add_ball(0)

    frame_9 = Frame.new
    frame_9.add_ball(0)
    frame_9.add_ball(0)

    frame_10 = Frame.new
    frame_10.add_ball(0)
    frame_10.add_ball(0)

    game = Game.new
    game.add_frame(frame_1)
    game.add_frame(frame_2)
    game.add_frame(frame_3)
    game.add_frame(frame_4)
    game.add_frame(frame_5)
    game.add_frame(frame_6)
    game.add_frame(frame_7)
    game.add_frame(frame_8)
    game.add_frame(frame_9)
    game.add_frame(frame_10)

    expect(game.total_score).to eq 0
  end

  it "returns the score for a game with no strikes or spares" do
    frame_1 = Frame.new
    frame_1.add_ball(2)
    frame_1.add_ball(1)

    frame_2 = Frame.new
    frame_2.add_ball(3)
    frame_2.add_ball(2)

    frame_3 = Frame.new
    frame_3.add_ball(4)
    frame_3.add_ball(1)

    frame_4 = Frame.new
    frame_4.add_ball(2)
    frame_4.add_ball(4)

    frame_5 = Frame.new
    frame_5.add_ball(6)
    frame_5.add_ball(1)

    frame_6 = Frame.new
    frame_6.add_ball(4)
    frame_6.add_ball(3)

    frame_7 = Frame.new
    frame_7.add_ball(1)
    frame_7.add_ball(1)

    frame_8 = Frame.new
    frame_8.add_ball(0)
    frame_8.add_ball(3)

    frame_9 = Frame.new
    frame_9.add_ball(1)
    frame_9.add_ball(0)

    frame_10 = Frame.new
    frame_10.add_ball(5)
    frame_10.add_ball(3)

    game = Game.new
    game.add_frame(frame_1)
    game.add_frame(frame_2)
    game.add_frame(frame_3)
    game.add_frame(frame_4)
    game.add_frame(frame_5)
    game.add_frame(frame_6)
    game.add_frame(frame_7)
    game.add_frame(frame_8)
    game.add_frame(frame_9)
    game.add_frame(frame_10)

    expect(game.total_score).to eq 47
  end

  it "returns the score for a game with 2 strikes (not in 10th frame)" do
    frame_1 = Frame.new
    frame_1.add_ball(2)
    frame_1.add_ball(1)

    frame_2 = Frame.new
    frame_2.add_ball(3)
    frame_2.add_ball(2)

    frame_3 = Frame.new
    frame_3.add_ball(10)

    frame_4 = Frame.new
    frame_4.add_ball(2)
    frame_4.add_ball(4)

    frame_5 = Frame.new
    frame_5.add_ball(10)

    frame_6 = Frame.new
    frame_6.add_ball(4)
    frame_6.add_ball(3)

    frame_7 = Frame.new
    frame_7.add_ball(1)
    frame_7.add_ball(1)

    frame_8 = Frame.new
    frame_8.add_ball(0)
    frame_8.add_ball(3)

    frame_9 = Frame.new
    frame_9.add_ball(1)
    frame_9.add_ball(0)

    frame_10 = Frame.new
    frame_10.add_ball(5)
    frame_10.add_ball(3)

    game = Game.new
    game.add_frame(frame_1)
    game.add_frame(frame_2)
    game.add_frame(frame_3)
    game.add_frame(frame_4)
    game.add_frame(frame_5)
    game.add_frame(frame_6)
    game.add_frame(frame_7)
    game.add_frame(frame_8)
    game.add_frame(frame_9)
    game.add_frame(frame_10)

    expect(game.total_score).to eq 68
  end

  it "returns the score for a game with 2 spares (not in 10th frame)" do
    frame_1 = Frame.new
    frame_1.add_ball(2)
    frame_1.add_ball(1)

    frame_2 = Frame.new
    frame_2.add_ball(3)
    frame_2.add_ball(2)

    frame_3 = Frame.new
    frame_3.add_ball(5)
    frame_3.add_ball(5)

    frame_4 = Frame.new
    frame_4.add_ball(2)
    frame_4.add_ball(4)

    frame_5 = Frame.new
    frame_5.add_ball(3)
    frame_5.add_ball(7)

    frame_6 = Frame.new
    frame_6.add_ball(4)
    frame_6.add_ball(3)

    frame_7 = Frame.new
    frame_7.add_ball(1)
    frame_7.add_ball(1)

    frame_8 = Frame.new
    frame_8.add_ball(0)
    frame_8.add_ball(3)

    frame_9 = Frame.new
    frame_9.add_ball(1)
    frame_9.add_ball(0)

    frame_10 = Frame.new
    frame_10.add_ball(5)
    frame_10.add_ball(3)

    game = Game.new
    game.add_frame(frame_1)
    game.add_frame(frame_2)
    game.add_frame(frame_3)
    game.add_frame(frame_4)
    game.add_frame(frame_5)
    game.add_frame(frame_6)
    game.add_frame(frame_7)
    game.add_frame(frame_8)
    game.add_frame(frame_9)
    game.add_frame(frame_10)

    expect(game.total_score).to eq 61
  end

  it "returns the score for a game with 1 spare and 1 strike (not in 10th frame)" do
    frame_1 = Frame.new
    frame_1.add_ball(2)
    frame_1.add_ball(1)

    frame_2 = Frame.new
    frame_2.add_ball(3)
    frame_2.add_ball(2)

    frame_3 = Frame.new
    frame_3.add_ball(5)
    frame_3.add_ball(5)

    frame_4 = Frame.new
    frame_4.add_ball(10)

    frame_5 = Frame.new
    frame_5.add_ball(2)
    frame_5.add_ball(7)

    frame_6 = Frame.new
    frame_6.add_ball(4)
    frame_6.add_ball(3)

    frame_7 = Frame.new
    frame_7.add_ball(1)
    frame_7.add_ball(1)

    frame_8 = Frame.new
    frame_8.add_ball(0)
    frame_8.add_ball(3)

    frame_9 = Frame.new
    frame_9.add_ball(1)
    frame_9.add_ball(0)

    frame_10 = Frame.new
    frame_10.add_ball(5)
    frame_10.add_ball(3)

    game = Game.new
    game.add_frame(frame_1)
    game.add_frame(frame_2)
    game.add_frame(frame_3)
    game.add_frame(frame_4)
    game.add_frame(frame_5)
    game.add_frame(frame_6)
    game.add_frame(frame_7)
    game.add_frame(frame_8)
    game.add_frame(frame_9)
    game.add_frame(frame_10)

    expect(game.total_score).to eq 77
  end

  it "returns the score for a game with a strike in 10th frame" do
    frame_1 = Frame.new
    frame_1.add_ball(2)
    frame_1.add_ball(1)

    frame_2 = Frame.new
    frame_2.add_ball(3)
    frame_2.add_ball(2)

    frame_3 = Frame.new
    frame_3.add_ball(5)
    frame_3.add_ball(5)

    frame_4 = Frame.new
    frame_4.add_ball(10)

    frame_5 = Frame.new
    frame_5.add_ball(2)
    frame_5.add_ball(7)

    frame_6 = Frame.new
    frame_6.add_ball(4)
    frame_6.add_ball(3)

    frame_7 = Frame.new
    frame_7.add_ball(1)
    frame_7.add_ball(1)

    frame_8 = Frame.new
    frame_8.add_ball(0)
    frame_8.add_ball(3)

    frame_9 = Frame.new
    frame_9.add_ball(1)
    frame_9.add_ball(0)

    frame_10 = Frame.new
    frame_10.add_ball(10)
    frame_10.add_ball(3)
    frame_10.add_ball(3)

    game = Game.new
    game.add_frame(frame_1)
    game.add_frame(frame_2)
    game.add_frame(frame_3)
    game.add_frame(frame_4)
    game.add_frame(frame_5)
    game.add_frame(frame_6)
    game.add_frame(frame_7)
    game.add_frame(frame_8)
    game.add_frame(frame_9)
    game.add_frame(frame_10)

    expect(game.total_score).to eq 91
  end
end