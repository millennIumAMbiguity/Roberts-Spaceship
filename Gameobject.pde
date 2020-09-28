public class Gameobject {

	Transform transform;

	float collisionSize;

	int id;

	Gameobject() {
		addToScene();
		transform = new Transform();
		collisionSize = 8;
	}

	void addToScene() {
		id = scene.size();
		scene.add(this);
	}

	void removeFromScene() {
		scene.remove(id);
	}

	void draw() {}

	void move() {}

	boolean collision(Gameobject obj) {
		return  transform.position.dist(obj.transform.position) < collisionSize;
	}

}