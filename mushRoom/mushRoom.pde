  private PFont font;
  private String[] pitanja = null;
  private String[][] pitanjaOdgovori = null;
  private String[] medjuspremnik = null;
  private int redniBrojPitanja = -1;
  private boolean vrti = true;

  public void setup() {
    size(800,600); //TODO
    background(220);
    font = loadFont("AngsanaNew-Bold-48.vlw");
    textFont(font);
    pitanja = loadStrings("pitanja.txt");
    pitanjaOdgovori = new String[pitanja.length][5];
    for(int i=0 ; i<pitanja.length ; i++){
      medjuspremnik = parsePitanja(pitanja[i]);
      for(int j=0; j<5; j++){
        pitanjaOdgovori[i][j] = medjuspremnik[j];  // 0 pitanje, ostali indexi odgovori
      }
    }
    textAlign(CENTER, CENTER);
  }
  

  public void draw() {
    if(vrti){
      
      noStroke();
      fill(220);
      rect(80,50, 640, 150);
      
      fill(0);
      redniBrojPitanja = (int) random(pitanja.length);
      text(pitanjaOdgovori[redniBrojPitanja][(0)], 80, 50, 640, 150);
      
      for(int i=0; i<4; i++){
        button(i, pitanjaOdgovori[redniBrojPitanja][i+1]);  
      }
      vrti = false;
      
    }
    
    
    
  }
  
  private String[] parsePitanja(String mashPitanje){
    String[] odgIPitanja = mashPitanje.split("#");
    return odgIPitanja;
  }
  
  public void mouseReleased(){
    System.out.println(mouseX+", "+mouseY);
  }
  
  /**
   * plava, zuta, crvena, zelena
   */
  
  public void button(int n, String odgovor){
    switch(n){
    case 0:
      stroke(0,0,255);
      break;
    case 1:
      stroke(255,255,0);
      break;
    case 2:
      stroke(255,0,0);
      break;
    case 3:
      stroke(0,255,0);
      break;
    }
    
    strokeWeight(60);
    line(width/2-200, 260+n*80, width/2+200, 260+n*80);
    stroke(220);
    strokeWeight(52);
    line(width/2-200, 260+n*80, width/2+200, 260+n*80);
    
    /*noStroke();
    fill(0);
    rect(195, 235+n*80, 410, 52);
    */
    
    text(odgovor, 195, 235+n*80, 410, 52);
    
  }
  
  public void keyReleased(){
    vrti = true;
  }
  

