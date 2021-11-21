require_relative '../lib/frame'

describe Frame do
  describe 'turn1' do
    it 'accepts user input for their first turn count of pins' do
      allow($stdin).to receive(:gets).and_return('5')
      @t1p = $stdin.gets.chomp.to_i
        expect(@t1p).to eq(5)
    end
  end
end
