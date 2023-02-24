
 # #if @rolls[roll_index] == 10 # Strike
       #   score_card += 10 + @rolls[roll_index + 1] + @rolls[roll_index + 2]
      #  roll_index += 1
      class GameRepository
        def initialize
          @rolls = []
        end
        
        def add(roll)
         @rolls << roll
        end
      
        def score_card
          #@rolls.sum
        
          roll_index = 0
          score = 0
           10.times do
            if strike roll_index)
              score += strikescore (roll_index)
              roll_index +=2
            elsif spare (roll_index)
              score += sparescore
              roll_index += 2
            else framescore     (roll_index)
              score += framescore
              roll_index += 2
         end
          roll_index += 2
           end
           score
          end
      
      
          def spare (roll_index)
            @rolls[roll_index] + @rolls[roll_index + 1] == 10
          end
      
          def Sparescore (roll_index)
            framescore(roll_index) + @rolls[roll_index + 1]
          end
          
          def game_end (roll_index)
            @rolls[roll_index] == 10
          end
      
          def strikescore (roll_index)
           framescore(roll_index) + @rolls[roll_index + 1] + @rolls[roll_index + 2]
          end
      
            def framescore (roll_index)
              @rolls[roll_index] + @rolls[roll_index + 1]
            end
      
      
        end