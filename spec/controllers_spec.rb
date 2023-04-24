require 'controllers'

RSpec.describe Printer do
  context "Checking Printer.print" do
    it "puts the corrent score progression without messages (makers example)" do
      frame_1 = Frame.new(1, [1, 4])
      frame_2 = Frame.new(2, [4, 5])  
      frame_3 = Frame.new(3, [6, 4])  
      frame_4 = Frame.new(4, [5, 5])  
      frame_5 = Frame.new(5, [10])  
      frame_6 = Frame.new(6, [0, 1])  
      frame_7 = Frame.new(7, [7, 3])  
      frame_8 = Frame.new(8, [6, 4])  
      frame_9 = Frame.new(9, [10])  
      frame_10 = Frame.new(10, [2, 8, 6])
      score_card = ScoreCard.new
      score_card.add_frame(frame_1)
      score_card.add_frame(frame_2)
      score_card.add_frame(frame_3)
      score_card.add_frame(frame_4)
      score_card.add_frame(frame_5)
      score_card.add_frame(frame_6)
      score_card.add_frame(frame_7)
      score_card.add_frame(frame_8)
      score_card.add_frame(frame_9)
      score_card.add_frame(frame_10)
      printer = Printer.new
      output = StringIO.new
      printer.print
      #expect(output.string).to include "Frame 5 - You got a STRIKE!"
    end
  end
end