require 'scorecount'

describe Scorecount do
  
  context '#count_points' do
    it 'counts and returns 0' do
      scorecount = Scorecount.new

      expect(scorecount.count_points).to eq 0
    end
  end

  context '#bonus_strike' do
    it 'adds the bonus for achieving a strike' do
      io = double :io
      frame = Frame.new
      scorecount = Scorecount.new    

      expect(io).to receive(:gets).and_return('10')
      expect
    end
  end

end