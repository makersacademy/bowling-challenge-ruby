const prompt = require("prompt-sync")({ sigint: true });

class Bowling {
  constructor(frames) {
    this.frames = frames;
  }

  isSpare(frame) {
    return frame.length >= 2 && frame[0] + frame[1] === 10;
  }

  isStrike(frame) {
    return frame[0] === 10;
  }

  strikeBonus(index) {
    const bonusFrame = this.frames[index + 1];
    if (this.isStrike(bonusFrame)) {
      if (index === 9) {
        return 10 + this.frames[index][1];
      } else {
        return 10 + bonusFrame[0] + this.frames[index + 2][0];
      }
    } else {
      return 10 + bonusFrame[0] + bonusFrame[1];
    }
  }

  spareBonus(index) {
    if (index === 9) {
      return 10 + this.frames[index][2];
    } else {
      return 10 + this.frames[index + 1][0];
    }
  }

  total() {
    let total = 0;
    this.frames.forEach((frame, index) => {
      if (this.isStrike(frame)) {
        total += this.strikeBonus(index);
      } else if (this.isSpare(frame)) {
        total += this.spareBonus(index);
      } else {
        total += frame[0] + frame[1];
      }
      console.log(`running total ${frame} ${index} ${total}`);
    });
    console.log(`final total ${total}`);
    return total;
  }

  runGame() {
    console.log("Welcome to 10 pin bowling!");
    this.makeFrames();
    console.log("Congratulations your total is:");
    console.log(this.total());
  }
}

module.exports = Bowling;
