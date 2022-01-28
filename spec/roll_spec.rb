require 'roll'

describe Roll do
  let(:roll) { Roll.new }
  describe '.roll' do
    it 'adds up the frame score when roll is called' do
      expect(roll.roll(6)).to eq 6
    end
    
    it 'adds up the frame score when roll has been  called twice' do
      roll.roll(6)
      expect(roll.roll(3)).to eq 9
    end
  end

  describe '.strike_or_spare' do
    it 'returns a strike' do
      roll.roll(10)
      expect(roll.strike_or_spare).to eq 'strike'
    end

    it 'returns a spare' do
      2.times { roll.roll(5) }
      expect(roll.strike_or_spare).to eq 'spare'
    end

    it 'returns nil' do
      roll.roll(2)
      expect(roll.strike_or_spare).to eq 'none'
    end
  end
end