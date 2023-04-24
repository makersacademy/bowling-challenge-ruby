require 'roll'

RSpec.describe Roll do
  describe '#initialize' do
    it 'creates a new roll with a score' do
      roll = Roll.new(5)
      expect(roll.score).to eq(5)
    end
  end
end
