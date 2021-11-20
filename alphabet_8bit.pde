import java.util.*;

int cols = 20;

int w, h;

PFont font; 

int fontsize;

int offset_x;
int offset_y = fontsize;

ArrayList <PGraphics> pgs = new ArrayList<PGraphics>();

ArrayList <Character> chars = new ArrayList<Character>();


void setup () {
  size(600, 600);
  w = width / cols;
  h = w;

  String letters[] = alphabet.split("");
  
  println("letters", letters.length);
  
  font = createFont("Arial Unicode MS",32,true);
  textFont(font);
  textSize(20);
  textAlign(CENTER);
  
  int index=0;
  
  for (String s : letters) {
    Character c = new Character(s);
    chars.add(c);
  }
}


void draw() {
  int x = 0; 
  int y = 0;
  for (Character c : chars) {
    c.display(x, y);
    x+=w;
    if (x>width) {
      x=0;
      y+=h;
    }
  }
}
