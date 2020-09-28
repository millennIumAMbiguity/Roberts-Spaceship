public class Gameobject {

	Transform transform;
	PVector position;
	PVector velocity;

	float collisionSize;
	int id;
	int objColor;

	int collisionLayer;
	/*
	0: player;
	1: player bullets;
	2: enemys and enemys bullets;
	*/

	Gameobject() {
		addToScene();
		transform = new Transform();
		position = transform.position;
		velocity = transform.velocity;
		collisionSize = 8;
		objColor = color(255);
	}

	void addToScene() {
		id = scene.size();
		scene.add(this);
	}

	void removeFromScene() {
		scene.remove(id);
	}

	void draw() {
		fill(objColor);
		ellipse(position.x, position.y, collisionSize, collisionSize);
	}

	void move() {
		position.add(velocity);
	}

	void outOfBounds(){
		if (collisionLayer != 0)
			if (position.x < -collisionSize || position.x > width +collisionSize ||
				position.y < -collisionSize || position.y > height+collisionSize)
			{
				removeFromScene();
			}
	}

	boolean collision(Gameobject obj) {
		if (collisionLayer == obj.collisionLayer)
			return false;

		return  position.dist(obj.position) < collisionSize + obj.collisionSize;
	}

}