class BowlingGame
    def initialize
      @rolls = []
    end
    
    def roll pins
      @rolls.push pins
    end

    def score
      res = 0
      roll = 0
      10.times do
        if @rolls[roll] + @rolls[roll + 1] == 10
          res += @rolls[roll] + @rolls[roll + 1] + @rolls[roll + 2]
        else
          res += @rolls[roll] + @rolls[roll + 1]
        end
      roll += 2 
      end
      res
    
    end 
end

    
#     def score
#       result = 0
#       rollIndex = 0
#       10.times do
#         if @rolls[rollIndex] + @rolls[rollIndex + 1] == 10
#             result += @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
#             p result
#         else
#             result += @rolls[rollIndex] + @rolls[rollIndex + 1]
#         end
#         rollIndex += 2 
#       end
#       result
#     end
# end    
    #   def compute_score(frame, rolls)
    #     return 0 if frame > 10
    #     # return do_strike(frame, rolls) if strike?(rolls)
    #     # return do_spare(frame, rolls) if spare?(rolls)
    #     return do_regular_frame(frame, rolls)
    #   end
    
    #   def strike?(rolls)
    #     rolls[0] == 10
    #   end
    
    #   def spare?(rolls)
    #     rolls[0] + rolls[1] == 10
    #   end
    
    #   def do_strike(frame, rolls)
    #     10 + rolls[1] + rolls[2] + compute_score(frame + 1, rolls[1..-1])
    #   end
    
    #   def do_spare(frame, rolls)
    #     10 + rolls[2] + compute_score(frame + 1, rolls[2..-1])
    #   end
    
    #   def do_regular_frame(frame, rolls)
    #     rolls[0] + rolls[1] + compute_score(frame + 1, rolls[2..-1])
    #   end

