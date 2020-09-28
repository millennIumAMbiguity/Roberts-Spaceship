class Player extends Gameobject {

	long currentTime;
	float deltaTime;
	float time;

	PVector bulletSpeed = new PVector(0,-1);

	float playerSpeed = 8f;
	int size = 10;

	public Player(){

		collisionLayer = 1;
		objColor = color(0,255,0);
	}

	void move(){
		transform.velocity.x = mouseX - transform.position.x;
		transform.velocity.y = mouseY - transform.position.y;

		transform.velocity.limit(playerSpeed);
		transform.position.add(transform.velocity);
	}

	void fire(){
		new Bullet(1,bulletSpeed,transform.position);
	}

	
}