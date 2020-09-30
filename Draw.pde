int offsetFromSide = 20;
int spacing = 15;

void draw(){

	time = millis();
	background(0x042037);



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
		text("Score: " + score, offsetFromSide, spacing);
		text("Distance: " + dist + "m", offsetFromSide, spacing*2);
		text("Wave: " + waveController.waveCount, offsetFromSide, spacing*3);
		text("Lives: " + player.hp.hitPoints, offsetFromSide, spacing*4);
		text("WaveDelay: " + (int)max(waveController.spawnNextWave - time,0)+ "ms" , offsetFromSide, spacing*5);

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