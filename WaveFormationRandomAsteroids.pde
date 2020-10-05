public class WaveFormationRandomAsteroids extends Wave
{

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

			PVector pos = new PVector(random(0, width), random(-height-(int)(sqrtwave*2)));

			PVector v = new PVector(random(-0.2f,0.2f),random(-0.2f,0.2f));
			//dont slide out of the screen
			if (pos.x < width*0.2f && v.x < 0 || pos.x > width*0.8f && v.x > 0) {
				v.x = -v.x;
			}
			v.add(velocity);

			units[i] = new Enemy(
				pos, 
				v, 
				this,
				5,
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