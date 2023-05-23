require 'frame'

RSpec.describe Frame do
  context 'Constructing a Frame Object' do
    it 'should create a normal Frame' do
      frame = Frame.new
      
      expect(frame.result(3, 5)).to eq [3, 5]
      expect(frame.final).to eq [3, 5]
    end

    it 'should construct a Stike Frame object' do
      frame = Frame.new

      expect(frame.result(10, 3)).to eq [10, 0]
      expect(frame.final).to eq [10, 0]
      expect(frame.strike?).to eq true
    end

    it 'should construct a Spare Frame object' do
      frame = Frame.new  
      frame_2 = Frame.new

      expect(frame.result(7, 3)).to eq [7, 3]
      expect(frame.final).to eq [7, 3]
      expect(frame.spare?).to eq true
      expect(frame_2.result(4, 6)).to eq [4, 6]
      expect(frame_2.final).to eq [4, 6]
      expect(frame_2.spare?).to eq true
    end
  end
end