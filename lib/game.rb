
class Game
    attr_reader :player, :frame, :roll, :score, :count_next, :pins_rest

    def initialize(player, pins_rest = 10, frame = 1, roll = 0, score = 0, count_next = 0)
      @player, @frame, @roll = player, frame, roll
      @score, @count_next, @pins_rest =  score, count_next, pins_rest
    end

    def register_pins(pins_number = 0)
      check_pins_number(pins_number)
      chec_game_frame
      'extra roll'
    end

    def chec_game_frame
      raise 'pins registration failed, game has ended' if @frame == 10 && @roll == 2 && @count_next == 0
      raise 'pins registration failed, game has ended' if @frame == 10 && @roll == 3
    end

    def check_pins_number(n)
      raise 'pins registration failed, not a number' unless n.is_a?(Integer)
      raise 'pins registration failed, number smaller than 0' if n < 0
      raise 'pins registration failed, number greater than 10' if n > 10
      raise 'pins registration failed, number greater than rest of pins' if n > @pins_rest
    end

end
