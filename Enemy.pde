class Enemy extends Gameobject{

	Wave parent;

	Enemy(PVector pos, PVector vel, Wave parent){
		position = pos;
		velocity = vel;
		this.parent = parent;

		collisionLayer = 2;
		objColor = color(255,0,0);
	}


	void outOfBounds(){
		if (collisionLayer != 0)
			if (position.y > height+collisionSize)
			{
				removeFromScene();
				waveController.removeEnemy(parent.wave);
			}
	}
}
