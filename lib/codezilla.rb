# here are my methods for generating the scorecards.
# strike_or_spare?() and strike?() are used within final_score().
# they matter because a strike or spare triggers bonus pts.
# this file is required into testrun.rb

def strike_or_spare?(f)
  f.sum == 10 ? true : false
end

def strike?(f)
  f == [10,0] ? true : false
end

def final_score(bowls)
  total = 0
  for f in 0..9 do
  # for 9/10 fs, where bonuses act normally...
    if f < 9
      if strike_or_spare?(bowls[f])
        if strike?(bowls[f])
          if strike?(bowls[f+1]) && strike?(bowls[f+2])
            total += 30
          elsif strike?(bowls[f+1]) && !(strike?(bowls[f+2]))
            total += 20 + bowls[f+2][0]
          else #neighbour not a strike.
            total += 10 + bowls[f+1].sum
          end
        else #current f is a SPARE
          total += bowls[f].sum
          total += bowls[f+1][0]
        end
      else # f is neither strike nor spare.
        total += bowls[f].sum
      end
    elsif f == 9
      # last f has a potential 3rd bowl
      # (i.e an 11th f with length of 1)
      if bowls[9].sum >= 10 && bowls[9].sum <= 20
        total += bowls[9].sum
        total += bowls[10][0]
      else
        total += bowls[9].sum
      end
    end
  end
  total
end
