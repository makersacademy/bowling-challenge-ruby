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
    end

  describe "#add_round_pins" do
    it "adds the round_pins to the game_pins array" do
      pins_knocked = 2
      @current_round.add_pins(pins_knocked)

      pins_knocked = 4
      @current_round.add_pins(pins_knocked)
      @current_round.add_round_pins

      expect(@current_round.game_pins).to eq([[2, 4]])
    end
  end

  describe "#strike" do
    it "sets strike to true" do
      pins_knocked = 10
      @current_round.add_pins(pins_knocked)
  
      expect(@current_round.strike).to eq(True)
    end
  end
end