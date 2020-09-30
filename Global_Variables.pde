ArrayList<Gameobject> scene = new ArrayList<Gameobject>();
ArrayList<Gameobject> ghostScene = new ArrayList<Gameobject>();

ArrayList<Star> starsInScene = new ArrayList<Star>();
Backdrop backdrop = new Backdrop();


Player player;

WaveController waveController;
boolean gameover;
long time;

float scrollSpeed = 0.5f;

int score;
int dist;