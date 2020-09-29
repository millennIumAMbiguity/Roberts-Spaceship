void draw(){

	time = millis();
	background(0);



	if (!gameover){
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

		dist = height + (int)(time/30) - (int)ghostScene.get(0).position.y;
		text("score: " + score, 0, 8);
		text("distance: " + dist + "m", 0, 16);
		text("wave: " + waveController.waveCount, 0, 26);

	} else {
		textAlign(CENTER);
		text("Game Over", width/2, height/2);
		text("Final score: " + score, width/2, height/2 +30 );
		text("Distance traveled: " + dist +"m", width/2, height/2 +60);
	}

	for (Gameobject obj : ghostScene) {
		obj.draw();
	}




	//add new scene objects to scene
	ghostScene = new ArrayList<Gameobject>(scene);
}