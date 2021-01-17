describe('Game', function(){
  
  var game;

  beforeEach(function(){
    game = new Game(); 
  });

 it('should return 0 for a gutter game', function() {
    rollMany(0, 20)
  expect(game.score).toEqual(0);
 });

 it('should return 20 for a singles game', function(){
   rollMany(1, 20)
   expect(game.score).toEqual(20);
 });

 it('should return a score for a spare', function(){
   game.roll(5);
   game.roll(5);
   game.roll(3);
   rollMany(0, 17)
   expect(game.score).toEqual(16)
 });

 it('should return the score for a strike', function(){
   game.roll(10);
   game.roll(1);
   game.roll(1);
   expect(game.score).toEqual(14)
 });

//  it('should return 300 for a perfect game', function(){
//    rollMany(12, 10)
//    expect(game.score).toEqual(300);
//  })

 function rollMany(pins, rolls) {
  for (let i = 0; i < 20; i++) {
    game.roll(pins);
 }
}
});