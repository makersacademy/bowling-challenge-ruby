require 'rules'

  describe Rules do

    include Rules

    let(:dummy_class) { Class.new { extend Rules } }
    let(:strike) { double(:strike, strike?: 10) }
    let(:spare) { double(:spare, spare?: 10) }
    let(:pins_hit) { double(:pins_hit, pins_hit?: 5) }
    let(:spare) { double(:spare, spare?: 10) }
    let(:gutter) { double(:gutter, gutter?: 0) }
    let(:both_throw) { double(:both_throw, both_throws: 7) }

    it 'defaults the number of pins to 10' do
      expect(pins_hit.pins_hit?).to eq 5
    end

    it 'strike is set as 10 pins being hit' do
      expect(strike.strike?).to eq 10
    end

    it 'spare is set at 10 pins being hit in total across two turns' do
      expect(spare.spare?).to eq 10
    end

    it 'moves to next frame if you roll a strike on' do
      expect(pins_hit.pins_hit?).to eq 5
    end

    it 'moves to next frame if you roll a strike on' do
      expect(gutter.gutter?).to eq 0
    end

    it 'moves to next frame if you roll a strike on' do
      expect(both_throw.both_throws).to eq 7
    end

    # Max Validation

    it 'checks if turn is invalid' do
      dummy_class.single_turn_valid(11)
      expect(dummy_class.single_turn_valid(11)).to eq false
    end

    it 'checks turn is valid' do
      dummy_class.single_turn_valid(5)
      expect(dummy_class.single_turn_valid(5)).to eq true
    end

    it 'checks max throw value' do
      expect(dummy_class.max_throw).to eq Rules::MAXIMUM_THROW
    end

    it 'checks max throw value' do
      expect(dummy_class.max_frames).to eq Rules::MAXIMUM_FRAMES
    end

    it 'checks max throw pins' do
      expect(dummy_class.max_pins).to eq Rules::MAXIMUM_PINS
    end
  end