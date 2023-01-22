require './bowl'
RSpec.describe Bowl do
  context "calculate bowling score" do
    it 'returns 0 for Gutter game' do
      arr = Array.new(10, [0, 0])
      bowl = Bowl.new
      expect(bowl.score(arr)).to eq 0
    end
  
    it 'returns a score of 20 for all ones' do
      arr = Array.new(10, [1, 1])
      bowl = Bowl.new
      expect(bowl.score(arr)).to eq 20
    end
  
    it 'gives a score of 16 case one spare - 5, 5 and 3 pins then 0 for the next 17 rolls' do
      arr = [[5,5], [3,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
      bowl = Bowl.new
      expect(bowl.score(arr)).to eq 16
    end
  
    it 'gives a score of 24 case one strike - a strike, 3 and 4 pins then 0 for the next 16 rolls' do
      arr = [[10], [3,4], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
      bowl = Bowl.new
      expect(bowl.score(arr)).to eq 24
    end
  
    it 'gives a score of 24 case one strike - 0 for the first 16 roll, a strike, 3 and 4 pins' do
      arr = [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [10], [3,4]]
      bowl = Bowl.new
      expect(bowl.score(arr)).to eq 24
    end
  
    it 'gives a score of 60 case 3 strikes - 3 stikes, then 0 for the next 14 rolls' do
      arr = [[10],[10],[10],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
      bowl = Bowl.new
      expect(bowl.score(arr)).to eq 60
    end
  
    it 'gives a score of 90 case 4 strikes - 4 stikes, then 0 for the next 14 rolls' do
      arr = [[10],[10],[10],[10],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
      bowl = Bowl.new
      expect(bowl.score(arr)).to eq 90
    end
  
    it 'gives a score of 300 case perfect game - 12 strikes of 10' do
      arr = [[10], [10], [10], [10], [10], [10], [10], [10], [10], [10,10,10]]
      bowl = Bowl.new
      expect(bowl.score(arr)).to eq 300
    end
  end

  context "draw the result board" do
    it "draws board for gutter frame" do
      arr = Array.new(10, [0, 0])
      bowl = Bowl.new
      expect(bowl.draw_frame(arr[0])).to eq "0,0|"
    end

    it "draws an empty board for empty frame" do
      arr = []
      bowl = Bowl.new
      expect(bowl.draw_frame(arr)).to eq " , |"
    end

    it "draws board for strike frame" do
      arr = [[10], [3,4], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
      bowl = Bowl.new
      expect(bowl.draw_frame(arr[0])).to eq " X |"
    end

    it "draws board for frame" do
      arr = [[6,3], [3,4], [2,4], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
      bowl = Bowl.new
      expect(bowl.draw_frame(arr[0])).to eq "6,3|"
      expect(bowl.draw_frame(arr[1])).to eq "3,4|"
    end
    
    it "draws board for spare frame" do
      arr = [[8,2], [3,4], [5,5], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
      bowl = Bowl.new
      expect(bowl.draw_frame(arr[0])).to eq "8, / |"
      expect(bowl.draw_frame(arr[2])).to eq "5, / |"
    end
  end
end