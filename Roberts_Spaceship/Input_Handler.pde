void keyPressed() {
	if (key == CODED) {
		if (keyCode == java.awt.event.KeyEvent.VK_F1) {
			
			screenScale += 0.5;
			if (displayWidth < 1000 * screenScale || displayHeight < 600 * screenScale) {
				screenScale = 1;
			}
			
			int w = (int)(1000 * screenScale);
			int h = (int)(600 * screenScale);
			
			surface.setResizable(true);
			surface.setSize(w, h);
			surface.setResizable(false);
			
			//starsInScene = new ArrayList<Star>();
			//backdrop.setZones();
			
			return;
		}
	}
	
	if (titleScreen) {
		if (time > 1000) {
			waveController.spawnNextWave = time + 500;
			titleScreen = false;
		}
	} else if (gameover) {
		if (time > stats.gameTime + 1000) {
			reset();
		}
	}
}