class Enemy extends Gameobject{

	Wave parent;

	boolean exist = true;

	Enemy(PVector pos, PVector vel, Wave parent, int hp){
		position = pos;
		velocity = vel;
		this.parent = parent;
		this.hp = new Health(hp, 200);
		collisionLayer = 2;
		objColor = color(255,0,0);

		bulletSpeed = new PVector(0,1);
		fireDelay = 2000;
		nextfire = time + (id&31)*100;
	}


	void outOfBounds(){
		if (collisionLayer != 0){
			if (position.y > height+collisionSize)
			{
				parent.cleenWave = false;
				removeFromScene();
			}
		}
	}

	void removeFromScene() {
		exist = false;
		scene.remove(id);
		waveController.removeEnemy(parent.wave);
		int sceneSize = scene.size();
		for (int i = id; i < sceneSize; ++i) {
			scene.get(i).id--;
		}
	}

	void fire() {
		if(position.y < 0)
			return;
		if (nextfire < time){
			nextfire = time + fireDelay;
			new Bullet(2,bulletSpeed,position.copy(),color(255,0,0));
		}
	}


}
