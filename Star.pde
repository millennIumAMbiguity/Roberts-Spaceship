public class Star{

	PVector spawnZone;
	PVector position;
	PVector velocity;

	PVector size;

	Star(PVector spawnZone){
		this.spawnZone = spawnZone;
		velocity = new PVector(0,random(1,5));
		position = new PVector(random(spawnZone.x,spawnZone.y),random(-200,height -(height/10)));
		size = new PVector(random(1,2),random(1,3));
		starsInScene.add(this);
	}

	void move(){
		position.add(velocity);
		stroke(150,150,150);
		ellipse(position.x,position.y,1,2);
		if(position.y > height)
		{
			// make changes to the x position and also vary the speed.
			position.y = -200;
			position.x = random(spawnZone.x,spawnZone.y);
			velocity = new PVector(0,random(1, 5));
			size = new PVector(random(1,2),random(1,3));
		}

	}

}