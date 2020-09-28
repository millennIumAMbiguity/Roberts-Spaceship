public class Gameobject {

	Transform transform;
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
		ellipse(transform.position.x, transform.position.y, collisionSize, collisionSize);
	}

	void move() {
		transform.position.add(transform.velocity);
	}

	boolean collision(Gameobject obj) {
		if (collisionLayer == obj.collisionLayer)
			return false;

		return  transform.position.dist(obj.transform.position) < collisionSize;
	}

}