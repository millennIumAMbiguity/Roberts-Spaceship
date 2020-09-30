void setup()
{
  stroke(255);
  fill(127);
  noCursor();

  time = millis();

  player = new Player();
  waveController = new WaveController();
  ghostScene = new ArrayList<Gameobject>(scene);
  backdrop.setZones();
}