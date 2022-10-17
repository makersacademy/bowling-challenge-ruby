require_relative "../lib/round"

describe Round do
  before (:each) do
    @current_round = Round.new
  end

  describe "#add_pins" do
      it "adds the current roll's pins to the round_pins array" do
          pins_knocked = 1

          @current_round.add_pins(pins_knocked)

          pins_knocked = 4

          @current_round.add_pins(pins_knocked)

          expect(@current_round.round_pins).to eq([1, 4])
      end
    

      it "sets strike to true" do
        pins_knocked = 10
        @current_round.add_pins(pins_knocked)
    
        expect(@current_round.strike).to eq(true)
      end

      it "sets spare to true" do
        pins_knocked = 3
        @current_round.add_pins(pins_knocked)
        pins_knocked = 7
        @current_round.add_pins(pins_knocked)

        expect(@current_round.spare).to eq(true)
        expect(@current_round.strike).to eq(false)
      end
  end
end