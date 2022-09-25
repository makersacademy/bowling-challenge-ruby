require_relative "lib/round"

# To check if an integer has been entered (as a string)
class String
  def is_integer?
    self.to_i.to_s == self
  end
end

class Application
  def initialize(io)
    @io = io
    round1 = Round.new(1)
    round2 = Round.new(2)
    round3 = Round.new(3)
    round4 = Round.new(4)
    round5 = Round.new(5)
    round6 = Round.new(6)
    round7 = Round.new(7)
    round8 = Round.new(8)
    round9 = Round.new(9)
    round10 = Round.new(10)
    @rounds = [round1, round2, round3, round4, round5, round6, round7, round8, round9, round10]
  end

  def display_roll_and_round(roll_number, round_number)
    if roll_number == 1
      @io.puts "Round #{round_number}"
      @io.puts "First Roll:"
    elsif
      roll_number == 2
      @io.puts "Second Roll:"
    else
      @io.puts "Third Roll:"
    end
  end

  def get_roll
    # checks if roll is a numeral and a number from 0-10
    # user has to repeat input if not
    roll = ""
    while !(roll.is_integer? && roll.to_i < 11 && roll.to_i >= 0)
      roll = @io.gets.strip
    end
    return roll.to_i
  end

  def display_scorecard(round_number)
    @io.puts "Round - Roll 1 - Roll 2 - Roll 3 - Score"
    # only displaying the scored rounds
    scored_rounds = @rounds[0...round_number]
    scored_rounds.each do |round|
      @io.puts "  #{round.id}   -    #{round.roll1}   -    #{round.roll2}   -    #{round.roll3}   -   #{round.score}"
    end
  end

  def run
    previous_round_strike = false
    previous_round_spare = false
    second_bonus_roll_required = false

    # the index + 1 is the round number!
    @rounds.each_with_index do |round, index|
      display_roll_and_round(1, index + 1)
      round.roll1 = get_roll

      # Adding the bonus for previous round if they were strike or spare
      if previous_round_spare || previous_round_strike
        @rounds[index - 1].bonus = round.roll1
        @rounds[index - 1].calculate_score
        previous_round_spare = false
      end

      # If last two rounds were strikes we still need to add a bonus to the score two rounds ago
      if second_bonus_roll_required
        @rounds[index - 2].bonus += round.roll1
        @rounds[index - 2].calculate_score
        second_bonus_roll_required = false
      end

      # Strike!
      if round.roll1 == 10
        @io.puts "STRIKE!"
        # if we had a strike in the last round too we will need another bonus roll in the next round (because roll 2 doesn't get executed)
        if previous_round_strike == true
          second_bonus_roll_required = true
        end
        previous_round_strike = true
        # second roll is not executed
        round.roll2 = ""
      end

      # If first roll wasn't a strike (or it's the 10th round), user gets second roll
      if round.roll1 < 10 || index + 1 == 10
        display_roll_and_round(2, index + 1)
        round.roll2 = get_roll
        
        # in the rare event that user gets a strike and then a 0 in the 10th round, it is NOT a spare!
        if round.roll1 == 10 || round.roll1 + round.roll2 < 10
          previous_round_spare = false
        # Checking for spare
        elsif round.roll1 + round.roll2 == 10
          @io.puts "SPARE!"
          previous_round_spare = true
        end

        # Adding bonus for previous round if it was a strike (2nd bonus roll)
        if previous_round_strike
          @rounds[index - 1].bonus += round.roll2
          @rounds[index - 1].calculate_score
          # need to check again if there's not been a strike this round in roll1 (only possible in round 10)
          if round.roll1 != 10
            previous_round_strike = false
          end
        end
      end

      # if we are in 10th round and there has been a strike or spare in this round (recorded as previous_round_...) we get a 3rd roll
      if (index + 1) == 10 && (previous_round_strike || previous_round_spare)
        display_roll_and_round(3, index + 1)
        round.roll3 = get_roll
      end

      round.calculate_score
      display_scorecard(index + 1)
    end
  end
end

app = Application.new(Kernel)
app.run