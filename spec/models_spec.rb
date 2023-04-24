require 'models'

RSpec.describe ScoreCard do
  context "ScoreCard scores a perfect game" do
    it "returns a score of 300" do
      frame_1 = Frame.new(1, [10])
      frame_2 = Frame.new(2, [10])  
      frame_3 = Frame.new(3, [10])  
      frame_4 = Frame.new(4, [10])  
      frame_5 = Frame.new(5, [10])  
      frame_6 = Frame.new(6, [10])  
      frame_7 = Frame.new(7, [10])  
      frame_8 = Frame.new(8, [10])  
      frame_9 = Frame.new(9, [10])  
      frame_10 = Frame.new(10, [10,10,10])
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
      result = score_card.current_score
      expect(result).to eq 300
    end
  end
  context "ScoreCard scores Maker's example" do
    it "returns a score of 133" do
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
      result = score_card.current_score
      expect(result).to eq 133
    end
  end
  context "ScoreCard scores SGactive example" do
    it "returns a score of 187" do
      frame_1 = Frame.new(1, [10])
      frame_2 = Frame.new(2, [9, 1])  
      frame_3 = Frame.new(3, [5, 5])  
      frame_4 = Frame.new(4, [7, 2])  
      frame_5 = Frame.new(5, [10])  
      frame_6 = Frame.new(6, [10])  
      frame_7 = Frame.new(7, [10])  
      frame_8 = Frame.new(8, [9, 0])  
      frame_9 = Frame.new(9, [8, 2])  
      frame_10 = Frame.new(10, [9, 1, 10])
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
      result = score_card.current_score
      expect(result).to eq 187
    end
  end
  context "ScoreCard scores SGactive example with player not making last 9th frame strike/spare (no bonus)" do
    it "returns a score of 177" do
      frame_1 = Frame.new(1, [10])
      frame_2 = Frame.new(2, [9, 1])  
      frame_3 = Frame.new(3, [5, 5])  
      frame_4 = Frame.new(4, [7, 2])  
      frame_5 = Frame.new(5, [10])  
      frame_6 = Frame.new(6, [10])  
      frame_7 = Frame.new(7, [10])  
      frame_8 = Frame.new(8, [9, 0])  
      frame_9 = Frame.new(9, [8, 1])  
      frame_10 = Frame.new(10, [9, 1, 10])
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
      result = score_card.current_score
      expect(result).to eq 177
    end
  end
end