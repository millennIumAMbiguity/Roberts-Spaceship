void setup()
{
  stroke(255);
  fill(127);

  time = millis();

  new Player();
  ghostScene = new ArrayList<Gameobject>(scene);
}