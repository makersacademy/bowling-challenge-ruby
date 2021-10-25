require_relative 'players'
require_relative 'scorecard'

class Bowling

  attr_reader :players, :scorecard

  def initialize
    @players = Players.new
    @scorecard = Scorecard.new
  end

  def start_game
    scorecard_entry
    finish_game
  end

  def scorecard_entry
    while @scorecard.frame_count < 11
      puts ''
      puts 'SCORECARD ENTRY'
      puts "Frame #{@scorecard.frame_count}"
      puts '----------'
      puts ''
      enter_frame_scores
      # @scorecard.bonus_pending
      @scorecard.bonus_calc
      @scorecard.frame_totals_calc
      @scorecard.print_current_frame
      puts "Total score: #{@scorecard.total_score}"
      @scorecard.frame_count_next
    end
  end

  def enter_frame_scores
    @players.names.each do |key, value|
      puts "#{value}'s (Player #{key}) first bowl:"
      puts "Please enter score"
      @scorecard.enter_roll1(gets.chomp.to_i)
      puts ''
      array_ref = @scorecard.frame_count - 1
      if @scorecard.current[array_ref][:roll1] < 10
        puts "#{value}'s (Player #{key}) second bowl:"
        puts 'Please enter score'
        @scorecard.enter_roll2(gets.chomp.to_i)
        puts ''
        if @scorecard.current[array_ref][:roll1] + @scorecard.current[array_ref][:roll2] == 10
          puts 'Spare!'
        end
      elsif @scorecard.current[array_ref][:roll1] == 10
        puts 'Strike!'
      end
      puts ''
    end
  end

  def finish_game
    puts 'Game complete!'
    puts @scorecard.current
    puts @scorecard_total_score
  end

  # def game_reset
  #   @scorecard.current_scorecard.delete
  #   @scorecard.frame_count = 1
  # end

end
