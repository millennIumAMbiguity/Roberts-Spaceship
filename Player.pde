class Player extends Gameobject {

	long currentTime;
	float deltaTime;
	float time;

	float playerSpeed = 8f;
	int size = 10;

	public Player(){
		addToScene();
		objColor = color(0,255,0);

	}

	void move(){
		transform.velocity.x = transform.position.x - mouseX;
		transform.velocity.y = transform.position.y - mouseY;

		transform.velocity.limit(playerSpeed);

		transform.position.add(transform.velocity);

	}

	
}