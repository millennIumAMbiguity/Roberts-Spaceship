void setup()
{
  stroke(255);
  fill(127);

  new Player();
  scene = new ArrayList<Gameobject>(ghostScene);
}