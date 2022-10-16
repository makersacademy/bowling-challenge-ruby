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

        expect(@current_round.add_round_pins).to eq([[2, 6]])

        pins_knocked = 10
        @current_round.add_pins(pins_knocked)

        expect(@current_round.add_round_pins).to eq([[2, 6], [10]])
      end
  end
end