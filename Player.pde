class Player extends Gameobject {

	float playerSpeed = 8f;
	int guideMin = 100;

	PVector bulletPos;

	int bulletXOffset = 3;
	int bulletYOffset = -5;
	float bulletXSpeed = 0.2f;
	int bulletYSpeed = -2;


	public Player(){

		hp = new Health(3, 1200);
		collisionLayer = 0;
		objColor = 0xFF277554;
		objStrokeColor = 0xFF499273;
		position = new PVector(width/2, height - height/5);

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
		switch (stats.powerUps){
			case 0:
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,position);
			stats.shootsFired += 1;
			break;
			case 1:
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			stats.shootsFired += 2;
			break;
			case 2:
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(-bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			stats.shootsFired += 3;
			break;
			case 3:
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			stats.shootsFired += 4;
			break;
			case 4:
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(-bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(bulletXSpeed *2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(-bulletXSpeed *2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			stats.shootsFired += 5;
			break;
			case 5:
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed *2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed *2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			stats.shootsFired += 6;
			break;
			case 6:
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(-bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(-bulletXSpeed *2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(bulletXSpeed *2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(-bulletXSpeed *3,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(bulletXSpeed *3,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			stats.shootsFired += 7;
			break;
			case 7:
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed*1,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*1,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed*2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed*3,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*3,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			stats.shootsFired += 8;
			break;
			case 8:
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(-bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(bulletXSpeed*2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*3,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(bulletXSpeed*3,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*4,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(bulletXSpeed*4,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			stats.shootsFired += 9;
			break;
			case 9:
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed*2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*3,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed*3,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*4,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed*4,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			stats.shootsFired += 10;
			break;
			case 10:
			setBulletPos(0,bulletYOffset);
			setBulletSpeed(0,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed*2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*2,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed*3,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*3,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed*4,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*4,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(bulletXOffset,bulletYOffset);
			setBulletSpeed(bulletXSpeed*5,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			setBulletPos(-bulletXOffset,bulletYOffset);
			setBulletSpeed(-bulletXSpeed*5,bulletYSpeed);
			new Bullet(1,bulletSpeed,bulletPos);
			stats.shootsFired += 11;
			break;
		}
	}

	void setBulletPos(float xOffset, float yOffset){
		bulletPos = new PVector(position.x + xOffset, position.y + yOffset);
	}
	void setBulletSpeed(float xSpeed, float ySpeed){
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

	void drawGuideLine(){
		if(position.x - mouseX > guideMin || mouseX - position.x > guideMin ||
			position.y - mouseY > guideMin || mouseY - position.y > guideMin)
			line(position.x,position.y,mouseX,mouseY);	
	}
	
}