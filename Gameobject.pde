public class Gameobject
{
	Transform transform;
	PVector position;
	PVector velocity;

	Health hp;

	PVector bulletSpeed;
	long fireDelay;
	long nextfire;

	float collisionSize;
	int id;
	int objColor;
	int objStrokeColor = 0xFFFFFFFF;


	int collisionLayer;
	/*
	 0: player;
	 1: player bullets;
	 2: enemys;
	 3: enemy bullets
	 4: powerup
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

	boolean removed = false;
	void removeFromScene() {
		if (!removed){
			removed = true;
			scene.remove(id);
			int sceneSize = scene.size();
			for (int i = id; i < sceneSize; ++i) {
				scene.get(i).id--;
			}
		}
	}

	void draw() {
		stroke(objStrokeColor);
		if (hp.imunity())
			fill(objColor&0x4FFFFFFF);
		else
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

		//dont collide objects without collision
		if (collisionLayer != 4){

			if (hp == null || obj.hp == null)
				return false;

			//player imunity
			if (collisionLayer == 0)
				if (hp.imunity())
					return false;
			if (obj.collisionLayer == 0)
				if (obj.hp.imunity())
					return false;
		}
		
		//don't collide with objects on the same layer
		if (collisionLayer == obj.collisionLayer)
			return false;

		//dont collide player with playerbullets
		if (collisionLayer < 2 && obj.collisionLayer < 2)
			return false;

		//dont colide with enemys and enmys bullets
		if (collisionLayer > 1 && obj.collisionLayer > 1)
			return false;

		//bullets dont colide with bullets
		if (collisionLayer == 3 && obj.collisionLayer == 1 || collisionLayer == 1 && obj.collisionLayer == 3)
			return false;

		float collisionDist = (collisionSize + obj.collisionSize)/2f;

		//check if height is in range for a collision
		if (obj.position.y > position.y + collisionDist ||
			obj.position.y < position.y - collisionDist)
			return false;

		if ( position.dist(obj.position) < collisionDist) {
			if (collisionLayer == 0){ //hit player
				stats.timesTookDamage++;
				if (hp.sub(1)){ 
					//player died
					explosion.play();
					gameover = true;
					stats.gameTime = time;
					removeFromScene();
				} else {
					hitHurt.play();
				}
			} else {
				if (collisionLayer == 4) {
					stats.powerUps++;
					player.hp.add(1);
					removeFromScene();
				} else if (hp.sub(1)){
					if (collisionLayer == 2){
						score += hp.maxHP*5+fireDelay/400;
						//if (this.getClass().getName() == "Yrgo_Shooter_Project$Enemy"){
							stats.kills++;
						//}
						hitDamage.play(1,0,0.2);
					}
					removeFromScene();
				}
			}
			return true;
		}
		return false;
	}

}