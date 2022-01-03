class Bowling

  attr_reader :score

  def initialize
    @score = []
    @frame = 1
    @roll = 1
  end

  def enter_score(pins = [])
    # raise 'Outside of Range' unless valid_score?(pins.reduce(:+))
    @score << pins
    @roll = 2
  end

  def total_score
    "TOTAL: " + @score.reduce(:+).reduce(:+).to_s
  end

  def game
    until @frame == 10
      # @roll == 1
      puts "Enter how many pins you knocked down on your first roll:"
      first_roll = gets.chomp.to_i
      while valid_score?(first_roll) == false
        puts 'Outside of Range' 
        first_roll = gets.chomp.to_i
      end
      # @roll == 2
      if strike?(first_roll)
        enter_score([first_roll, 0, bonus_points(first_roll, 0)])
      else
        puts "Enter how many pins you knocked down on your second roll:"
        second_roll = gets.chomp.to_i
        while valid_score?(first_roll + second_roll) == false
          puts 'Outside of Range' 
          second_roll = gets.chomp.to_i
        end
        enter_score([first_roll, second_roll, bonus_points(first_roll, second_roll)])
      end
      print_score
      @frame += 1
    end
    # Now onto final frame
    puts "Enter how many pins you knocked down on your first roll:"
      first_roll = gets.chomp.to_i
      while valid_score?(first_roll) == false
        puts 'Outside of Range' 
        first_roll = gets.chomp.to_i
      end
      # @roll == 2
      if strike?(first_roll)
        puts "Enter how many pins you knocked down on your second roll:"
        second_roll = gets.chomp.to_i
        while valid_score?(second_roll) == false
          puts 'Outside of Range' 
          second_roll = gets.chomp.to_i
        end
        puts "Enter how many pins you knocked down on your third roll:"
        third_roll = gets.chomp.to_i
        while valid_score?(third_roll) == false
          puts 'Outside of Range' 
          third_roll = gets.chomp.to_i
        end
        enter_score([first_roll, second_roll, bonus_points(first_roll, second_roll)])
        enter_score([third_roll, bonus_points(second_roll, third_roll)])
        # if strike?(second_roll)
        #   puts "Enter how many pins you knocked down on your third roll:"
        #   third_roll = gets.chomp.to_i
        #   while valid_score?(third_roll) == false
        #     puts 'Outside of Range' 
        #     third_roll = gets.chomp.to_i
        #   end
        # else
        #   puts "Enter how many pins you knocked down on your third roll:"
        #   second_roll = gets.chomp.to_i
        #   while valid_score?(third_roll) == false
        #     puts 'Outside of Range' 
        #     third_roll = gets.chomp.to_i
        #   end
        #   enter_score([first_roll, second_roll, bonus_points(first_roll, second_roll)])
        # end
      else
        puts "Enter how many pins you knocked down on your second roll:"
        second_roll = gets.chomp.to_i
        while valid_score?(first_roll + second_roll) == false
          puts 'Outside of Range' 
          second_roll = gets.chomp.to_i
        end
        enter_score([first_roll, second_roll, bonus_points(first_roll, second_roll)])
      end
      print_score
      puts @score
      @frame += 1
    total_score
  end

  def valid_score?(pins)
    (0..10).include? pins
  end

  def print_score
    print "{|"
    @score.each do |score|
      if @frame == 10
        if strike?(score[0]) && strike?(score[1])
          print "[X, X]|"
        elsif strike?(score[0])
          print "[X, " + score[1].to_s + score[2].to_s + "]|"
        elsif spare?(score[0], score[1])
          print "[" + score[0].to_s + ", /," + score[2].to_s + "]|"
        else
          print score.to_s + "|"
        end
      else
        if strike?(score[0])
          print "[X, -, Bonus(from previous spare of strike): " + score[2].to_s + "]|"
        elsif spare?(score[0], score[1])
          print "[" + score[0].to_s + ", /, Bonus(from previous spare of strike): " + score[2].to_s + "]|"
        else
          print "[" + score[0].to_s + ", " + score[1].to_s + ", Bonus(from previous spare of strike): " + score[2].to_s + "]|"
        end
      end
    end
    print "}"
    puts ""
  end

  def strike?(first_roll)
    first_roll == 10
  end

  def spare?(first_roll, second_roll)
    first_roll + second_roll == 10
  end

  def bonus_points(first_roll, second_roll)
    if @frame == 1
      return 0
    end

    if strike?(@score.last[0])
      return first_roll + second_roll
    elsif spare?(@score.last[0], @score.last[1])
      return first_roll
    else
      return 0
    end
  end
end