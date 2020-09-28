public class WaveController {
	int waveCount;

	int wave1Amount;
	int wave2Amount;

	Wave wave1;
	Wave wave2;

	long spawnNextWave;

	WaveController() {
 		spawnWave();
	}

	void removeEnemy(int waveId) {
		if (waveId == waveCount) {
			wave1Amount--;
		} else {
			wave2Amount--;
		}
	}

	void spawnWave() {
		if (wave1 == null){
			wave1 = newWave(waveCount);
			wave1Amount = wave1.units.length;
		} else if (wave2 == null){
			wave2 = newWave(waveCount+1);
			wave2Amount = wave2.units.length;
		} else {
			waveCount++;
			wave1Amount = wave2Amount;
			wave1 = wave2;

			wave2 = newWave(waveCount+1);
			wave2Amount = wave2.units.length;
		}
	}

	Wave newWave(int waveId){
		return new WaveFormationRandomAsteroids(waveId);
	}

}