import java.util.*;

int cols = 16;

int w, h;

PFont font; 

int fontsize = 25;

int offset_x;
int offset_y = fontsize;

ArrayList <PGraphics> pgs = new ArrayList<PGraphics>();

ArrayList <Character> chars = new ArrayList<Character>();

void setup () {
  size(800, 800);
  w = width / cols;
  h = w;

  String letters[] = alphabet.split("");
  
  println("letters", letters.length);
  
  font = createFont("Arial Unicode MS",32,true);
  textFont(font);
  textSize(30);
  textAlign(CENTER);
  
  int index=0;
  
  for (String s : letters) {
    Character c = new Character(s);
    chars.add(c);
  }

  Collections.sort(chars, new CharComparator());

  String ordered_alphabet = "";
  for (Character c : chars) {
    ordered_alphabet += c.s;
  }
  println("ordered_alphabet", ordered_alphabet);

  int x = 0; 
  int y = 0;
  for (Character c : chars) {
    if (x>width-w) {
      x=0;
      y+=h;
    }
    c.display(x, y);
    x+=w;
  }

  saveFrame("alphabet.png");
}