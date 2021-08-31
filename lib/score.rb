class Score
    attr_reader :score
   
   
    def initialize(rolls = [])
      @score = 0
      @rolls = []
    end
   
    def roll(pins)
     @rolls.push(pins)
    end
   
    def score_total
      @roll_i = 0
      10.times do
        if strike?(@roll_i)
          @score += strikeScore(@roll_i)
          print_scoreboard
          @roll_i += 1
        elsif spare?(@roll_i)
          @score += spareScore(@roll_i)
          print_scoreboard
          @roll_i += 2
        else
        @score += frameScore(@roll_i)
        print_scoreboard
        @roll_i += 2
        end
      end
      @score
    end
   
   
   
   
      def spare?(roll_i)
       @rolls[roll_i] + @rolls[roll_i + 1 ] == 10
      end
   
      def strike?(roll_i)
       @rolls[roll_i] == 10
      end
   
      def spareScore(roll_i)
       10 +  @rolls[roll_i + 2]
      end
   
      def strikeScore(roll_i)
       10 +  @rolls[roll_i + 1 ] + @rolls[roll_i + 2]
      end
   
      def frameScore(roll_i)
        @rolls[roll_i ] + @rolls[roll_i + 1 ]
      end
   
      def print_scoreboard
        print "\n"
        print "Frame #{@roll_i + 1}\n"
        print "Score so far #{@score}\n"
      end
    end