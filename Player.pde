class Player extends Gameobject {

	long currentTime;
	float deltaTime;
	float time;

	float xMov = 0;
	float yMov = 0;
	float speed = 200f;

	float playerSpeed = 8f;

	PVector pos = new PVector();


	public Player(){

	}

	void move()
	{
		transform.velocity.x = transform.position.x - mouseX;
		transform.velocity.y = transform.position.y - mouseY;

		transform.velocity.limit(playerSpeed);

		transform.position.add(transform.velocity);

	}
}