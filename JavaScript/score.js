class Score {
  constructor(frames) {
    this.frames = frames;
  }

  isSpare(frame) {
    return frame.length >= 2 && frame[0] + frame[1] === 10;
  }

  isStrike(frame) {
    return frame[0] === 10;
  }

  finalFrameBonus(frame) {
    if (frame[1] === 10) {
      return 30;
    } else if (this.isSpare(frame)) {
      return 10 + frame[2];
    } else {
      return frame[0] + frame[1];
    }
  }

  strikeBonus(index) {
    const bonusFrame = this.frames[index + 1];
    if (this.isStrike(bonusFrame)) {
      if (index == 8) {
        return 10 + bonusFrame[0] + bonusFrame[1];
      } else {
        return 10 + bonusFrame[0] + this.frames[index + 2][0];
      }
    } else {
      return 10 + bonusFrame[0] + bonusFrame[1];
    }
  }

  spareBonus(index) {
    return 10 + this.frames[index + 1][0];
  }

  total() {
    let total = 0;
    this.frames.forEach((frame, index) => {
      if (index === 9) {
        total += this.finalFrameBonus(frame);
      } else if (this.isStrike(frame)) {
        total += this.strikeBonus(index);
      } else if (this.isSpare(frame)) {
        total += this.spareBonus(index);
      } else {
        total += frame[0] + frame[1];
      }
    });
    return total;
  }
}

module.exports = Score;
