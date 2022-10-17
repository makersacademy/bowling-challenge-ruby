require_relative "../lib/frames"
require_relative "../lib/frame"


describe Frames do
  context "frame 1" do
    it "initializes" do
      frames = Frames.new
      frames.play
      expect(@score).to eq(7)
    end
  end
end
    
# #     xit "allows user to input their score and convert to integer" do
# #       @io = double :io
# #       expect(@io).to receive(:puts).with("Please enter your score")
# #       expect(@io).to receive(:gets).and_return(7)
# #       expect(@io).to receive(:gets).and_return(1)
# #       frames = Frames.new(@io, @total_score)
# #       frame1 = frames.frame_1(7,1)
# #       expect(frames).to eq("#<Frames:0x0000000106aa76c8 @io=#<Double :io>, @total_score=[7, 1]>")
# #     end
# #   end
