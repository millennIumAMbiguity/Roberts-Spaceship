int offsetFromSide = 20;
int spacing = 20;

void draw(){

	time = millis() - startTime;
	background(0);
	scale(screenScale);

	if (titleScreen) {
		intro();
	} 
	else {
		
		for (Gameobject obj : ghostScene) {
			obj.move();
		}

		for (Gameobject obj : ghostScene) {
			obj.outOfBounds();
		}

		for (Gameobject obj : ghostScene) {
			obj.collision();
		}

		for (Gameobject obj : ghostScene) {
			obj.action();
		}

		for (Star star : starsInScene) {
			star.move();
		}

		for (Gameobject obj : ghostScene) {
			obj.draw();
		}


		if (!gameover){

			waveController.update();

			fill(0xFF718EA4);
			drawGameUI();	
		} 
		else {
			drawGameOverScreenUI();
		}

		//add new scene objects to scene
		ghostScene = new ArrayList<Gameobject>(scene);
	}
}
