class Player extends Gameobject {

	PVector bulletSpeed = new PVector(0,-1.5f);

	float playerSpeed = 8f;

	long fireDelay = 400;
	long nextfire;

	public Player(){

		hp = new Health(3, 1200);
		collisionLayer = 0;
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