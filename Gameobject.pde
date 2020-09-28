public class Gameobject {

	Transform transform;

	float collisionSize;

	int id;

	int objColor;

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
		return  transform.position.dist(obj.transform.position) < collisionSize;
	}

}