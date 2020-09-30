int offsetFromSide = 20;
int spacing = 20;

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

		fill(0xFF718EA4);
		dist = height + (int)(time/30) - (int)ghostScene.get(0).position.y;
		textAlign(LEFT);
		textSize(12);
		text("Distance: " + dist + " m", offsetFromSide, spacing);
		text("Lives: " + player.hp.hitPoints, offsetFromSide, spacing*2);
		text("Wave: " + waveController.waveCount, offsetFromSide, spacing*3);

		textAlign(CENTER);
		textSize(20);
		text(score, width/2, spacing*2);

		if(int(max(waveController.spawnNextWave -time,0)) > 0){
		textAlign(CENTER);
		textSize(14);
		if (waveController.willSpawn)
		text("Next wave in " + (int)max(waveController.spawnNextWave - time,0)/1000+ "s" , width/2, spacing*5);
}
	} 
	else {
		textAlign(CENTER);
		textSize(32);
		text("Game Over", width/2, height/2 - (spacing *3));
		textSize(15);
		text("Final score: " + score, width/2, height/2);
		float finalDistance = dist/1000;
		text("Distance traveled: " + finalDistance +" km", width/2, height/2 + (spacing*2));
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