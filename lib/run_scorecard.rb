require_relative 'bowling_scorecard'

class RunScorecard
  def initialize
    @scorecard = BowlingScorecard.new
    @end_game = false
  end

  def run_game
    until @end_game
      puts "\nEnter your roll...."
      score = choice_loop
      @end_game = true if score == "End Game"
      puts(@end_game ? "\nFinal Scorecard" : "\nCurrent Scorecard:")
      puts display_scorecard + "\n\n"
    end
  end

  def display_scorecard
    display = ["Frame |  1  |  2  | Frame-Score | Total-Score"]
    @scorecard.generate_scorecard_info.each do |frame_info|
      display << frame_row(frame_info)
    end
    fill_empty_rows(11 - display.length, display)
    display.join("\n")
  end

  private

  def choice_loop
    loop do
      score = @scorecard.enter_roll($stdin.gets.chomp)
      return score unless score.to_s.include?("Invalid score entered,")

      puts score
    end
  end

  def frame_row(frame_info)
    frame_info[:second_roll] = display_strike_spare(frame_info)
    sprintf(string_format(frame_info),
            { frame: "#{frame_info[:frame]}",
              first_roll: "#{frame_info[:first_roll]}",
              second_roll: "#{frame_info[:second_roll]}",
              third_roll: "#{frame_info[:third_roll]}",
              frame_score: "#{frame_info[:frame_score]} ",
              total_score: "#{frame_info[:total_score]}"
              })
  end

  def display_strike_spare(frame_info)
    return 'x' if frame_info[:second_roll].nil? and frame_info[:strike]
    return '/' if frame_info[:spare]

    frame_info[:second_roll]
  end

  def string_format(frame_info)
    "%<frame>-6s|%<first_roll>3s  |#{ten_fr_display_check(frame_info)}|" +
    "%<frame_score>8s     |%<total_score>7s     "
  end

  def ten_fr_display_check(frame_info)
    return "%<second_roll>-2s %<third_roll>2s" if frame_info[:frame] == 10

    "%<second_roll>3s  "
  end

  def fill_empty_rows(counter, display)
    counter = 11 - counter
    until counter > 10
      empty_row = sprintf('%<frame>-6s|     |     |             |            ', { frame: counter })
      display << empty_row
      counter += 1
    end
  end

end
