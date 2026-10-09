// Milo Jones | 15 Sept | 2026 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
float l, r, result;
char op;
boolean left;
String displayVal;
boolean newEntry;

void setup() {
  size(310, 450);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ' ;
  left = true;
  newEntry = true;
  displayVal= "0.0";
  numButtons[0] = new Button(40, 360, 50, 45, '0');
  numButtons[1] = new Button(40, 305, 50, 45, '1');
  numButtons[2] = new Button(105, 305, 50, 45, '2');
  numButtons[3] = new Button(170, 305, 50, 45, '3');
  numButtons[4] = new Button(40, 250, 50, 45, '4');
  numButtons[5] = new Button(105, 250, 50, 45, '5');
  numButtons[6] = new Button(170, 250, 50, 45, '6');
  numButtons[7] = new Button(40, 195, 50, 45, '7');
  numButtons[8] = new Button(105, 195, 50, 45, '8');
  numButtons[9] = new Button(170, 195, 50, 45, '9');
  opButtons[0]  = new Button(40, 140, 50, 45, 'C');
  opButtons[1]  = new Button(105, 140, 50, 45, '±');
  opButtons[2]  = new Button(170, 140, 50, 45, '%');
  opButtons[3]  = new Button(235, 140, 50, 45, '÷');
  opButtons[4]  = new Button(235, 195, 50, 45, 'x');
  opButtons[5]  = new Button(235, 250, 50, 45, '-');
  opButtons[6]  = new Button(235, 305, 50, 45, '+');
  opButtons[7]  = new Button(105, 360, 50, 45, '.');
  opButtons[8]  = new Button(170, 360, 50, 45, '^');
  opButtons[9]  = new Button(235, 360, 50, 45, '=');
  opButtons[10] = new Button(72, 420, 115, 45, '√');
  opButtons[11] = new Button(202, 420, 115, 45, 'π');
}

void draw() {
  background(33);
  drawdisplay();

  for (int i =0; i<numButtons.length; i++) {
    textSize(20);
    numButtons [i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }

  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void drawdisplay() {
  rectMode(CENTER);
  fill(127);
  rect(width/2, 60, 300, 80);
  fill(255);
  textAlign(RIGHT);
  textSize(45);
  text(displayVal, width-40, 90);
}
void mouseReleased() {
  // Update display with button clicked by user
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
    }
  }
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
    }


    // Display Variables
    println("L: " + l);
    println("R: " + r);
    println("Result: " + result);
    println("Left: " + left);
    println("Op: " + op);
  }
}


void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '^') {
    result = pow(l, r);
  }
  displayVal= str(result);
  left = !left;
  l = result;
}
void keyPressed() {
  println("keyCode: " + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent('1', true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent('2', true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent('3', true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent('4', true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent('5', true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent('6', true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent('7', true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent('8', true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent('9', true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent('0', true);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent('-', false);
  } else if (keyCode == 107) {
    handleEvent('+', false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent('÷', false);
  } else if (keyCode == 10) {
    handleEvent('=', false);
  } else if (keyCode == 106) {
    handleEvent('x', false);
  }
}
void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    // Do number stuff
    String digit = str(val);
    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    // Do operator stuff
    char clicked = val;

    if (clicked == '=') {
      performCalc();
    } else if (clicked == '+' || clicked == '-' ||
      clicked == 'x' || clicked == '÷' || clicked == '^') {
      op = clicked;
      left = !left;
      newEntry = true;
      displayVal = str(op);
    } else if (clicked == '±') {
      if (left == true) {
        l *= -1;
        displayVal = str(l);
      } else {
        r *= -1;
        displayVal = str(r);
      }
    } else if (clicked == 'C') {
      // reset all variables
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      displayVal = "0.0";
      left = true;
      newEntry = true;
    } else if (clicked == '√') {
      // square root of value in display
      if (left == true) {
        l = sqrt(l);
        displayVal = str(l);
      } else {
        r = sqrt(r);
        displayVal = str(r);
      }
    } else if (clicked == 'π') {
      if (left == true) {
        l = 3.14159265359;
        displayVal = str(l);
      }
    } else if (clicked == '.') {
      if (!displayVal.contains(".")) {
        displayVal+= ".";
      }
    }
  }
}
