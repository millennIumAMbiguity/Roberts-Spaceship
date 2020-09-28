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
		//id = scene.size();
		//scene.add(this);
		ghostScene.add(this);
	}

	void removeFromScene() {
		if (collisionLayer == 0)
			return;
		
		ghostScene.remove(id);
		int sceneSize = ghostScene.size();
		for (int i = id +1; i < sceneSize; ++i) {
			ghostScene.get(i).id--;
		}
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

	void fire(){
		
	}

	boolean collision(Gameobject obj) {
		if (collisionLayer == obj.collisionLayer)
			return false;

		return  position.dist(obj.position) < collisionSize + obj.collisionSize;
	}

}