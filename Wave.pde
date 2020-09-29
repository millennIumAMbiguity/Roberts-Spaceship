public class Wave extends Gameobject{

	Enemy[] units = new Enemy[0];
	int wave;

	boolean cleenWave = true;

	Wave(int wave) {
		collisionLayer = -1;
		this.wave = wave;

		position.x = width/2;
		velocity.y = scrollSpeed;
	}

	void draw() {
		stroke(objColor);
		line(position.x - collisionSize, position.y, position.x + collisionSize, position.y);
		line(position.x, position.y - collisionSize, position.x, position.y+ collisionSize);
	}

	void outOfBounds(){}

	void collision(){}
	boolean collision(Gameobject obj) {
		return false;
	}

}