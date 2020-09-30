public class WaveFormationRandomAsteroids extends Wave{

	int unitHP = 2;

	WaveFormationRandomAsteroids(int wave) {
		super(wave);

		float sqrtwave = sqrt(wave);
		units = new Enemy[(int)(sqrtwave*6)+1];

		for(int i =0; i < units.length; i++){
			units[i] = new Enemy(new PVector(random(0, width), random(-height-(int)(sqrtwave*2), 0)), 
				velocity, //changing this wave velocity will change the velocity of all child "Enemy"s 
				this,unitHP);
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