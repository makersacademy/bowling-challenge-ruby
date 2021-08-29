
class Game
    attr_reader :player, :frame, :roll, :score, :count_next, :pins_rest , :list_boundaries, :message

    def initialize(player, pins_rest = 10, frame = 1, roll = 0, score = 0, count_next = 0)
      @player, @frame, @roll, @this_frame_count, @this_frame_bonus = capitalize_name(player), frame, roll, 0, 0
      @score, @count_next, @pins_rest, @this_roll_messg =  score, count_next, pins_rest, nil
      @list_boundaries = { pins_rest: 10, frame: 10, roll: 2, score: 300, count_next: 2 }
      check_initialize_arguments
    end

    def check_initialize_arguments
      @list_boundaries.each do |arg, max| 
        raise 'player has non-number ' << arg.to_s unless eval('@' << arg.to_s).is_a?(Integer) 
        raise 'player has negative ' << arg.to_s if eval('@' << arg.to_s) < 0 
        raise 'player has ' << arg.to_s << ' greater than ' << max.to_s if eval('@' << arg.to_s) > max 
      end
    end

    def register_pins(pins_number = 0)
      @pins_number = pins_number
      [chec_game_frame, check_pins_number]
      new_roll
      return 'Game ended. Well done #{@name}, you got: #{@score} points' if end_game?
      frame_count if count_roll?
      frame_bonus if bonus_roll?
      roll_messg
      future_bonus if ['Strike', 'Spare'].include?(@this_roll_messg)
      [left_pins, change_frame]
      puts this_roll_info.join(' ')
    end

    def new_roll
      @roll += 1
    end

    def end_game?
      if @frame == 10
        return true if @roll == 2 || @roll > 3
      end
      false 
    end

    def this_roll_info(this_roll_messg)
      @this_roll_messg.nil? ? (this_roll_messg = '') : (this_roll_messg = @this_roll_messg)
      this_roll_messg = 'Extra roll due to spare in 10th frame' if @frame == 10 && @roll == 3.1
      this_roll_messg = 'Extra roll due to strike in 10th frame' if @frame == 10 && [2.1, 3.2].include?(@roll)
      [@frame.to_s, @roll.to_i.to_s, @pins_number.to_s, see_score, this_roll_messg]
    end

    def see_score
      return @score if @change_frame == true || end_game?
      return ' '
    end

    def change_frame
      @change_frame = false
      @change_frame = new_frame if @frame < 10 && finished_frame_true?
    end

    def count_roll?
      return true if [1,2].include?(@roll)
      false
    end

    def bonus_roll?
      return true if @count_next > 0
      false
    end

    def new_frame
      @frame += 1
      @pins_rest, @roll, @this_frame_bonus, @this_frame_count = 10, 0, 0, 0
      true
    end

    def finished_frame_true?
      (@roll == 2 || @pins_rest == 0) ? true : false
    end

    def future_bonus
      @count_next = 2 if @this_roll_messg == 'Strike'
      @count_next = 1 if @this_roll_messg == 'Spare'
      @roll.to_f += 0.1 if @frame == 10
    end

    def left_pins
      @pins_rest = 10 - @pins_number
    end

    def roll_messg
      @this_roll_messg = nil
      @this_roll_messg = 'Strike' if @roll == 1 && @pins_number == 10
      @this_roll_messg = 'Spare' if @roll == 2 && @pins_number == @pins_rest
      @this_roll_messg = 'Bad luck' if @pins_number == 0
    end

    def frame_count
      @score += @pins_number
      @this_frame_count += @pins_number
    end

    def frame_bonus
      @score += @pins_number
      @count_next -= 1
      @this_frame_bonus += @pins_number
    end

    def chec_game_frame
      raise 'pins registration failed, game has ended' if @frame == 10 && @roll == 2 && @count_next == 0
      raise 'pins registration failed, game has ended' if @frame == 10 && @roll > 2
    end

    def check_pins_number
      raise 'pins registration failed, not a number' unless @pins_number.is_a?(Integer)
      raise 'pins registration failed, number smaller than 0' if @pins_number < 0
      raise 'pins registration failed, number greater than 10' if @pins_number > 10
      raise 'pins registration failed, number greater than rest of pins' if @pins_number > @pins_rest
    end

    def capitalize_name(name)
      name.split(' ').map{ |part|  part.downcase.capitalize }.join(' ')
    end

end
