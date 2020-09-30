public class WaveController {
	int waveCount = 0;

	int wave1Amount;
	int wave2Amount;

	Wave wave1;
	Wave wave2;

	long spawnNextWave;
	long spawnDelay = 10000;

	boolean willSpawn;

	WaveController() {
		spawnWave();
	}

	void update(){
		if (spawnNextWave != 0 && spawnNextWave < time){
			spawnWave();
		}
	}

	void removeEnemy(int waveId) {
		if (waveId == waveCount) {
			wave1Amount--;
			if (wave1Amount < 1 && spawnNextWave < time){
				spawnNextWave = time + spawnDelay;
				willSpawn = true;
			}
		} else {
			wave2Amount--;
			if (wave2Amount < 1 && spawnNextWave < time){
				spawnNextWave = time + spawnDelay;
				willSpawn = true;
			}
		}
	}

	void spawnWave() {
		spawnNextWave = 0;
		willSpawn = false;
		if (wave1 == null){
			wave1 = newWave(waveCount);
			wave1Amount = wave1.units.length;
			if (wave2 == null)
				spawnNextWave = time + spawnDelay;
		} else if (wave2 == null){
			wave2 = newWave(waveCount+1);
			wave2Amount = wave2.units.length;
		} else {

			if (wave1Amount < 1 && wave2Amount < 1){
				spawnNextWave = time + spawnDelay;
				willSpawn = true;
			}

			waveCount++;
			wave1Amount = wave2Amount;
			wave1 = wave2;

			wave2 = newWave(waveCount+1);
			wave2Amount = wave2.units.length;
		}
	}

	Wave newWave(int waveId){

		switch ((int)random(0, 3)) {
			case 0 :
			return new WaveFormationShooter(waveId);

			case 1 :
			return new WaveFormationUnit(waveId);
		}

		return new WaveFormationRandomAsteroids(waveId);
	}

}