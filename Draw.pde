int offsetFromSide = 20;
int spacing = 15;

void draw(){

	time = millis();
	background(0);



	if (!gameover){

		waveController.update();

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
		textAlign(LEFT);
		text("Score: " + score, offsetFromSide, spacing);
		text("Distance: " + dist + " m", offsetFromSide, spacing*2);
		text("Wave: " + waveController.waveCount, offsetFromSide, spacing*3);
		text("Lives: " + player.hp.hitPoints, offsetFromSide, spacing*4);
		if(int(max(waveController.spawnNextWave -time,0)) > 0){
		textAlign(CENTER);
		text("Next wave in: " + (int)max(waveController.spawnNextWave - time,0)/1000+ " s" , width/2, spacing*6);
}
	} 
	else {
		textAlign(CENTER);
		text("Game Over", width/2-spacing, height/2);
		text("Final score: " + score, width/2, height/2 +30 );
		float finalDistance = dist/1000;
		text("Distance traveled: " + finalDistance +" km", width/2+ spacing, height/2 +60);
	}

	for (Star star : starsInScene) {
		star.move();
	}

	for (Gameobject obj : ghostScene) {
		obj.draw();
	}




	//add new scene objects to scene
	ghostScene = new ArrayList<Gameobject>(scene);
}