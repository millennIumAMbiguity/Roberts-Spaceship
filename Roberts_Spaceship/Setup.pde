void setup()
{
  stroke(255);
  fill(127);
  noCursor();

  surface.setTitle("Roberts Spaceship");

  PFont font = createFont("PressStart2P.ttf",32,false);
  textFont(font);
  textSize(8);

  explosion   = new SoundFile(this, "Explosion.wav");
  hitDamage   = new SoundFile(this, "Hit_Damage.wav");
  hitHurt     = new SoundFile(this, "Hit_Hurt.wav");
  laserShoot  = new SoundFile(this, "Laser_Shoot.wav");
  powerup     = new SoundFile(this, "Powerup.wav");

  music       = new SoundFile(this, "CORE - Power ISO - dead feelings.wav");
  music.amp(0.7f);
  music.loop();

  time = millis();

  data.loadScore();
  player = new Player();
  waveController = new WaveController();
  ghostScene = new ArrayList<Gameobject>(scene);
  backdrop.setZones();
}