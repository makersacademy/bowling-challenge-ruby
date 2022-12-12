Bowling Scorecard Challenge
===

A Ruby implementation of a bowling scorecard program.

In this program, a full game of bowling (not including an extra throw in frame 10) can be input.
Once this is done a full scorecard can be printed to the screen.
This scorecard is formatted as a markdown table so it can easily be used online if required.

---

Running the project
===

To run this project, clone the repository and run
```bash
ruby app.rb
```

This will launch a small command line program in your terminal that allows the user to input _valid_ rolls in succession.
Once the input forms a complete game of bowling, the app will print the scorecard for that game to the terminal.

_Note this application is not test driven and merely serves as to illustrate the progam._

---

Technical details
===

This project is built upon 3 main classes:
 - `Frame` contains the logic for a single frame.
 This includes detection of strikes and spares, and the logic required to add bonuses from subsequesnt rolls to the score of frame.
 - `Game` contains an array of the 10 frames of the game.
 This class passes down rolls to the correct `Frame` instances and distributes strike / spare bonuses.
 - `ScoreCard` contains the logic to format and print out a full game of Bowling.
 It has a one-to-one relationship with the `Game` class.

---

Things to add
===

- Refactor individual frame output formatting by adding a `FrameFormatter` class.
This would likely require adding a frame number to the frame class, and might make keeping track of total scores difficult. 
- Implement frame 10 bonus roll behaviour.
- Allow for printing of the scorecard at any stage of the game, not just once it is completed.
- Make the scorecard graphical, for instance in a webpage.
- Allow several users to play as part of the same game.

---

Skills used in this project
===
- Design of multiple classes
- Single Responsibility Principle
- Test-Driven Development

Other skills:
- Following on from the group project done during week 5 of the course, I tried using a Trello board to organise my work.
- I also used branches and pull requests to practice using this workflow, although it doesn't offer many challenges when being used on a repo without collaborators.

---
\
This project was made as part of the [MakersAcademy](https://makers.tech/) course.