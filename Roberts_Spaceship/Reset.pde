void reset() {
  startTime = millis();
  time = millis() - startTime;

  gameover = false;
  stats = new Stats();
  score = 0;
  data.loadScore();

  scene = new ArrayList<Gameobject>();

  player = new Player();
  ghostScene = new ArrayList<Gameobject>(scene);
  waveController = new WaveController();
  waveController.spawnNextWave = time+500;
}