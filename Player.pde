class Player extends Gameobject {

	float playerSpeed = 8f;



	public Player(){

		hp = new Health(3, 1200);
		collisionLayer = 0;
		objColor = 0xFF277554;
		objStrokeColor = 0xFF499273;

		fireDelay = 400;
		bulletSpeed = new PVector(0,-1.5f);
	}

	void move(){
		velocity.x = mouseX - position.x;
		velocity.y = mouseY - position.y;

		velocity.limit(playerSpeed);
		position.add(velocity);
	}

	void action(){
		if (nextfire < time){
			nextfire = time + fireDelay;
			new Bullet(1,bulletSpeed,position.copy());
		}
	}

	void draw() {
		stroke(objStrokeColor);
		if (hp.imunity())
			fill(objColor&0x4FFFFFFF);
		else
			fill(objColor);

		//ellipse(position.x, position.y, collisionSize, collisionSize);

		beginShape();
		  vertex(-4 + position.x,  4 + position.y);
		  vertex(     position.x,  -6 + position.y);
		  vertex( 4 + position.x,  4 + position.y);
		  vertex(     position.x,  2 + position.y);
		endShape(CLOSE);
	}

	
}