require "./lib/scorecard"
require "./lib/frame"

describe Scorecard do
  context "#initialize" do
    it "should have a board and a total score" do
      expect(subject.board).to be_an(Array)
    end
  end

  context "#add_frame" do
    it "should add a frame into the board" do
      expect { subject.add_frame(Frame.new([4, 5])) }.to change { subject.board.length }.by 1
    end
  end

  context "#spare_bonus" do
    it "should add the first roll of the next frame to the total of current frame" do
      frame_1 = Frame.new([4, 6])
      frame_2 = Frame.new([1, 7])
      subject.add_frame(frame_1)
      subject.add_frame(frame_2)
      expect { subject.spare_bonus(subject.board[0], subject.board[1]) }.to change { subject.board[0].frame_score }.by 1
    end
  end

  context "strike_bonus" do
    it "should add the sum of the next frame's rolls to the 10 obtained previously" do
      frame_3 = Frame.new([10, 0])
      frame_4 = Frame.new([1, 7])
      subject.add_frame(frame_3)
      subject.add_frame(frame_4)
      expect { subject.strike_bonus(frame_3, frame_4) }.to change { subject.board[0].frame_score }.by 8
    end
  end

  context "#double_strike_bonus" do
    it "should add the sum of the next frame's rolls to the 10 obtained previously" do
      frame_5 = Frame.new([10, 0])
      frame_6 = Frame.new([10, 0])
      frame_7 = Frame.new([1, 7])
      subject.add_frame(frame_5)
      subject.add_frame(frame_6)
      subject.add_frame(frame_7)
      expect { subject.double_strike_bonus(frame_5, frame_7) }.to change { subject.board[0].frame_score }.by 1
    end
  end

  context "#apply_bonus" do
    it "apply all the calculations for bonuses" do
      frame_8 = Frame.new([10, 0])
      frame_9 = Frame.new([10, 0])
      frame_10 = Frame.new([10, 0])
      subject.add_frame(frame_8)
      subject.add_frame(frame_9)
      subject.add_frame(frame_10)
      expect { subject.apply_bonus(frame_8) }.to change { subject.board[0].frame_score }.by 20
    end
  end

  context "#end_total" do
    it "should be able to calculate a perfect game" do
      10.times { subject.add_frame(Frame.new([10, 0])) }
      2.times { subject.board.last.knockdown(10) }
      p subject.board.last
      expect(subject.total_score).to eq 300
    end
  end
end
