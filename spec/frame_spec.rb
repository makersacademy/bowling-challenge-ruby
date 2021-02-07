require './lib/frame.rb'
describe Frame do 
  let (:test_frame) { Frame.new(1) }
  describe 'initialize' do 
    it 'knows which frame number it is' do 
      expect(test_frame.frame_number).to eq 1
    end 
  end 

  describe 'add_roll' do
    it 'will give you the score of two rolls in one frame' do 
      test_frame.add_roll(5)
      test_frame.add_roll(4)

      expect(test_frame.score[0]).to eq 5
      expect(test_frame.score[1]).to eq 4
    end  

    it "won't let you roll twice if you score a strike with your first roll" do 
      test_frame.add_roll(10)
      expect { test_frame.add_roll(5) }.to raise_error 'Frame complete'
    end 
  end 
end 