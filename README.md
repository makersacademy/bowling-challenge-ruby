Bowling Challege
==================
Introduction
---------
The bowling game is playable on this site:

[https://protected-coast-07182.herokuapp.com/](https://protected-coast-07182.herokuapp.com/)

Approach
-------
1. I learned the scoring rules of bowling

2. Each frame has two boxes that hold scores.  Early on I decided to register strikes as '10' on the first box and '0' on the second.  This was done so I did not have to be concerned with empty or nil boxes.

3. I was inspired by this bowling website: [https://www.bowlinggenius.com/](https://www.bowlinggenius.com/)

4. Example irb commands would be like this:  
```
require './lib/frame.rb'
f = Frame.new
f.bowl(10)
f.bowl(10)
f.bowl(7)
```

5. Overall I am pleased with the results.  The code is not very readable, but it does work.


**Improvements that are possible**

* Prevent scores from being higher than 10 in each frame
* Clean up the code and make it more readable, following the SRP (single responsibility principle)
* Build relevant unit and feature tests


