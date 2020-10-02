public class WaveFormationShooter extends Wave
{
	int unitHP = 2;

	PVector[] enemyShape = new PVector[] {
		new PVector(0,-6),
		new PVector(-3,-5),
		new PVector(-5,0),
		new PVector(-6,1.5),
		new PVector(-4,3),
		new PVector(-6,4),
		new PVector(-4,5),
		new PVector(-5,4),
		new PVector(-2,2),
		new PVector(-1,3),

		new PVector(1,3),
		new PVector(2,2),
		new PVector(5,4),
		new PVector(4,5),
		new PVector(6,4),
		new PVector(4,3),
		new PVector(6,1.5),
		new PVector(5,0),
		new PVector(3,-5)
	};

	WaveFormationShooter(int wave) {
		super(wave);

		units = new Enemy[(int)(sqrt(wave)*5)+1];

		for(int i =0; i < units.length; i++) {
			units[i] = new Enemy(new PVector(i%2==0?width/2+((i*16)%(width/2))+8:width/2-((i*16)%(width/2))-8, -((i*16)/(width/2))*32), 
				velocity.copy(), 
				this,
				unitHP,
				enemyShape);
		}
	}

	void draw() {
		//debug draw
		/*
		super.draw();
		text("Wave.WaveFormationShooter", position.x, position.y);
		text(units.length, position.x, position.y+8);
		*/
	}

	void move() {
		position.add(velocity);

		for (Enemy obj : units) {
			if(obj.exist)
				obj.velocity.x = sin(obj.position.y/10f)*0.5f;
		}

	}

	void action() {

		for (Enemy obj : units) {
			if(obj.exist)
				obj.fire();
		}

	}


}