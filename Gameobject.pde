public class Gameobject {

	Transform transform;
	PVector position;
	PVector velocity;

	Health hp;

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
		hp = new Health(3);
		collisionSize = 8;
		objColor = color(255);
	}

	void addToScene() {
		id = scene.size();
		scene.add(this);
	}

	void removeFromScene() {
		scene.remove(id);
		int sceneSize = scene.size();
		for (int i = id; i < sceneSize; ++i) {
			scene.get(i).id--;
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

	void action() {}

	void collision(){
		for (Gameobject obj : ghostScene) {
			collision(obj);
		}
	}

	boolean collision(Gameobject obj) {
		//don't collide with objects on the same layer
		if (collisionLayer == obj.collisionLayer)
			return false;

		//dont collide player with playerbullets
		if (collisionLayer < 2 && obj.collisionLayer < 2)
			return false;

		float collisionDist = (collisionSize + obj.collisionSize)/2f;

		//check if height is in range for a collision
		if (obj.position.y > position.y + collisionDist ||
			obj.position.y < position.y - collisionDist)
			return false;

		if ( position.dist(obj.position) < collisionDist) {
			if (collisionLayer == 0){
				if (hp.sub(1))
					gameover = true;
			} else if (collisionLayer == 2){
				if (hp.sub(1))
					removeFromScene();
			}
			return true;
		}
		return false;
	}

}