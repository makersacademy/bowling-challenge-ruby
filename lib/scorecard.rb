# frozen_string_literal: true

class Scorecard
  attr_reader :frame, :score, :strikes, :spare, :first_roll_score, :second_roll_score

  def initialize
    @frame = 1
    @score = 0
    @strikes = 0
    @spare = false
    @first_roll_score = 0
    @second_roll_score = 0
  end

  def controller
    until @frame == 11
      first_roll
      there_a_spare?
      @score += @first_roll_score
      second_roll
      @score += @second_roll_score
      end_of_frame
      @frame += 1
    end

    puts "Thank you for playing bowling! Your final score was #{@score}, Well done!"
  end

  def first_roll
    puts 'Enter your first roll score'
    @first_roll_score = gets.chomp.to_i
    strike?(@first_roll_score)
  end

  def second_roll
    if @first_roll_score != 10
      puts 'Enter your second roll score'
      @second_roll_score = gets.chomp.to_i
      spare?(@second_roll_score)
    end
  end

  def strike?(roll)
    @strikes += 1 if roll == 10
    puts 'SSSTRIKEE!!!' if @strikes.positive?
  end

  def spare?(roll)
    @spare = true if roll + @first_roll_score == 10
    puts 'Spare!' if @spare == true
  end

  def end_of_frame
    strike_calculator if @first_roll_score != 10
  end

  def there_a_spare?
    spare_calculator if @spare == true
  end

  def strike_calculator
    strike_score = (@first_roll_score + @second_roll_score)
    @score += strike_score + 10 if @strikes == 1
    @score += strike_score + 30 if @strikes == 2
    @score += strike_score + 50 if @strikes == 3
    @score += strike_score + 80 if @strikes == 4
    @score += strike_score + (((@strikes - 2) * 30) + 20) if @strikes > 4

    @strikes = 0
  end

  def spare_calculator
    @score += (10 + @first_roll_score)
    @spare = false
  end

  private

  attr_writer :frame, :score, :strikes, :spare, :first_roll_score, :second_roll_score
end
