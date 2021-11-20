class Character {
  String s; 
  PGraphics my_pg;
  int brightness;
  Character(String _s) {
    s=_s;
    my_pg = create_box(s);
    brightness = get_brightness(my_pg);
  }
  
  PGraphics create_box (String s) {
    PGraphics pg;
    pg = createGraphics(w, h);
    pg.beginDraw();
    pg.background(0);
    pg.textAlign(CENTER);
    pg.textFont(font);
    pg.textSize(20);
    pg.stroke(255);
    pg.text(s, 0, 0, w, h); 
    pg.endDraw();
    return pg;
  }
  
  int get_brightness (PGraphics pg) {
    int _brightness = 0;
    pg.loadPixels();
    for (int i = 0; i < w*h; i++){
     brightness += brightness(pg.pixels[i]); 
    }
    return _brightness;
  }
  
  void display (int x, int y) {
    image(my_pg, x, y);
  }
}
