public class WaveController 
{
	int waveCount = 0;

	int wave1Amount;
	int wave2Amount;

	Wave wave1;
	Wave wave2;

	long spawnNextWave;
	long spawnDelay = 10000;

	boolean willSpawn;

	int nextPowerup = -1;

	WaveController() {
		//spawnWave();
	}

	void update(){
		if (spawnNextWave != 0 && spawnNextWave < time){
			spawnWave();
		}
	}

	void removeEnemy(int waveId) {
		if (waveId == waveCount) {
			wave1Amount--;
			if (wave1Amount < 1){
				if (spawnNextWave < time)
					spawnNextWave = time + spawnDelay-1;
				willSpawn = true;
			}
		} 
		else {
			wave2Amount--;
			if (wave2Amount < 1){
				if (spawnNextWave < time)
					spawnNextWave = time + spawnDelay-1;
				willSpawn = true;
			}
		}
	}

	void spawnWave() {
		if (nextPowerup < waveCount)
			spawnPowerup();

		spawnNextWave = 0;
		willSpawn = false;
		stats.wave++;
		
		if (wave1 == null){
			wave1 = newWave(waveCount);
			wave1Amount = wave1.units.length;
			if (wave2 == null)
				spawnNextWave = time + spawnDelay-1;
		} 
		else if (wave2 == null){
			wave2 = newWave(waveCount+1);
			wave2Amount = wave2.units.length;
		} else {

			if (wave1Amount < 1 && wave2Amount < 1){
				spawnNextWave = time + spawnDelay-1;
				willSpawn = true;
			}

			waveCount++;
			wave1Amount = wave2Amount;
			wave1 = wave2;

			wave2 = newWave(waveCount+1);
			wave2Amount = wave2.units.length;
		}
	}

	void spawnPowerup(){
		nextPowerup = waveCount + (int)random(4,5+stats.powerUps);
		float p = random(width/2)+width/4;
		println("spawn powerup " + p + ", -10");
		new Powerup(new PVector(p,-10));
	}

	boolean lastWaveWasAstriods = true;
	Wave newWave(int waveId){

		switch ((int)random(0, 3)) {
			case 0 :
			lastWaveWasAstriods = false;
			return new WaveFormationShooter(waveId);

			case 1 :
			lastWaveWasAstriods = false;
			return new WaveFormationUnit(waveId);
		}

		if (!lastWaveWasAstriods){
			lastWaveWasAstriods = true;
			return new WaveFormationRandomAsteroids(waveId);
		} else {
			return new newWave(waveId);
		}
	}

}