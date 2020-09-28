public class WaveController {
	int waveCount;

	int wave1Amount;
	int wave2Amount;

	void removeEnemy(int waveId){
		if (waveId == waveCount) {
			wave1Amount--;
		} else {
			wave2Amount--;
		}
	}

}