public class WaveFormationRandomAsteroids extends Wave{

	int unitHP = 1;

	PVector[] enemyShape = new PVector[] {
		new PVector(-8,0),
		new PVector(-6,-6),
		new PVector(0,-8),
		new PVector(6,-6),
		new PVector(8,0),
		new PVector(6,6),
		new PVector(0,8),
		new PVector(-6,6),
	};

	WaveFormationRandomAsteroids(int wave) {
		super(wave);

		float sqrtwave = sqrt(wave);
		units = new Enemy[(int)(sqrtwave*6)+1];

		for(int i =0; i < units.length; i++){

			PVector[] newEnemyShape = new PVector[enemyShape.length];

			for (int k = 0; k < newEnemyShape.length; ++k) {
				newEnemyShape[k] = new PVector(random(-2f, 2f), random(-2f, 2f));
				newEnemyShape[k].add(enemyShape[k]);
			}

			units[i] = new Enemy(new PVector(random(0, width), random(-height-(int)(sqrtwave*2), 0)), 
				velocity, //changing this wave velocity will change the velocity of all child "Enemy"s 
				this,
				unitHP,
				newEnemyShape);
			
			units[i].collisionSize = 16;
		}
	}

	void draw() {
		//debug draw
		/*
		super.draw();
		text("Wave.WaveFormationRandomAsteroids", position.x, position.y);
		text(units.length, position.x, position.y+8);
		*/
	}

}