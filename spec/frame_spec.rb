require 'frame'

describe Frame do

  describe '.frame_result' do
    it 'returns result with both rolls containing a number after user input (no strike)' do
      frame = Frame.new
      input = double()
      allow(input).to receive(:get_input_roll_one) {'5'}
      allow(input).to receive(:get_input_roll_two) {'5'}
      expect(frame.frame_result(input)).to eq ([:roll_one => '5', :roll_two => '5'])
    end

    it 'returns result with first roll being 10 and second roll with nil when (strike)' do
      frame = Frame.new
      input = double()
      allow(input).to receive(:get_input_roll_one) {'10'}
      allow(input).to receive(:get_input_roll_two) {'1'}
      expect(frame.frame_result(input)).to eq ([:roll_one => '10', :roll_two => nil])
    end

  end
end
