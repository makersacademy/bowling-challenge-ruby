As a player
So that I know who is playing
I want to be able to put my name in

--As a player
So that I know how many frames I've played
I want to be able to count my frames--

As a player
So that I know how much each of my rolls are worth
I want to be able to keep track of my score

As a player
So that I know when I've rolled a strike (X), a spare (/) or if I've missed (-)
I want my scoreboard to reflect symbols instead of numbers

- Because I'm not getting this far I'm writing my code here so I don't forget

        def add_symbol
            strike? ? 'X' :
            spare?  ? "#{shots[0]}/" :
                  shots[0...2].join()
        end

As a player
So that I know how many pins are left in the frame
I want the frame to return number of pins

--As a player
So that I know that I have won after the 10th frame
I want to see a summary of the game--

As a player
So that I don't input the incorrect score
I want to make sure that only the remaining pins can be displayed

