public class Wave extends Gameobject
{

	Enemy[] units = new Enemy[0];
	int wave;

	PVector[] enemyShape = new PVector[] {
		new PVector(-4,-4),
		new PVector(0,6),
		new PVector(4,-4),
		new PVector(0,-2),
	};

	boolean cleenWave = true;

	Wave(int wave) {
		collisionLayer = -1;
		this.wave = wave;

		position.x = sWidth/2;
		velocity.y = scrollSpeed;
	}

	void draw() {
		line(position.x - collisionSize, position.y, position.x + collisionSize, position.y);
		line(position.x, position.y - collisionSize, position.x, position.y+ collisionSize);
	}

	void outOfBounds(){}

	void collision(){}
	boolean collision(Gameobject obj) {
		return false;
	}

}