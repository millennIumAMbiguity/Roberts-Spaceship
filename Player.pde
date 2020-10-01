class Player extends Gameobject {

	float playerSpeed = 8f;
	int guideMin = 100;

	PVector bulletPos;


	public Player(){

		hp = new Health(3, 1200);
		collisionLayer = 0;
		objColor = 0xFF277554;
		objStrokeColor = 0xFF499273;

		fireDelay = 400;
		bulletSpeed = new PVector(0,-2f);
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
			shootBullets();
		}
	}

	void shootBullets(){
		
		switch (stats.powerUps) {
		case 0:
			setBulletPos(0,-5);
			setBulletSpeed(0,-2);
			new Bullet(1,bulletSpeed,position.copy());
			stats.shootsFired++;
			break;
		case 1:
			setBulletPos(3,-5);
			setBulletSpeed(0,-2);
			bulletPos = new PVector(position.x + 3,position.y -5);
			new Bullet(1,bulletSpeed,bulletPos.copy());
			setBulletPos(-3,-5);
			setBulletSpeed(0,-2);
			bulletPos = new PVector(position.x - 3,position.y -5);
			new Bullet(1,bulletSpeed,bulletPos.copy());
			stats.shootsFired += 2;
			break;
		case 2:
			setBulletPos(0,-5);
			setBulletSpeed(0,-2);
			new Bullet(1,bulletSpeed,bulletPos.copy());
			setBulletPos(-3,-5);
			setBulletSpeed(-0.2f,-2);
			new Bullet(1,bulletSpeed,bulletPos.copy());
			setBulletPos(3,-5);
			setBulletSpeed(0.2f,-2);
			new Bullet(1,bulletSpeed,bulletPos.copy());
			setBulletPos(0,-5);
			setBulletSpeed(0,-2);
			stats.shootsFired += 3;
			break;
		case 3:
			break;
		case 4:
			break;
		case 5:
			break;
		case 6:
			break;
		case 7:
			break;
		case 8:
			break;
		case 9:
			break;
		case 10:
			break;
		}
	}

	void setBulletPos(float xOffset, float yOffset)
	{
		bulletPos = new PVector(position.x + xOffset, position.y + yOffset);
	}
	void setBulletSpeed(float xSpeed, float ySpeed)
	{
		bulletSpeed = new PVector(xSpeed,ySpeed);
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

		drawGuideLine();
	}

	void drawGuideLine()
	{
		if(position.x - mouseX > guideMin || mouseX - position.x > guideMin ||
			position.y - mouseY > guideMin || mouseY - position.y > guideMin)
			line(position.x,position.y,mouseX,mouseY);	
	}
	
}