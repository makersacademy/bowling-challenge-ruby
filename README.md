
Bowling Challenge Ruby - Chuka Okoye-Ahaneku
==================

Current score and number or rolls instance variablea added, needs working on spare and frame counting. Currently all RSpec tests pass, need to add feature test as well in the future.

Class model below:
![Imgur](https://i.imgur.com/lNoyi9x.png)

How to run in irb:

```
bundle init
irb 
3.0.0 :001 > require './lib/bowling'
 => true 
3.0.0 :002 > score = BowlingScore.new
 => #<BowlingScore:0x00007f90edab06a0 @current_score=0, @number_of_rolls=0> ]
## Scoring a spare
3.0.0 :003 > score.hit(2)
 => nil 
3.0.0 :004 > score.hit(8)
 => "Spare!" 
```
