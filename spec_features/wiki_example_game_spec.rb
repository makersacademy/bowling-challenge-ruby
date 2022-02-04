require 'score_card'

describe ScoreCard do
  let(:sc) { described_class.new }

  describe 'Wiki Example Game' do
    it 'scores 133' do
      sc.enter_pins(1)
      sc.enter_pins(4)
      sc.enter_pins(4)
      sc.enter_pins(5)
      sc.enter_pins(6)
      sc.enter_pins(4)
      sc.enter_pins(5)
      sc.enter_pins(5)
      sc.enter_pins(10)
      sc.enter_pins(0)
      sc.enter_pins(1)
      sc.enter_pins(7)
      sc.enter_pins(3)
      sc.enter_pins(6)
      sc.enter_pins(4)
      sc.enter_pins(10)
      sc.enter_pins(2)
      sc.enter_pins(8)
      sc.enter_pins(6)

      expect(sc.calculate_score). to eq(133)
    end
  end
end