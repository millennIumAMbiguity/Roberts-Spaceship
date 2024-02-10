ArrayList<Gameobject> scene = new ArrayList<Gameobject>();
ArrayList<Gameobject> ghostScene = new ArrayList<Gameobject>();

ArrayList<Star> starsInScene = new ArrayList<Star>();
Backdrop backdrop = new Backdrop();

DistanceConverter distConverter = new DistanceConverter();


Player player;

float screenScale = 1;
int sWidthHalf = sWidth / 2;
int sHeightHalf = sHeight / 2;

WaveController waveController;
boolean gameover;
long time;
long startTime;

float scrollSpeed = 0.5f;

Stats stats = new Stats();
Data data = new Data();

int score;
float scoreScoll;
int distScore;
int dist;

boolean titleScreen = true;


//sounds
SoundFile explosion, hitDamage, hitHurt, laserShoot, powerup, music;