class Bowling

  attr_reader :score

  def initialize
    @score = []
    @frame = 1
    @roll = 1
  end

  def enter_score(pins = [])
    raise 'Outside of Range' unless valid_score?(pins.reduce(:+))
    score << pins
    @roll = 2
  end

  def total_score
    "TOTAL: " + @score.reduce(:+).reduce(:+).to_s
  end

  def game
    until @frame == 11
      # @roll == 1
      puts "Enter how many pins you knocked down on your first roll:"
      first_roll = gets.chomp.to_i
      while valid_score?(first_roll) == false
        puts 'Outside of Range' 
        first_roll = gets.chomp.to_i
      end
      # @roll == 2
      if strike?(first_roll)
        enter_score([first_roll, 0])
      else
        puts "Enter how many pins you knocked down on your second roll:"
        second_roll = gets.chomp.to_i
        while valid_score?(first_roll + second_roll) == false
          puts 'Outside of Range' 
          second_roll = gets.chomp.to_i
        end
        enter_score([first_roll, second_roll])
      end
      print_score
      @frame += 1
    end
    total_score
  end

  def valid_score?(pins)
    (0..10).include? pins
  end

  def print_score
    print "{|"
    @score.each do |score|
      if strike?(score[0])
        print "[X, -]|"
      elsif spare?(score[0], score[1])
        print "[" + score[0].to_s + ", /]|"
      else
        print score.to_s + "|"
      end
    end
    print "}"
    puts ""
  end

  def strike?(roll)
    roll == 10
  end

  def spare?(first_roll, second_roll)
    first_roll + second_roll == 10
  end
end