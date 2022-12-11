require 'game'
require 'frame'

RSpec.describe "it runs the game" do
  
  it "returns the score for a gutter game" do
    frame_1 = Frame.new
    frame_1.add(0)
    frame_1.add(0)

    frame_2 = Frame.new
    frame_2.add(0)
    frame_2.add(0)

    frame_3 = Frame.new
    frame_3.add(0)
    frame_3.add(0)

    frame_4 = Frame.new
    frame_4.add(0)
    frame_4.add(0)

    frame_5 = Frame.new
    frame_5.add(0)
    frame_5.add(0)

    frame_6 = Frame.new
    frame_6.add(0)
    frame_6.add(0)

    frame_7 = Frame.new
    frame_7.add(0)
    frame_7.add(0)

    frame_8 = Frame.new
    frame_8.add(0)
    frame_8.add(0)

    frame_9 = Frame.new
    frame_9.add(0)
    frame_9.add(0)

    frame_10 = Frame.new
    frame_10.add(0)
    frame_10.add(0)

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

  it "returns the score for a gutter game" do
    frame_1 = Frame.new
    frame_1.add(2)
    frame_1.add(1)

    frame_2 = Frame.new
    frame_2.add(3)
    frame_2.add(2)

    frame_3 = Frame.new
    frame_3.add(4)
    frame_3.add(1)

    frame_4 = Frame.new
    frame_4.add(2)
    frame_4.add(4)

    frame_5 = Frame.new
    frame_5.add(6)
    frame_5.add(1)

    frame_6 = Frame.new
    frame_6.add(4)
    frame_6.add(3)

    frame_7 = Frame.new
    frame_7.add(1)
    frame_7.add(1)

    frame_8 = Frame.new
    frame_8.add(0)
    frame_8.add(3)

    frame_9 = Frame.new
    frame_9.add(1)
    frame_9.add(0)

    frame_10 = Frame.new
    frame_10.add(5)
    frame_10.add(3)

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
end