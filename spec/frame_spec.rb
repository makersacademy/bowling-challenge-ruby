require 'frame'

RSpec.describe Frame do
  describe '#add_rolls' do
   it 'adds 2 rolls to rolls array' do
    frame = Frame.new('4', '5')
    frame.add_rolls
    expect(frame.frame_arr).to eq ['4', '5']
   end
  end
end