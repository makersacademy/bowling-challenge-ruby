Bowling Scoreboard app written in Ruby.

To install:
```
$ cd bowling-challenge-ruby
$ bundler
$ rspec --init
```

To use:
```
$ ruby lib/bowling_scoreboard.rb
```
Example input:
```
Frame 1
Enter roll 1 pinfall:
Input = "5"
Enter roll 2 pinfall:
Input = "4"
Frame 1
5 4
Score: 9
```
Example scorecard:
```
Frame 1
5 4
Score: 9
Frame 2
3 3
Score: 15
Frame 3
4 4
Score: 23
Frame 4
5 4
Score: 32
Frame 5
3 3
Score: 38
Frame 6
X
Score: 63
Frame 7
X
Score: 83
Frame 8
5 /
Score: 99
Frame 9
6 /
Score: 119
Frame 10
X X X
Score: 149
```