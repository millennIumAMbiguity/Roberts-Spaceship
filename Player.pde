class Player extends Gameobject {

	PVector bulletSpeed = new PVector(0,-8f);

	float playerSpeed = 8f;

	long fireDelay = 200;
	long nextfire;

	public Player(){

		collisionLayer = 1;
		objColor = color(0,255,0);
	}

	void move(){
		velocity.x = mouseX - position.x;
		velocity.y = mouseY - position.y;

		velocity.limit(playerSpeed);
		position.add(velocity);
	}

	void action(){
		if (nextfire < time){
			nextfire = time + fireDelay;
			new Bullet(1,bulletSpeed,position.copy());
		}
	}

	
}