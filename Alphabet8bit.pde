import java.util.*;

int cols = 16;

int w, h;

PFont font; 

int fontsize = 15;

int offset_x;
int offset_y = fontsize;

ArrayList <PGraphics> pgs = new ArrayList<PGraphics>();

ArrayList <Character> chars = new ArrayList<Character>();

void setup () {
  size(512, 512);
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

  String ordered[] = ordered_alphabet.split("");
  String firstHalf = "";
  String secondHalf = "";
  int i = 0;
  for (String s : ordered) {
    if (i%2==0) {
      firstHalf+=s;
    } else {
      secondHalf+=s;
    }
    i++;
  }
  firstHalf = reverse(firstHalf);
  //secondHalf = reverse(secondHalf);

  ordered_alphabet = firstHalf + secondHalf;
  println("ordered_alphabet", ordered_alphabet);
  // println("secondHalf", secondHalf);

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

public static String reverse(String input){
    char[] in = input.toCharArray();
    int begin=0;
    int end=in.length-1;
    char temp;
    while(end>begin){
        temp = in[begin];
        in[begin]=in[end];
        in[end] = temp;
        end--;
        begin++;
    }
    return new String(in);
}