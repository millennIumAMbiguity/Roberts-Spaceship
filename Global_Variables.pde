ArrayList<Gameobject> scene = new ArrayList<Gameobject>();
ArrayList<Gameobject> ghostScene = new ArrayList<Gameobject>();

ArrayList<Star> starsInScene = new ArrayList<Star>();
Backdrop backdrop = new Backdrop();

DistanceConverter distConverter = new DistanceConverter();


Player player;

WaveController waveController;
boolean gameover;
long time;

float scrollSpeed = 0.5f;

Stats stats = new Stats();

int score;
float scoreScoll;
int distScore;
int dist;

boolean titleScreen = true;


//sounds
SoundFile explosion, hitDamage, hitHurt, laserShoot, powerup, music;