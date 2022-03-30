
class Game
    attr_reader :player, :frame, :roll, :score, :count_next, :pins_rest , :list_boundaries, :message

    def initialize(player, pins_rest = 10, frame = 1, roll = 0, score = 0, count_next = 0)
      @player, @frame, @roll, @this_roll_count, @this_roll_bonus = capitalize_name(player), frame, roll, 0, 0
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
      @pins_number, @this_roll_messg, @this_roll_count  = pins_number, nil, 0
      [check_game_frame, check_pins_number, set_new_roll]
      return if game_finished?
      run_game_roll
    end

    def run_game_roll
      puts [plus_bonus_on_top_of_bonus, plus_roll_count, plus_roll_bonus, 
      get_roll_messg, future_bonus?, pins_left, get_roll_data, 
      change_frame, @this_roll_data.join(' ')].last
      puts inform_game_ended if game_finished?(:before_roll)
    end

    def set_new_roll
      @roll += 1
      @this_roll_bonus = 0
      @this_roll_count = 0
    end

    def inform_game_ended(extra = '')
      extra = '. The Perfect Game!' if @score == 300 
      extra = '. Bad luck! the Gutter' if @score == 0 
      'Game finished ' << @player << ', you scored: ' << @score.to_s << ' points' << extra
    end

    def game_finished?(before_or_after_roll = :after_roll)
      before_or_after_roll == :before_roll ? end_at_roll = 2 : end_at_roll = 3
      return true if @frame == 10 && @roll == end_at_roll && @count_next < 1
      return true if @frame == 10 && @roll > end_at_roll
      false 
    end

    def get_roll_data
      @this_roll_messg.nil? ? (messg = '') : (messg = @this_roll_messg)
      messg = 'Extra roll due to spare in 10th frame' if extra_roll_spare?
      messg = 'Extra roll due to strike in 10th frame' if extra_roll_strike?
      @this_roll_data = [@frame.to_s, @roll.to_i.to_s, @pins_number.to_s, see_score, @this_roll_count, @this_roll_bonus, messg]
    end

    def extra_roll_strike?
      @frame == 10 && (@roll == 2 && @count_next == 1.1 || @roll == 3 && @count_next % 1 != 0)
    end

    def extra_roll_spare?
      @frame == 10 && @roll == 3 && @count_next % 1 == 0
    end

    def see_score
      @score 
    end

    def change_frame
      new_frame if @frame < 10 && finished_frame_true?
    end

    def count_roll?
      return true if @frame < 10 && [1,2].include?(@roll)
      return true if @frame == 10 && @roll == 1
      return true if @frame == 10 && @roll == 2 && @count_next != 2.1
      false
    end

    def bonus_roll?
      return true if @count_next >= 1
      false
    end

    def new_frame
      @frame += 1
      @pins_rest, @roll = 10, 0
      true
    end

    def finished_frame_true?
      (@roll == 2 || @pins_rest == 0) ? true : false
    end

    def future_bonus?
      return unless ['Strike', 'Spare'].include?(@this_roll_messg)
      @count_next = 2.1 if @this_roll_messg == 'Strike'
      @count_next = 1 if @this_roll_messg == 'Spare'
    end

    def pins_left
      @pins_rest = 10 - @pins_number if @roll == 1
      @pins_rest = 10 if @frame == 10 && @roll == 1 && @count_next == 2.1
      @pins_rest = 10 if @frame == 10 && @roll == 2 && @count_next > 1
    end

    def get_roll_messg
      @this_roll_messg = nil
      @this_roll_messg = 'Strike' if @roll == 1 && @pins_number == 10
      @this_roll_messg = 'Spare' if @roll == 2 && @pins_number == @pins_rest &&  @this_roll_count != 0
      @this_roll_messg = 'Bad luck' if @pins_number == 0
    end

    def plus_roll_count
      return unless count_roll?
      @score += @pins_number
      @this_roll_count = @pins_number
    end

    def plus_roll_bonus
      return unless bonus_roll?
      @score += @pins_number
      @count_next -= 1
      @this_roll_bonus = @pins_number
    end

    def plus_bonus_on_top_of_bonus
      return unless @count_next == 2.1 && @roll == 1 && @pins_number == 10
      @score += @pins_number
      @this_roll_bonus = @pins_number
    end

    def check_game_frame
      raise 'pins registration failed, game has ended' if @frame == 10 && @roll == 2 && @count_next == 0
      raise 'pins registration failed, game has ended' if @frame == 10 && @roll == 3
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


