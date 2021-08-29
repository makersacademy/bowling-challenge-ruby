# This is the 'vanilla' scorecard. It doesn't do anything fancy, 
# it has no classes, it just does what is asked for on the assignment

def game
    p 'welcome to bowling!'
    count = 0
    until count == 9
        count += 1
        round
    end
    last_round
    p 'congratulations you bowled a game!'
end


def round
    this_rounds_score = []
    p 'please enter your first score'
    first_bowl = gets.chomp().to_i
    if first_bowl == 10
        p 'STRIKE!!!'
        score(10,0)
    else 
        p 'please enter your second score'
        second_bowl = gets.chomp().to_i
        score(first_bowl, second_bowl)
    end
end

def score(x,y)
    running_score = []
    total_score = 0
    running_score.append([x,y])
    p running_score
    if running_score.length > 1
      if running_score[-2][0] == 10
        total_score += ((x+y) * 2)
      elsif running_score[-2].sum == 10
        puts 'would you look at that'
        total_score += x
        total_score += x + y
      else
        total_score += x + y
      end
    end
end

def last_round

p 'this is the last round'

end

game

