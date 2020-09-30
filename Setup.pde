void setup()
{
  stroke(255);
  fill(127);
  noCursor();

  PFont font = createFont("PressStart2P.ttf",32,false);
  textFont(font);
  textSize(8);

  time = millis();

  player = new Player();
  waveController = new WaveController();
  ghostScene = new ArrayList<Gameobject>(scene);
  backdrop.setZones();
}