public class Star
{
	PVector spawnZone;
	PVector position;
	PVector velocity;

	float starSize;
	int alphaH;

	Star(PVector spawnZone){
		this.spawnZone = spawnZone;
		position = new PVector(random(spawnZone.x,spawnZone.y),random(-200,sHeight -(sHeight/10)));
		setSize();
		setVelocity();
		starsInScene.add(this);
	}

	void setSize(){
		switch ((int)random(1,4)) {
			case 1:
			starSize = 1f;
			break;
			case 2:
			starSize = 1.5f;
			break;
			case 3:
			starSize = 2;
			break;
		}
	}

	void setVelocity(){
		if(starSize == 1f)
			velocity = new PVector(0,1);
		else if(starSize == 1.5f)
			velocity = new PVector(0,2);
		else
			velocity = new PVector(0,3);
	}

	void move(){
		position.add(velocity);
		stroke(255,255,255, starSize * 100);
		fill(255,255,255, starSize * 100 + 55);
		ellipse(position.x,position.y,starSize,starSize);
		if(position.y > sHeight)
		{
			// make changes to the x position and also vary the speed.
			position.y = -200;
			position.x = random(spawnZone.x,spawnZone.y);
			setSize();
			setVelocity();
		}

	}

}