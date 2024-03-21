// 18.41088318824768s
// 1
//IEC 61131-3 Structured Text Program for Implementing Sign Function

//Declare Global Variables
var sign;

function setup() {
  createCanvas(400, 400);
  background(255);
  
  //Define Sign Function
  sign = function(x) {
    if (x > 0) {
      return "positive";
    } else if (x < 0) {
      return "negative";
    } else {
      return "zero";
    }
  };
}

function draw() {
  //Draw Rectangle
  fill(255, 0, 0);
  rect(10, 10, width - 20, height - 20);
  
  //Write Text
  textSize(32);
  textAlign(CENTER);
  fill(0);
  text("Sign: " + sign(-4), width/2, 50);
}