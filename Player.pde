class Player extends Gameobject {

	PVector bulletSpeed = new PVector(0,-4f);

	float playerSpeed = 8f;

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
		new Bullet(1,bulletSpeed,position.copy());
	}

	
}