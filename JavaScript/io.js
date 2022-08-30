const prompt = require("prompt-sync")({ sigint: true });
const Score = require("./score");

class Io {
  constructor() {
    this.frames = [];
  }

  runGame() {
    console.log("Welcome to 10 pin bowling!");
    console.log("Enter the number of pins knocked down");
    this.enterFrames();
    const score = new Score(this.frames);
    console.log(`Congratulations you scored: ${score.total()}`);
  }

  enterFrames() {
    for (let f = 0; f < 10; f++) {
      console.log(`Frame ${f + 1}`);
      console.log("---------------");
      console.log("frame: " + this.frames[f]);
      this.promptRolls();
      if (
        f === 9 &&
        (this.frames[f][0] + this.frames[f][1] === 10 ||
          this.frames[f][1] === 10)
      ) {
        this.finalFrame(f);
      }
      console.log("---------------");
      this.shoutScore(f);
      console.log(" ");
    }
  }

  promptRolls() {
    let roll1 = prompt("First roll: ");
    if (parseInt(roll1) > 10) {
      roll1 = prompt("There are only 10 pins... enter another number: ");
    }
    if (parseInt(roll1) === 10) {
      this.frames.push(10);
    } else {
      let roll2 = prompt("Second roll: ");
      if (parseInt(roll1) + parseInt(roll2) > 10) {
        roll2 = prompt("There are only 10 pins... enter another number: ");
      }
      this.frames.push([parseInt(roll1), parseInt(roll2)]);
    }
  }

  finalFrame(f) {
    let roll3 = prompt("Final roll: ");
    if (parseInt(roll3) > 10) {
      roll3 = prompt("There are only 10 pins... enter another number: ");
    }
    this.frames[f].push(parseInt(roll3));
  }

  shoutScore(f) {
    if (this.frames[f] === 10) {
      console.log("STRIKE!");
    } else if (this.frames[f][0] + this.frames[f][1] === 10) {
      console.log("SPARE!");
    } else {
      console.log(`You Scored: ${this.frames[f][0] + this.frames[f][1]}`);
    }
  }
}

// play = new Io();

// play.runGame();

module.exports = Io;
