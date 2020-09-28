void setup()
{
  stroke(255);
  fill(127);

  time = millis();

  new Player();
  waveController = new WaveController();
  ghostScene = new ArrayList<Gameobject>(scene);
}