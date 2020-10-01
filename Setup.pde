void setup()
{
  stroke(255);
  fill(127);
  noCursor();

  PFont font = createFont("PressStart2P.ttf",32,false);
  textFont(font);
  textSize(8);

  explosion   = new SoundFile(this, "sounds\\Explosion.wav");
  hitDamage   = new SoundFile(this, "sounds\\Hit_Damage.wav");
  hitHurt     = new SoundFile(this, "sounds\\Hit_Hurt.wav");
  laserShoot  = new SoundFile(this, "sounds\\Laser_Shoot.wav");
  powerup     = new SoundFile(this, "sounds\\Powerup.wav");


  time = millis();

  player = new Player();
  waveController = new WaveController();
  ghostScene = new ArrayList<Gameobject>(scene);
  backdrop.setZones();
}