void keyPressed() {
	if (titleScreen) {
        if (time > 1000) {
            waveController.spawnNextWave = time+500;
			titleScreen = false;
        }
    } else if (gameover) {
        if (time > stats.gameTime + 1000) {
            reset();
        }
    }
}