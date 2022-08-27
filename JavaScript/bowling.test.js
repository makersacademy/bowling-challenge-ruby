const Bowling = require("./bowling");

describe("Bowling", () => {
  // it("rolls a gutter game", () => {
  //   let frames = [];
  //   for (i = 0; i < 10; i++) {
  //     frames.push([0, 0]);
  //   }

  //   bowling = new Bowling(frames);

  //   expect(bowling.total()).toEqual(0);
  // });

  // it("rolls a score of 10", () => {
  //   let frames = [];
  //   for (i = 0; i < 10; i++) {
  //     frames.push([1, 0]);
  //   }

  //   bowling = new Bowling(frames);

  //   expect(bowling.total()).toEqual(10);
  // });

  // it("rolls a spare each frame with a bonus of 5 apart from the last roll", () => {
  //   let frames = [];
  //   for (i = 0; i < 9; i++) {
  //     frames.push([5, 5]);
  //   }
  //   frames.push([5, 4]);
  //   bowling = new Bowling(frames);

  //   expect(bowling.total()).toEqual(144);
  // });

  // it("rolls a spare each frame with a bonus of 5 for each roll", () => {
  //   let frames = [];
  //   for (i = 0; i < 9; i++) {
  //     frames.push([5, 5]);
  //   }
  //   frames.push([5, 5, 5]);

  //   bowling = new Bowling(frames);
  //   console.log(bowling);
  //   expect(bowling.total()).toEqual(150);
  // });

  // it("calculates a strike", () => {
  //   let frames = [];
  //   frames.push([10]);
  //   for (i = 0; i < 9; i++) {
  //     frames.push([1, 1]);
  //   }

  //   bowling = new Bowling(frames);

  //   expect(bowling.total()).toEqual(30);
  // });

  it("calculates a perfect game", () => {
    let frames = [];
    for (i = 0; i < 9; i++) {
      frames.push([10]);
    }
    frames.push([10, 10, 10]);

    bowling = new Bowling(frames);

    expect(bowling.total()).toEqual(300);
  });
});
